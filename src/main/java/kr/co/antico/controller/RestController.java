package kr.co.antico.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@org.springframework.web.bind.annotation.RestController
public class RestController {

	
	//<img id="main" src='/displaythumb?img_name=     '/>  사용방법
	@RequestMapping(value = "/displaythumb", method = RequestMethod.GET)
	public byte[] displaythumb(String img_name, HttpSession session) {
		String uploadPath = session.getServletContext().getRealPath(File.separator + "resources");
		img_name = img_name.replace('/', File.separatorChar);
		img_name = img_name.substring(0, img_name.lastIndexOf(File.separatorChar)+1)+"s_"+img_name.substring(img_name.lastIndexOf(File.separatorChar)+1);
		System.out.println(img_name);
		InputStream in = null;
		byte[] result = null;
		try {
			
			in = new FileInputStream(uploadPath + img_name);
			result = IOUtils.toByteArray(in);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (in != null)
					in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return result;
		
	}
	
	//<img id="main" src='/displayfile?img_name=     '/>  사용방법
	@RequestMapping(value = "/displayfile", method = RequestMethod.GET)
	public byte[] displayfile(String img_name, HttpSession session) {
		String uploadPath = session.getServletContext().getRealPath(File.separator + "resources");
		img_name = img_name.replace('/', File.separatorChar);
		InputStream in = null;
		byte[] result = null;
		try {

			in = new FileInputStream(uploadPath + img_name);
			result = IOUtils.toByteArray(in);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (in != null)
					in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return result;

	}
	

}
