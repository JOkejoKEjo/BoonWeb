package controller;

import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Gold;
import entity.Pawnshop;
import entity.ProposePrice;
import service.GoldService;
import service.PawnshopService; 

@Controller
public class PawnshopController {
	
	@EJB(mappedName = "ejb:/BoonEJB//PawnshopServiceBean!service.PawnshopService")
	PawnshopService pawnshopServ;
	

	@EJB(mappedName = "ejb:/BoonEJB//GoldServiceBean!service.GoldService")
	GoldService goldService;
	
	@RequestMapping("/pawnshopForm")
	public ModelAndView newPawner(){
		ModelAndView mv = new ModelAndView("pawnshopForm.jsp");
		Pawnshop pawnshop = new Pawnshop();
		mv.addObject("pawnshop" ,pawnshop);
		return mv;
	}
	
	@RequestMapping("/listPawnshop")
	public ModelAndView listPawnshop(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("listPawnshop.jsp");
		List<Pawnshop> pawnshopList;
		try{
			pawnshopList = pawnshopServ.getAllPawnshop();
			mv.addObject("pawnshopList",pawnshopList);
		}catch (Exception e){
			e.printStackTrace();
		}return mv;
	}
	
	@RequestMapping("/savePawnshop")
	public String savePawnshop(@ModelAttribute("pawnshop") Pawnshop pawnshop, BindingResult result, HttpServletRequest request){
		try {
			if (pawnshop.getPawnshopId() == 0){
				pawnshopServ.insert(pawnshop);
			}else{
				pawnshopServ.update(pawnshop);
			}
		}catch (Exception e){
			return "redirect:pawnshopForm.do";
		}return "redirect:login.do";
	}
	
	@RequestMapping("/editPawnshop")
	public ModelAndView editPawnshop(HttpServletRequest request){
		long paramId = (long) request.getSession().getAttribute("id");
		Pawnshop foundPawnshop;
		ModelAndView mv = new ModelAndView("pawnshopForm.jsp");
		try{
			foundPawnshop = pawnshopServ.findPawnshopById(paramId);
			mv.addObject("pawnshop",foundPawnshop);
		}catch (Exception e){
			e.printStackTrace();
		}return mv;
	}
	
	@RequestMapping("/deletePawnshop")
	public String deletePawnshop(HttpServletRequest request){
		pawnshopServ.delete(Long.valueOf(request.getParameter("id")));
		return "redirect:pawnshopList.do";
	}
	
	
	
	@RequestMapping("/pawnshopIndex")
	public ModelAndView pawnshopIndex(@ModelAttribute("proposePrice") ProposePrice proposePrice, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pawnshopIndex.jsp");
		
		Pawnshop pawnshop = new Pawnshop();
		
		List<Gold> listGold;
		try {
			long userId =  (long) request.getSession().getAttribute("id");
			pawnshop = pawnshopServ.findPawnshopById(userId);
			listGold = goldService.findGoldByPawnshopId(userId);
			mv.addObject("pawnshop", pawnshop);
			mv.addObject("listGold",listGold);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
}
