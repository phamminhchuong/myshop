package util;

import java.io.InputStream;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FilenameUtils;

import model.bean.Cat;

public class function {
	public static void getcatwithbeaty(List<Cat> list,ArrayList<Cat> listResult,String str, int parent_id) {
		for (Cat cat : list) {
			if (cat.getId_parent() == parent_id) {
				cat.setNamec(str+cat.getNamec());
				listResult.add(cat);
				getcatwithbeaty(list,listResult,str+"|--->",cat.getId_cat());
			}
		}
	}
	
	public static String changeNameIMG(String name,int value) {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssa");
		String result ="IMAGE"+ dateTime.format(formatter)+value+"."+FilenameUtils.getExtension(name);
		return result;
	}
	
	public static String getCode(int lenghtCode) {
		String code = "";
		String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lower = upper.toLowerCase();
		String digits = "0123456789";
		String symbol = upper+lower+digits;
		Random a = new Random();
		for (int i = 0; i < lenghtCode; i++) {
			code += symbol.charAt(a.nextInt(symbol.length()));
		}
		return code;
	}
	
	
	public static int get1USDtoVND() {
		int result = 0;
		try {
			URL url = new URL("https://www.valutafx.com/USD-VND.htm");
			InputStream is = url.openStream();
			int ptr = 0;
			StringBuffer buffer = new StringBuffer();
			while ((ptr = is.read()) != -1) {
			    buffer.append((char)ptr);
			}
			String a = buffer.toString();
			int b = a.indexOf("<div class=\"rate-value\">");
			String c = a.substring(b+24, b+32);
			result = Integer.parseInt(c.replace(",", ""));
			}catch (Exception e) {
				result = 23500;
			}
		return result;
	}
	
	public static String getNameImage(String name) {
		String arrName[] = name.split(" ");
		String nameNew = "";
		for (int i = arrName.length-1; i >= 0; i--) {
			nameNew += arrName[i].charAt(0);
			if (nameNew.length() > 1) {
				break;
			}
		}
		String nameTrue = new StringBuffer(nameNew).reverse().toString().toUpperCase();
		nameTrue.replace('Á', 'A');
		
		nameTrue.replace('À', 'A');
		nameTrue.replace('Ạ', 'A');
		nameTrue.replace('Ả', 'A');
		nameTrue.replace('Ã', 'A');
		
		nameTrue.replace('Ấ', 'A');
		nameTrue.replace('Ầ', 'A');
		nameTrue.replace('Ẩ', 'A');
		nameTrue.replace('Ậ', 'A');
		nameTrue.replace('Ẫ', 'A');
		
		nameTrue.replace('Ắ', 'A');
		nameTrue.replace('Ằ', 'A');
		nameTrue.replace('Ặ', 'A');
		nameTrue.replace('Ẳ', 'A');
		nameTrue.replace('Ẵ', 'A');
		
		nameTrue.replace('Ư', 'U');
		nameTrue.replace('Ứ', 'U');
		nameTrue.replace('Ừ', 'U');
		nameTrue.replace('Ữ', 'U');
		nameTrue.replace('Ự', 'U');
		nameTrue.replace('Ử', 'U');
		
		nameTrue.replace('Ơ', 'O');
		nameTrue.replace('Ớ', 'O');
		nameTrue.replace('Ờ', 'O');
		nameTrue.replace('Ỡ', 'O');
		nameTrue.replace('Ở', 'O');
		nameTrue.replace('Ợ', 'O');
		
		nameTrue.replace('Ê', 'E');
		nameTrue.replace('Ế', 'E');
		nameTrue.replace('Ề', 'E');
		nameTrue.replace('Ể', 'E');
		nameTrue.replace('Ễ', 'E');
		nameTrue.replace('Ệ', 'E');
		
		
		
		return nameTrue;
	}
}
