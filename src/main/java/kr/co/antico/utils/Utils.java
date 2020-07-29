package kr.co.antico.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;



public class Utils {
	

	public static void makeThumbnail(String uploadPath, String datePath, String newName) throws IOException {
		File f1 = new File(uploadPath+File.separator+datePath, newName);
		BufferedImage sourceImg = ImageIO.read(f1);
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 100);
		
		String thumbnailName = uploadPath+File.separator+datePath+File.separator+"s_"+newName;
		
		File newFile = new File(thumbnailName);
		
		String format = newName.substring(newName.lastIndexOf(".")+1).toUpperCase();
		
		ImageIO.write(destImg, format, newFile);
		
		
		
	}
	
	public static MediaType getMediaType(String format) {
		Map<String, MediaType> map = new HashMap<String, MediaType>();
		map.put("JPG", MediaType.IMAGE_JPEG);
		map.put("JPEG", MediaType.IMAGE_JPEG);
		map.put("PNG", MediaType.IMAGE_PNG);
		map.put("GIF", MediaType.IMAGE_GIF);
		
		MediaType mType = map.get(format.toUpperCase());
		
		return mType;
	}
	
	public static String getFormat(String fileName) {
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
