package com.wendi.CoolStuff.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wendi.CoolStuff.models.Commentb;
import com.wendi.CoolStuff.repositories.CommentbRepository;

@Service
public class CommentbService {
	
	@Autowired
	private CommentbRepository commentbRepo;
	
    //get all
    public List<Commentb> allCommentbs() {
        return commentbRepo.findAll();
    }
    
    //get one
    public Commentb oneCommentb(Long id) {
        Optional<Commentb> potentialComment = commentbRepo.findById(id);
        if(potentialComment.isPresent()) {
            return potentialComment.get();
        }else {
        	return null;
        }
    }
    
    //create
    public Commentb saveCommentb(Commentb commentb) {
        return commentbRepo.save(commentb);
    }
	
    //update
    public Commentb updateCommentb(Commentb commentb) {
        return commentbRepo.save(commentb);
    }
    
    //delete
    public void deleteCommentb(Long id) {
    	commentbRepo.deleteById(id);
    }

}

