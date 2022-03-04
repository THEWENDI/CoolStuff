package com.wendi.CoolStuff.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wendi.CoolStuff.models.Commentb;

@Repository
public interface CommentbRepository extends CrudRepository<Commentb, Long> {

	List<Commentb> findAll();
}
