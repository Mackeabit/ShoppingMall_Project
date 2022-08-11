package com.noproduct.project;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.AdminProductDAO;
import util.Common;
import vo.ProductVO;
import vo.ProductVO2;

@Controller
public class AdminProductController {

	@Autowired
	AdminProductDAO admin_product_dao;
	
	@Autowired//자동주입 어노테이션 
	ServletContext application;
	
	@RequestMapping(value = "/admin_product_register.do")
	public String admin_product_register() {
		return Common.ADMIN_PATH + "product/product_register.jsp";
	}
	
	@RequestMapping(value = "/admin_product_list.do")
	public String admin_product_list(Model model) {
		List<ProductVO> list = admin_product_dao.selectList();
		for(int i = 0; i<=list.size()-1; i++) {
			if(list.get(i).getPd_cnt() == 0) {
				int res = admin_product_dao.updateStatus2(list.get(i).getPd_idx());
			}
		}
		model.addAttribute("list", list);
		
		return Common.ADMIN_PATH + "product/product_list.jsp";
	}
	
	@RequestMapping(value = "/admin_search_product.do")
	public String admin_search_product(Model model, String menu, String word) {
		List<ProductVO> list = null;
		
		if(menu.contains("pd_nm")) {
			list = admin_product_dao.selectName(word);
		}
		if(menu.contains("category_cd")) {
			int num = Integer.parseInt(word);
			list = admin_product_dao.selectCode(num);
		}
				
		model.addAttribute("list", list);
		return Common.ADMIN_PATH + "product/product_list.jsp";
	}
	
	@RequestMapping("/admin_status_modify.do")
	public String admin_product_modify(String status, int pd_idx) {
		ProductVO vo = new ProductVO();
		if(status.equals("일반상품")) {
			vo.setPd_status(0);
		} else if(status.equals("품절")) {
			vo.setPd_status(1);
		} else if(status.equals("판매중지")) {
			vo.setPd_status(2);
		} else if(status.equals("이벤트상품")) {
			vo.setPd_status(5);
		} else {
			vo.setPd_status(6);
		} 
		vo.setPd_idx(pd_idx);
		int res = admin_product_dao.updateStatus(vo);
		return "redirect:admin_product_view.do?idx="+pd_idx;
	}
	
	@RequestMapping("/admin_cost_modify.do")
	public String admin_product_modify2(int pd_cost, String pd_nm, int pd_idx) {
		List<ProductVO> list = admin_product_dao.selectProduct(pd_nm);
		for(int i = 0; i<=list.size()-1; i++) { 
			ProductVO vo = new ProductVO();
			vo.setPd_cost(pd_cost);
			vo.setPd_idx(list.get(i).getPd_idx()); 
			int res = admin_product_dao.updateCost(vo);
		}
		return "redirect:admin_product_view.do?idx="+pd_idx;
	}
	
	@RequestMapping("/admin_price_modify.do")
	public String admin_product_modify3(int pd_price, String pd_nm, int pd_idx) {
		List<ProductVO> list = admin_product_dao.selectProduct(pd_nm);
		for(int i = 0; i<=list.size()-1; i++) { 
			ProductVO vo = new ProductVO();
			vo.setPd_price(pd_price);
			vo.setPd_idx(list.get(i).getPd_idx()); 
			int res = admin_product_dao.updatePrice(vo);
		}
		return "redirect:admin_product_view.do?idx="+pd_idx;
	}
	
	@RequestMapping("/admin_cnt_modify.do")
	public String admin_product_modify4(int pd_cnt, int pd_idx) {
		ProductVO productVO = admin_product_dao.selectOne(pd_idx);
		ProductVO vo = new ProductVO();
		vo.setPd_cnt(pd_cnt);
		vo.setPd_idx(pd_idx);
		if(pd_cnt == 0) {
			int res = admin_product_dao.updateCnt(vo);
			int res2 = admin_product_dao.updateStatus2(pd_idx);
		} else if(productVO.getPd_cnt() == 0) {
			int res = admin_product_dao.updateCnt(vo);
			int res3 = admin_product_dao.updateStatus3(pd_idx);
		} else {
			int res = admin_product_dao.updateCnt(vo);
		}
		return "redirect:admin_product_view.do?idx="+pd_idx;
	}
	
	@RequestMapping("/admin_ex_modify.do")
	public String admin_product_modify4(String pd_ex, String pd_nm, int pd_idx) {
		List<ProductVO> list = admin_product_dao.selectProduct(pd_nm);
		for(int i = 0; i<=list.size()-1; i++) { 
			ProductVO vo = new ProductVO();
			vo.setPd_ex(pd_ex);
			vo.setPd_idx(list.get(i).getPd_idx()); 
			int res = admin_product_dao.updateEx(vo);
		}
		return "redirect:admin_product_view.do?idx="+pd_idx;
	}
	
	
	@RequestMapping("/admin_nm_modify.do")
	public String admin_product_modify5(String pd_nm2, String pd_nm, int pd_idx) {
		List<ProductVO> list = admin_product_dao.selectProduct(pd_nm2);
		for(int i = 0; i<=list.size()-1; i++) { 
			ProductVO vo = new ProductVO();
			vo.setPd_nm(pd_nm); 
			vo.setPd_idx(list.get(i).getPd_idx()); 
			int res = admin_product_dao.updateNm(vo); 
		}
		return "redirect:admin_product_view.do?idx="+pd_idx;
	}
	
	@RequestMapping("/admin_image_modify_form.do")
	public String admin_image_modify_form(int pd_idx, String pd_nm, Model model) {
		model.addAttribute("pd_idx", pd_idx);
		model.addAttribute("pd_nm", pd_nm);
		return Common.ADMIN_PATH + "product/image_modify_form.jsp";
	}
	
	@RequestMapping("/admin_image_modify_form1.do")
	public String admin_image_modify_form1(int pd_idx, String pd_nm, Model model) {
		model.addAttribute("pd_idx", pd_idx);
		model.addAttribute("pd_nm", pd_nm);
		return Common.ADMIN_PATH + "product/image_modify_form1.jsp";
	}
	
	@RequestMapping("/admin_image_modify_form2.do")
	public String admin_image_modify_form2(int pd_idx, String pd_nm, Model model) {
		model.addAttribute("pd_idx", pd_idx);
		model.addAttribute("pd_nm", pd_nm);
		return Common.ADMIN_PATH + "product/image_modify_form2.jsp";
	}
	
	@RequestMapping("/admin_image_modify.do")
	public String admin_image_modify(MultipartFile photo, int pd_idx, String pd_nm) {
		String webPath = "c:/loc_img";
		String savePath = webPath;
		System.out.println(savePath);
		
		//String savePath = "c:/myupload";
		//업로드된 파일 정보
		String filename = "no_file";
		if(!photo.isEmpty()) {
			//업로드될 실제 파일명
			filename = photo.getOriginalFilename();
			//파일을 저장할 경로
			File saveFile = new File(savePath, filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더 형탤 변환이 불가하므로 
				//업로드 시간을 붙여서 이름이 중복되는 것을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			try {
				//물리적으로 파일을 업로드하는 코드
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<ProductVO> list = admin_product_dao.selectProduct(pd_nm);
		for(int i = 0; i<=list.size()-1; i++) { 
			ProductVO vo = new ProductVO();
			vo.setPd_img(filename);
			vo.setPd_idx(list.get(i).getPd_idx()); 
			int res = admin_product_dao.imageModify(vo);
		}
		return "redirect:admin_product_view.do?idx="+ pd_idx;
	}
	
	@RequestMapping("/admin_image_modify1.do")
	public String admin_image_modify1(MultipartFile photo, int pd_idx, String pd_nm) {
		String webPath = "c:/loc_img";
		String savePath = webPath;
		System.out.println(savePath);
		
		//String savePath = "c:/myupload";
		//업로드된 파일 정보
		String filename = "no_file";
		if(!photo.isEmpty()) {
			//업로드될 실제 파일명
			filename = photo.getOriginalFilename();
			//파일을 저장할 경로
			File saveFile = new File(savePath, filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더 형탤 변환이 불가하므로 
				//업로드 시간을 붙여서 이름이 중복되는 것을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			try {
				//물리적으로 파일을 업로드하는 코드
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<ProductVO> list = admin_product_dao.selectProduct(pd_nm);
		for(int i = 0; i<=list.size()-1; i++) { 
			ProductVO vo = new ProductVO();
			vo.setPd_img1(filename);
			vo.setPd_idx(list.get(i).getPd_idx()); 
			int res = admin_product_dao.imageModify1(vo);
		}
		return "redirect:admin_product_view.do?idx="+ pd_idx;
	}
	
	@RequestMapping("/admin_image_modify2.do")
	public String admin_image_modify2(MultipartFile photo, int pd_idx, String pd_nm) {
		String webPath = "c:/loc_img";
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
		//String savePath = "c:/myupload";
		//업로드된 파일 정보
		String filename = "no_file";
		if(!photo.isEmpty()) {
			//업로드될 실제 파일명
			filename = photo.getOriginalFilename();
			//파일을 저장할 경로
			File saveFile = new File(savePath, filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더 형탤 변환이 불가하므로 
				//업로드 시간을 붙여서 이름이 중복되는 것을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			try {
				//물리적으로 파일을 업로드하는 코드
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<ProductVO> list = admin_product_dao.selectProduct(pd_nm);
		for(int i = 0; i<=list.size()-1; i++) { 
			ProductVO vo = new ProductVO();
			vo.setPd_img2(filename);
			vo.setPd_idx(list.get(i).getPd_idx()); 
			int res = admin_product_dao.imageModify2(vo);
		}
		return "redirect:admin_product_view.do?idx="+ pd_idx;
	}
	
	
	@RequestMapping(value ="/admin_product_view.do")
	public String admin_product_view(Model model, int idx) {
		ProductVO vo = admin_product_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		return Common.ADMIN_PATH + "product/product_view.jsp";
	}
	
	@RequestMapping(value = "/admin_product_insert_form.do")
	public String admin_product_insert_form(Model model, ProductVO2 vo, String status) {
		String webPath = "c:/loc_img";
		String savePath = webPath;
		System.out.println(savePath);
		
		//String savePath = "c:/myupload";
		//업로드된 파일 정보
		MultipartFile photo = vo.getPd_img();
		MultipartFile photo1 = vo.getPd_img1();
		MultipartFile photo2 = vo.getPd_img2();
		String filename = "no_file";
		String filename1 = "no_file";
		String filename2 = "no_file";
		if(!photo.isEmpty()) {
			//업로드될 실제 파일명
			filename = photo.getOriginalFilename();
			//파일을 저장할 경로
			File saveFile = new File(savePath, filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더 형탤 변환이 불가하므로 
				//업로드 시간을 붙여서 이름이 중복되는 것을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			try {
				//물리적으로 파일을 업로드하는 코드
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(!photo1.isEmpty()) {
			//업로드될 실제 파일명
			filename1 = photo1.getOriginalFilename();
			//파일을 저장할 경로
			File saveFile1 = new File(savePath, filename1);
			if(!saveFile1.exists()) {
				saveFile1.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더 형탤 변환이 불가하므로 
				//업로드 시간을 붙여서 이름이 중복되는 것을 방지
				long time = System.currentTimeMillis();
				filename1 = String.format("%d_%s", time, filename1);
				saveFile1 = new File(savePath, filename1);
			}
			try {
				//물리적으로 파일을 업로드하는 코드
				photo1.transferTo(saveFile1);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(!photo2.isEmpty()) {
			//업로드될 실제 파일명
			filename2 = photo2.getOriginalFilename();
			//파일을 저장할 경로
			File saveFile2 = new File(savePath, filename2);
			if(!saveFile2.exists()) {
				saveFile2.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더 형탤 변환이 불가하므로 
				//업로드 시간을 붙여서 이름이 중복되는 것을 방지
				long time = System.currentTimeMillis();
				filename2 = String.format("%d_%s", time, filename2);
				saveFile2 = new File(savePath, filename2);
			}
			try {
				//물리적으로 파일을 업로드하는 코드
				photo2.transferTo(saveFile2);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		ProductVO vo2 = new ProductVO();
		vo2.setCategory_cd(vo.getCategory_cd());
		vo2.setPd_cnt(vo.getPd_cnt());
		vo2.setPd_cost(vo.getPd_cost());
		vo2.setPd_ex(vo.getPd_ex());
		vo2.setPd_idx(vo.getPd_idx());
		vo2.setPd_nm(vo.getPd_nm());
		vo2.setPd_price(vo.getPd_price());
		vo2.setPd_size(vo.getPd_size());
		if(status.equals("일반상품")) {
			vo2.setPd_status(0);
		} else if(status.equals("이벤트상품")) {
			vo2.setPd_status(5);
		} else {
			vo2.setPd_status(6);
		}
		vo2.setPd_img(filename);
		vo2.setPd_img1(filename1);
		vo2.setPd_img2(filename2);
		
		int res = admin_product_dao.product_insert(vo2);
		
		return "admin_product_list.do";
	}
}