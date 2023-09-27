package com.codingdojo.marcos.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.marcos.modelos.Lenguaje;


@Repository
public interface RepositorioLenguajes extends CrudRepository<Lenguaje, Long> {
	List<Lenguaje> findAll();
	
	List<Lenguaje> findByName(String name);

}
