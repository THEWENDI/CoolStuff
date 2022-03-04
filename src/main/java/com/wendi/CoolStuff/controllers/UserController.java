package com.wendi.CoolStuff.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.wendi.CoolStuff.models.Comment;
import com.wendi.CoolStuff.models.Commentb;
import com.wendi.CoolStuff.models.LoginUser;
import com.wendi.CoolStuff.models.User;
import com.wendi.CoolStuff.services.CommentService;
import com.wendi.CoolStuff.services.CommentbService;
import com.wendi.CoolStuff.services.UserService;



@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	 private CommentService commentService;
	
	@Autowired
	 private CommentbService commentbService;
	

	
	@GetMapping("/coolstuff")
	public String testing() {
		
		return "guestdashboard.jsp";
	}
	
	
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("newUser", new User()); //FOR REGISTER
		model.addAttribute("newLogin", new LoginUser()); //FOR LOGIN
		return "login.jsp";
	}
	

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	userService.register(newUser, result);

        if(result.hasErrors()) { // UNSUCCESSFUL
            model.addAttribute("newLogin", new LoginUser());
            return "login.jsp";
        }else { //SUCCESS
        	session.setAttribute("userId", newUser.getId());
        	return "redirect:/dashboard";
        }
    }
	
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
         User user = userService.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login.jsp";
        }
    
    	session.setAttribute("userId", user.getId());
    	return "redirect:/dashboard";
    }
    
    
    @GetMapping("/dashboard")
    public String dashboard( @ModelAttribute("comment") Comment comment, @ModelAttribute("commentb") Commentb commentb,Model model,HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/coolstuff";
    	}
        User user = userService.oneUser((Long) session.getAttribute("userId"));
        List <Comment> allComments = commentService.allComments();
        model.addAttribute("allComments", allComments);
        List <Commentb> allCommentbs = commentbService.allCommentbs();
        model.addAttribute("allCommentbs", allCommentbs);
        model.addAttribute("user", user);
    	return "dashboard.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/coolstuff";
    }
    
	
	
}
