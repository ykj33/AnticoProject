package kr.co.antico.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.antico.service.AdminService;
import kr.co.antico.utils.Utils;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;


@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping("/optionupload")
	public void optionupload(GoodsOptionDTO[] options) {
		System.out.println(options);
	}
	
	
//	private String uploadPath = RestController.class.getResource("").getPath();
//	private String uploadPath = "C:" + File.separator + "BBB";
	@RequestMapping(value = "/imgupload")
	public void uploadajax(MultipartHttpServletRequest request, HttpSession session) throws IOException {
		
		String uploadPath = session.getServletContext().getRealPath(File.separator+"resources");
		

		String goods_no = request.getParameter("goods_no");
		String goods_nm = request.getParameter("goods_nm");
		String makr = request.getParameter("makr");
		String goods_category = request.getParameter("goods_category");
		String goods_info_text = request.getParameter("goods_info_text");
		
		String realUploadPath = uploadPath+File.separator+"goods_img"+File.separator+goods_no;
		
		File dir = new File(realUploadPath);
		
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		String[] imgName = new String[2];
		imgName[0] = goods_no+"_main";
		imgName[1] = goods_no+"_info";
		int i = 0;
		Iterator<String> files = request.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = request.getFile(uploadFile);
			String orgFileName = mFile.getOriginalFilename();
			try {
				String format = Utils.getMediaType(orgFileName);
				if(format!=null) {
					imgName[i] += "."+format; 
				}
				mFile.transferTo(new File(realUploadPath +File.separator+ imgName[i++]));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		aService.goodsInsert(new GoodsDTO(goods_no, goods_nm, makr, goods_category, imgName[0], imgName[1], goods_info_text));
		 

	}
	
	
}
