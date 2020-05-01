package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Defines.Defines;
import model.bean.AmountPro;
import model.bean.Cat;
import model.bean.Color;
import model.bean.Image;
import model.bean.Product;
import model.bean.ProductColor;
import model.bean.ProductSize;
import model.dao.AmountProDao;
import model.dao.CatDao;
import model.dao.ColorDao;
import model.dao.ContactDao;
import model.dao.ImageDao;
import model.dao.OrderDao;
import model.dao.ProDao;
import model.dao.ProductColorDao;
import model.dao.ProductSizeDao;
import model.dao.UserDAO;
import util.function;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	@Autowired
	private ProDao proDao;
	@Autowired
	private CatDao catDao;
	@Autowired
	private ColorDao colorDao;
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private ProductColorDao productcolorDao;
	@Autowired
	private ServletContext context;
	@Autowired
	private ProductSizeDao productSizeDao;
	@Autowired
	private AmountProDao amountProDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ContactDao contactDao;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		List<Cat> listCat = catDao.getallCat();
		ArrayList<Cat> listcatbeaty = new ArrayList<Cat>();
		// làm đẹp cat bằng đệ quy
		function.getcatwithbeaty(listCat, listcatbeaty, "", 0);
		modelMap.addAttribute("listCat", listcatbeaty);

		List<Color> liscolor = colorDao.getallColor();
		modelMap.addAttribute("listColor", liscolor);
		modelMap.addAttribute("actPro", "active");
		modelMap.addAttribute("userDao", userDao);
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());
	}

	@RequestMapping(value = { "/product", "/product/{i}" })
	public String index(@PathVariable(value = "i", required = false) Integer i,
			@RequestParam(value = "search",required = false) String search, ModelMap modelMap) {
		if(search == null) {
			search = "";
		}else {
			modelMap.addAttribute("Search", search);
		}
		if (i == null) {
			i = 1;
		}
		int numProduct = proDao.countProduct(search);
		int numPage = (int) Math.ceil((float) numProduct / Defines.ROW_COUNT);
		int offset = (i - 1) * Defines.ROW_COUNT;
		List<Image> listimage = new ArrayList<Image>();
		List<Image> list  = imageDao.getallImage();
		List<Integer> id = new ArrayList<Integer>();
		for (Image image : list) {
			if(!id.contains(image.getId_product())) {
				listimage.add(image);
				id.add(image.getId_product());
			}
		}
		List<Product> listPro = proDao.getproductbyOffset(offset,search);
		modelMap.addAttribute("listproductcolor", productcolorDao.getallproductColor());
		modelMap.addAttribute("listcolor", colorDao.getallColor());
		modelMap.addAttribute("listsize", productSizeDao.getallproductsize());
		modelMap.addAttribute("listcat", catDao.getallCat());
		modelMap.addAttribute("listimage", listimage);
		modelMap.addAttribute("numPage", numPage);
		modelMap.addAttribute("curPage", i);
		
		modelMap.addAttribute("listPro", listPro);

		return "admin.product.index";
	}

	@RequestMapping("/product/add")
	public String pageadd() {
		return "admin.product.add";
	}

	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String xlpageAdd(@ModelAttribute("product") Product product,@RequestParam(value = "listmau",required = false) String[] listmau,
			@RequestParam(value = "listsize",required = false) String[] listsize,@RequestParam("file") List<MultipartFile> multipartFile,RedirectAttributes ra) {
			//thêm sản phẩm vô database
			//int id_product = 0;
			//try {
				int id_product = proDao.addproduct(product);
			//}catch (Exception e) {
				//ra.addFlashAttribute("msg", 0);
				//return "redirect:/admin/product";
			//}
			String appPath = context.getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if(!createDir.exists()){
			createDir.mkdirs();
			}
			
			//Nếu có mau mới thêm vô
			if(listmau!=null || listmau.length != 0) {
			//thêm màu sản phẩm
				for (int i = 0; i < listmau.length; i++) {
					ProductColor pcolor = new ProductColor(id_product, Integer.parseInt(listmau[i]));
					productcolorDao.addProductColor(pcolor);
				}
			}
			
			//Nếu có size mới thêm vô
			if(listsize!=null) {
			//thêm size sản phẩm
				for (int i = 0; i < listsize.length; i++) {
					ProductSize objProductSize = new ProductSize(0, listsize[i], id_product);
					productSizeDao.addProductSize(objProductSize);
				}
			}
			
			//thêm số lượng cho sản phẩm
			if(listmau!=null || listmau.length != 0) {
				for (int i = 0; i < listmau.length; i++) {
					if(listsize!=null ) {
						for (int j = 0; j < listsize.length; j++) {
							
							AmountPro obj = new AmountPro(0, id_product, Integer.parseInt(listmau[i]), listsize[j], 0);
							amountProDao.addAmountForProduct(obj);
						}
					}else {
						AmountPro obj = new AmountPro(0, id_product, Integer.parseInt(listmau[i]), "", 0);
						amountProDao.addAmountForProduct(obj);
					}
				}
			}
			if ((listsize!=null )&&(listmau==null || listmau.length == 0) ) {
					for (int j = 0; j < listsize.length; j++) {
						AmountPro obj = new AmountPro(0, id_product,0, listsize[j], 0);
						amountProDao.addAmountForProduct(obj);
					}
			}
			
			
			int value = 0;
		  for (MultipartFile file : multipartFile) {
			//thay đổi tên ảnh
		 	String nameIMG = function.changeNameIMG(file.getOriginalFilename(),value);
		 	value++;
		 	
		 	
		 	String filePath = dirPath + File.separator + nameIMG;
		 	File url = new File(filePath);
		 	System.out.println(url);
		 	try {
				file.transferTo(url);
				//thêm vô database
				imageDao.addImage(new Image(0, nameIMG, id_product));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		
		  if (id_product > 0) {
				ra.addFlashAttribute("msg", 1);
			} else {
				ra.addFlashAttribute("msg", 0);
			}
		return "redirect:/admin/product";
	}
	
	@RequestMapping("/product/edit/{id}")
	public String pageedit(@PathVariable("id") int id_product,ModelMap modelMap) {
	
		Product Objpro = proDao.getProductbyID(id_product);
		List<ProductColor> listproductcolor = productcolorDao.getcolorbyProduct(id_product);
		List<Image> listimg = imageDao.getimagebyidProduct(id_product);
		modelMap.addAttribute("listsize", productSizeDao.getsizebyProduct(id_product));
		modelMap.addAttribute("Objpro", Objpro);
		modelMap.addAttribute("listproductcolor", listproductcolor);
		modelMap.addAttribute("listimg", listimg);
		return "admin.product.edit";
	}
	
	@RequestMapping(value = "/product/edit",method = RequestMethod.POST)
	public String pageedit(@ModelAttribute("product") Product product,@RequestParam(value = "listmau",required = false) String[] listmau
			,@RequestParam(value = "listsize",required = false) String[] listsize,@RequestParam("file") List<MultipartFile> multipartFile,RedirectAttributes ra) {
		
		
		int id_product = product.getId_pro();
		//xóa toàn bộ color có id_product trong bảng colorproduct
		//xong add lại cái mới
		productcolorDao.delproductcolorbyIDPro(id_product);
		if(listmau!=null) {
		//thêm màu sản phẩm
			for (int i = 0; i < listmau.length; i++) {
				ProductColor pcolor = new ProductColor(id_product, Integer.parseInt(listmau[i]));
				productcolorDao.addProductColor(pcolor);
			}
		}
		//xóa toàn bộ rồi add lại
		productSizeDao.delproductsizebyIDPro(id_product);
		if(listsize!=null) {
			for (int i = 0; i < listsize.length; i++) {
				ProductSize obj = new ProductSize(0, listsize[i], id_product);
				productSizeDao.addProductSize(obj);
			}
		}
		
		//xóa toàn bộ số lượng sản phẩm rồi add lại
		amountProDao.delAllAmountProbyIdPro(id_product);
		//add
		//thêm số lượng cho sản phẩm
		if(listmau!=null) {
			for (int i = 0; i < listmau.length; i++) {
				if(listsize!=null ) {
					for (int j = 0; j < listsize.length; j++) {
						
						AmountPro obj = new AmountPro(0, id_product, Integer.parseInt(listmau[i]), listsize[j], 0);
						amountProDao.addAmountForProduct(obj);
					}
				}else {
					AmountPro obj = new AmountPro(0, id_product, Integer.parseInt(listmau[i]), "", 0);
					amountProDao.addAmountForProduct(obj);
				}
			}
		}
		if ((listsize!=null)&&(listmau==null || listmau.length == 0) ) {
				for (int j = 0; j < listsize.length; j++) {
					AmountPro obj = new AmountPro(0, id_product,0, listsize[j], 0);
					amountProDao.addAmountForProduct(obj);
				}
		}
		//---------------------------------------------------------------
		//Nếu có hình mới thêm vô
		  int value = 0;
		  boolean checkimage = true;
		  for (MultipartFile file : multipartFile) {
			//kiểm tra có ảnh k
			  if(file.getOriginalFilename().equals("") || file.getOriginalFilename() == null) {
				  checkimage = false;
				  break;
				  
			  }
			//thay đổi tên ảnh
		 	String nameIMG = function.changeNameIMG(file.getOriginalFilename(),value);
		 	value++;
		 	String appPath = context.getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if(!createDir.exists()){
			createDir.mkdirs();
			}
		 	String filePath = dirPath + File.separator + nameIMG;
		 	File url = new File(filePath);
		 	System.out.println(url);
		 	try {
				file.transferTo(url);
				//thêm vô database
				imageDao.addImage(new Image(0, nameIMG, id_product));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
		  //nếu không chọn ảnh
		  if(!checkimage) {
			  //mà ảnh cũ không còn thì báo khách hàng phải chọn ảnh
			if(imageDao.getimagebyidProduct(id_product).isEmpty()) {
				ra.addFlashAttribute("erorrImage", "Sản phẩm phải có ảnh nên vui lòng chọn ảnh !");
				return "redirect:/admin/product/edit/"+id_product;
			}
		  }
		  int process = proDao.editProduct(product);
		  if (process > 0) {
				ra.addFlashAttribute("msg", 1);
			} else {
				ra.addFlashAttribute("msg", 0);
			}
		  
		return "redirect:/admin/product";
	}
	
	@RequestMapping("/product/amount/{id}")
	public String indexAmountPro(@PathVariable("id") int id_product,ModelMap modelmap) {
		modelmap.addAttribute("listAmountPro", amountProDao.getAmountByIdAmount(id_product));
		modelmap.addAttribute("listColor", colorDao.getallColor());
		modelmap.addAttribute("objPro", proDao.getProductbyID(id_product));
		return "admin.product.amount";
	}
	
	@RequestMapping(value = "/product/amount/edit",method = RequestMethod.POST)
	public void proAmountEdit(@RequestParam("id") int id_amountPro,@RequestParam("amount") int amount,HttpServletResponse response ) {
		PrintWriter out =null;
		try {out = response.getWriter();} catch (Exception e) {}
		int process = amountProDao.setAmountProById(id_amountPro,amount);
		if (process > 0) {
			out.print("<div class=\"alert alert-success\">Update thành công</div>");
			
		} else {
			out.print("<div class=\"alert alert-danger\">Update thất bại</div>");
		}
	}
	@RequestMapping("/product/del/{id}")
	public String delproduct(@PathVariable("id") int id_product,RedirectAttributes ra) {
		int process = proDao.delprobyID(id_product);
		List<Image> listimg = imageDao.getimagebyidProduct(id_product);
		int process1 = productcolorDao.delproductcolorbyIDPro(id_product);
		int process2= imageDao.delimagebyidProduct(id_product);
		for (Image image : listimg) {
			String appPath = context.getRealPath("");
			String dirPath = appPath + Defines.DIR_UPLOAD;
			String pathname = dirPath+File.separator+image.getNameimg();
			//String pathname = context.getRealPath("")+Defines.DIR_UPLOAD+File.separator+image.getNameimg();
			System.out.println(pathname);
			File delfile = new File(pathname);
			delfile.delete();
		}
		
		 if (process > 0) {
				ra.addFlashAttribute("msg", 1);
			} else {
				ra.addFlashAttribute("msg", 0);
			}
		  
		return "redirect:/admin/product";
	}
	
	
}
