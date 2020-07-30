package kr.co.antico.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.antico.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService Service;
	
	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public void management() {
		
	}
	
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String delete(@PathVariable String no, HttpSession session) {
		
		int isOk = Service.deleteNo(no);
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
	
}
