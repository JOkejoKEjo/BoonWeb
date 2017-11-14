package controller;

import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Pawner;
import service.PawnerService;

@Controller
public class PawnerController {
	
	@EJB(mappedName = "ejb:/BoonEJB//PawnerServiceBean!service.PawnerService")
	PawnerService pmService;
	
	@RequestMapping("/pawnerForm")
	public ModelAndView newPawnshop(){
		ModelAndView mv = new ModelAndView("pawnerForm.jsp");
		Pawner pawner = new Pawner();
		mv.addObject("pawner",pawner);
		return mv;
	}
	
	@RequestMapping("/savePawner")
	public String savePawnshop(@ModelAttribute("pawner") Pawner pawner, BindingResult result, HttpServletRequest request){
		try {
			if (pawner.getPawnerId() == 0){
				pmService.insert(pawner);
			}else{
				pmService.update(pawner);
			}
		}catch (Exception e){
		}return "redirect:listPawner.do";
	}
	
	@RequestMapping("/editPawner")
	public ModelAndView editEmp(HttpServletRequest request) {
		int paramId = Integer.parseInt(request.getParameter("id"));
		Pawner foundPawner;
		ModelAndView mv = new ModelAndView("pawnerForm.jsp");
		try {
			foundPawner = pmService.findPawnerById(paramId);
			mv.addObject("pawner", foundPawner);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/deletePawner")
	public String deletePawner(HttpServletRequest request){
		pmService.delete(Long.valueOf(request.getParameter("id")));
		return "redirect:listPawner.do";
	
	}
	
	@RequestMapping("/listPawner")
	public ModelAndView listEmployee(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("listPawner.jsp");
		List<Pawner> pawnerList;
		try {
			pawnerList = pmService.getAllPawner();
			mv.addObject("pawnerList", pawnerList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
}
