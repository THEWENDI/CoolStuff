package com.wendi.CoolStuff.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wendi.CoolStuff.models.Comment;
import com.wendi.CoolStuff.repositories.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepo;
	
    //get all
    public List<Comment> allComments() {
        return commentRepo.findAll();
    }
    
    //get one
    public Comment oneComment(Long id) {
        Optional<Comment> potentialComment = commentRepo.findById(id);
        if(potentialComment.isPresent()) {
            return potentialComment.get();
        }else {
        	return null;
        }
    }
    
    //create
    public Comment saveComment(Comment comment) {
        return commentRepo.save(comment);
    }
	
    //update
    public Comment updateComment(Comment comment) {
        return commentRepo.save(comment);
    }
    
    //delete
    public void deleteComment(Long id) {
    	commentRepo.deleteById(id);
    }

}

