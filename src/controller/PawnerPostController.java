package controller;

import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Pawner;
import entity.PawnerPost;
import service.PawnerPostService;
import service.PawnerService;
import service.PawnshopService;

@Controller
public class PawnerPostController {
	
	@EJB(mappedName = "ejb:/BoonWeb//PawnerPostServiceBean!service.PawnerPostService")
	PawnerPostService pawnerPostService;
	
	@EJB(mappedName = "ejb:/BoonWeb//PawnerServiceBean!service.PawnerService")
	PawnerService pmService;
	
	@EJB(mappedName = "ejb:/BoonWeb//PawnshopServiceBean!service.PawnshopService")
	PawnshopService pawnshopServ;
	
	@RequestMapping("/pawner-post-form")
	public ModelAndView newGold(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pawnerPostForm.jsp");
		long userId = (long) request.getSession().getAttribute("id");
		Pawner pm = pmService.findPawnerById(userId);
		PawnerPost pawnerPost = new PawnerPost();
		pawnerPost.setPawner(pm);
		mv.addObject("pawnerPost", pawnerPost);
		return mv;
	}
	
	@RequestMapping("/savePost")
	public String savePost(@ModelAttribute("pawnerPost") PawnerPost pawnerPost, BindingResult result,
			HttpServletRequest request) {
		Date date = new Date();
		try {
			System.out.println(pawnerPost.getClass());
			if (0 == pawnerPost.getPawnerPostId()) { 
				pawnerPost.setPawnerPostDate(date);
				pawnerPostService.insert(pawnerPost);
			} else {
				pawnerPostService.update(pawnerPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:pawner-post-list.html";
	}
	
	
	@RequestMapping("/deletePost")
	public String removeGold(HttpServletRequest request) {
		String pawnerId = (String) request.getSession().getAttribute("pawner"); // ***************warring
		long goldId = Long.parseLong(request.getParameter("id"));
		pawnerPostService.delete(goldId);
		return "redirect:pawner-post-list.html";
	}
	
	@RequestMapping("/pawner-post-list")
	public ModelAndView listGold(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pawnerPostList.jsp");
		Pawner pawner;
		List<PawnerPost> pawnerPosts;
		try {
			long userId = (long) request.getSession().getAttribute("id");
			pawner = pmService.findPawnerById(userId);
			pawnerPosts = pawnerPostService.findPawnerPostByPawnerId(userId);
	
			mv.addObject("pawner", pawner);
			mv.addObject("pawnerPosts", pawnerPosts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	

}
