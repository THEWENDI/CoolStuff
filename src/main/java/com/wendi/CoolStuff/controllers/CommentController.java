package com.wendi.CoolStuff.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.wendi.CoolStuff.models.Comment;
import com.wendi.CoolStuff.models.Commentb;
import com.wendi.CoolStuff.models.LoginUser;
import com.wendi.CoolStuff.models.User;
import com.wendi.CoolStuff.services.CommentService;
import com.wendi.CoolStuff.services.CommentbService;
import com.wendi.CoolStuff.services.UserService;

@Controller
public class CommentController {
	
    @Autowired
    private CommentService commentService;
	
    @Autowired
    private UserService userService;
    
    @Autowired
    private CommentbService commentbService;
	
    @PostMapping("/comment/new")
    public String processcommentForm(@Valid @ModelAttribute("comment") Comment comment,@ModelAttribute("commentb") Commentb commentb, 
        BindingResult result, Model model, HttpSession session) {
        
        if (session.getAttribute("userId") == null) {
            model.addAttribute("loginUser", new LoginUser());
    		return "redirect:/";
        }
        if(result.hasErrors()) {
            return "dashboard.jsp";
        }else {
        	User user = userService.oneUser((Long) session.getAttribute("userId"));
        	comment.setUser(user);
        	commentService.saveComment(comment);
        	return "redirect:/dashboard";
        }
    }
    

    
    
    //delete
	@DeleteMapping("/delete/{id}")
	public String deleteBook(@PathVariable("id")Long id) {
		commentService.deleteComment(id);
		return "redirect:/dashboard";
	}
    
    
    @PostMapping("/commentb/new")
    public String processcommentbForm(@Valid @ModelAttribute("commentb") Commentb commentb,@ModelAttribute("comment") Comment comment,
        BindingResult result, Model model, HttpSession session) {
        
        if (session.getAttribute("userId") == null) {
            model.addAttribute("loginUser", new LoginUser());
    		return "redirect:/";
        }
        if(result.hasErrors()) {
            return "dashboard.jsp";
        }else {
        	User user = userService.oneUser((Long) session.getAttribute("userId"));
        	commentb.setUser(user);
        	commentbService.saveCommentb(commentb);
        	return "redirect:/dashboard";
        }
    }
    

    
    
    //delete
	@DeleteMapping("/deleteb/{id}")
	public String deleteBookb(@PathVariable("id")Long id) {
		commentbService.deleteCommentb(id);
		return "redirect:/dashboard";
	}
    
    
    

}
