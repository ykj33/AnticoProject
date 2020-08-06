package kr.co.antico.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.FaultAction;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.antico.service.AdminService;
import kr.co.antico.utils.Utils;
import kr.co.domain.GoodsDTO;
import kr.co.domain.GoodsOptionDTO;
import kr.co.domain.OrderDTO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value = "/ordermanagement", method = RequestMethod.GET)
	public void ordermanagement() {
		
	}
	
	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public void management() {
		
	}
	
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String delete(@PathVariable String no, HttpSession session) {
		
		int isOk = service.deleteNo(no);
		if(isOk == 1) {
			try {
				String uploadPath = session.getServletContext().getRealPath(File.separator + "resources");
				String dataPath = File.separator + "goods_img" + File.separator + no;
				File folder = new File(uploadPath+dataPath);
				
				if(folder.exists()) {
					File[] files = folder.listFiles();
					
					for(int i=0;i<files.length;i++) {
						if(files[i].isFile()) {
							files[i].delete();
						}
					}
					
					folder.delete();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		return "redirect:/admin/management";
	}
	
	@RequestMapping("/ex")
	public void ex() {
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		
	}
	
	
//	여기서 부터 ajax
	
	@ResponseBody
	@RequestMapping(value = "/statuschange", method = RequestMethod.POST)
	public void statuschange(@RequestBody Map<String, String> map) {
		System.out.println(map.get("no"));
		System.out.println(map.get("info"));
		service.changeOrderStatus(map);
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/deliverylist", method = RequestMethod.GET)
	public List<OrderDTO> deliverylist() {
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		list = service.getDeliveryList();
		return list;   
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/optioninput", method = RequestMethod.POST)
	public void optioninput(GoodsOptionDTO dto) {
		
		service.optioninput(dto);
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/optiondelete", method = RequestMethod.GET)
	public void optiondelete(HttpServletRequest request) {
		
		service.specific_optiondelete(new GoodsOptionDTO(request.getParameter("no"), -1, -1, request.getParameter("size"), request.getParameter("color")));
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/getoption/{info}", method = RequestMethod.GET)
	public List<GoodsOptionDTO> getoption(@PathVariable("info") String info) {
		
		List<GoodsOptionDTO> data = service.getOption(info);
		
		return data;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/imgupdate", method = RequestMethod.POST)
	public String imgupdate(MultipartHttpServletRequest request,  HttpSession session) throws IOException {

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
				//파일이 존재하고 이미지파일이면 저장
				String format = Utils.getFormat(orgFileName);
				if (format != null) {
					imgName[i] += "." + format;
					String str = uploadPath +imgName[i++];
					mFile.transferTo(new File(str));
					
				} else {
				//파일이 없거나 이미지 파일이 아님
				//원래 이름으로 계속 유지되어야 함.
					imgName[i++]="";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if(!(Utils.getFormat(imgName[0])==null)) {
			Utils.makeThumbnail(uploadPath, datePath, imgName[0].substring(imgName[0].lastIndexOf(File.separatorChar)+1));
		}
		imgName[0] = imgName[0].replace(File.separatorChar, '/');
		imgName[1] = imgName[1].replace(File.separatorChar, '/');
		service.goodsUpdate(
				new GoodsDTO(goods_no, goods_nm, makr, goods_category, imgName[0], imgName[1], goods_info_text));
		
		return goods_no;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/goodsidentify", method = RequestMethod.POST)
	public GoodsDTO goodsidentify(String no, HttpServletRequest request) {
		GoodsDTO dto = service.getGoods(no);
		
		return dto;
	}
	
	

	

	@ResponseBody
	@RequestMapping(value = "/optionupload", method = RequestMethod.POST)
	public String optionupload(@RequestBody List<GoodsOptionDTO> list) throws Exception {
		
		service.goodsoptioninsert(list);
		
		return list.get(0).getGoods_no();
		
	}

	@ResponseBody
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
		service.goodsInsert(
				new GoodsDTO(goods_no, goods_nm, makr, goods_category, imgName[0], imgName[1], goods_info_text));

	}
	
}
