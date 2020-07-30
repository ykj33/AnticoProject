package kr.co.antico.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import kr.co.antico.service.AdminService;
import kr.co.antico.utils.Utils;
import kr.co.domain.Ex;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private AdminService aService;

	
	
	@RequestMapping(value = "/goodsidentify", method = RequestMethod.POST)
	public GoodsDTO goodsidentify(String no, HttpServletRequest request) {
		GoodsDTO dto = aService.getGoods(no);
		
		return dto;
	}
	
	
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
	

	@RequestMapping(value = "/extest", method = RequestMethod.POST)
	public void extest(Ex ex) {
		System.out.println(ex.getIn1());
		System.out.println(ex.getIn2());
	}

	@RequestMapping(value = "/optionupload", method = RequestMethod.POST)
	public String optionupload(HttpServletRequest request) {
		boolean isOk = false;
		String str = null;
		
		String formdata = request.getParameter("jsonData");
		formdata = formdata.substring(1);

		formdata = formdata.substring(0, formdata.length() - 1);

		String[] arr = formdata.split(",");

		List<GoodsOptionDTO> list = new ArrayList<GoodsOptionDTO>();

		for (int i = 0; i < arr.length; i++) {

			String msg = arr[i];

			msg = msg.substring(1, msg.length() - 1);

			String[] arr2 = msg.split("&");

			String[] var = new String[arr2.length];

			for (int j = 0; j < arr2.length; j++) {

				String msg2 = arr2[j];

				String[] arr3 = msg2.split("=");

				for (int k = 0; k < arr3.length; k++) {

					if (k == 1) {

						var[j] = arr3[k];

					}

				}

			}
			if(var[1]!=null) {
				isOk = true;
			}
			if(isOk) {
			GoodsOptionDTO dto = new GoodsOptionDTO(var[0], Integer.valueOf(var[1]), Integer.valueOf(var[2]), var[3],
					var[4]);
			list.add(dto);
			}
			str = var[0];
		}
		if(isOk) {
		aService.goodsoptioninsert(list);
		}
		return str;
		
	}

	@RequestMapping(value = "/imgupload")
	public void uploadajax(MultipartHttpServletRequest request, HttpSession session) throws IOException {

		String uploadPath = session.getServletContext().getRealPath(File.separator + "resources");
		

		String goods_no = request.getParameter("goods_no");
		String goods_nm = request.getParameter("goods_nm");
		String makr = request.getParameter("makr");
		String goods_category = request.getParameter("goods_category");
		String goods_info_text = request.getParameter("goods_info_text");
		
		String datePath = "goods_img" + File.separator + goods_no;
		File dir = new File(uploadPath+File.separator + datePath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		String[] imgName = new String[2];
		imgName[0] = File.separator + datePath +File.separator + goods_no + "_main";
		imgName[1] = File.separator + datePath +File.separator + goods_no + "_info";
		int i = 0;
		Iterator<String> files = request.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = request.getFile(uploadFile);
			String orgFileName = mFile.getOriginalFilename();
			try {
				String format = Utils.getFormat(orgFileName);
				if (format != null) {
					imgName[i] += "." + format;
					String str = uploadPath +imgName[i++];
					mFile.transferTo(new File(str));
					
				} else {
					imgName[i++] = "";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if(!Utils.getFormat(imgName[0]).equals("")) {
			Utils.makeThumbnail(uploadPath, datePath, imgName[0].substring(imgName[0].lastIndexOf(File.separatorChar)+1));
		}
		imgName[0] = imgName[0].replace(File.separatorChar, '/');
		imgName[1] = imgName[1].replace(File.separatorChar, '/');
		aService.goodsInsert(
				new GoodsDTO(goods_no, goods_nm, makr, goods_category, imgName[0], imgName[1], goods_info_text));

	}

}
