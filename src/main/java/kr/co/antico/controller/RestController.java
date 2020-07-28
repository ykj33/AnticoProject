package kr.co.antico.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.antico.service.AdminService;
import kr.co.antico.utils.Utils;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;

@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private AdminService aService;

	//<img id="main" src='/displayfile?goods_no=    &&img_name=     '/>  사용방법
	@RequestMapping(value = "/displayfile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayfile(String goods_no, String img_name, HttpSession session) {
		String uploadPath = session.getServletContext().getRealPath(File.separator + "resources");
		uploadPath = uploadPath + File.separator+"goods_img"+File.separator+goods_no+File.separator;
		ResponseEntity<byte[]> entity = null;

		InputStream in = null;

		try {
			String format = img_name.substring(img_name.lastIndexOf('.') + 1);
			MediaType mType = Utils.getMediaType(format);
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + img_name);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment;filename=\"" + new String(img_name.getBytes("UTF-8"), "ISO-8859-1"));
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST); // 통신상태 넘겨주기
		} finally {
			try {
				if (in != null)
					in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return entity;

	}
	

	@RequestMapping(value = "/uploadtest", method = RequestMethod.POST)
	public String uploadtest(@RequestBody Map<String, Object> map, HttpSession session, HttpServletRequest request) throws IOException {
		
		return "OK";
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

		String realUploadPath = uploadPath + File.separator + "goods_img" + File.separator + goods_no;
		File dir = new File(realUploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		String[] imgName = new String[2];
		imgName[0] = goods_no + "_main";
		imgName[1] = goods_no + "_info";
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
					String str = realUploadPath + File.separator + imgName[i++];
					mFile.transferTo(new File(str));
				} else {
					imgName[i++] = "";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		aService.goodsInsert(
				new GoodsDTO(goods_no, goods_nm, makr, goods_category, imgName[0], imgName[1], goods_info_text));

	}

}
