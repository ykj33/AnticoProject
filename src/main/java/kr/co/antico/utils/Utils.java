package kr.co.antico.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;


public class Utils {
	
	public static String getMediaType(String fileName) {
		String format = fileName.substring(fileName.lastIndexOf(".")+1);
		Map<String, String> map = new HashMap<String, String>();
		map.put("JPG", "JPG");
		map.put("JPEG", "JPEG");
		map.put("PNG", "PNG");
		map.put("GIF", "GIF");
		
		String mType = map.get(format.toUpperCase());
		
		return mType;
	}
	
	public static String getKey(boolean lowerCheck, int size) {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num <= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char)num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
}
