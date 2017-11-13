package controller;

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
	
	@RequestMapping("/savaPawner")
	public String savePawnshop(@ModelAttribute("pawner") Pawner pawner, BindingResult result, HttpServletRequest request){
		try {
			if (pawner.getPawnerId() == 0){
				pmService.insert(pawner);
			}else{
				pmService.update(pawner);
			}
		}catch (Exception e){
		}return "redirect:index.do";
	}
	
	@RequestMapping("/deletePawner")
	public String deletePawner(HttpServletRequest request){
		pmService.delete(Long.valueOf(request.getParameter("id")));
		return "redirect:listPawner.do";
	
	}
}
