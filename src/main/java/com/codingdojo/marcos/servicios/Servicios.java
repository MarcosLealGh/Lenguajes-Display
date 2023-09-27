package com.codingdojo.marcos.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.codingdojo.marcos.modelos.Lenguaje;
import com.codingdojo.marcos.repositorios.RepositorioLenguajes;

@Service
public class Servicios {
	//conexion con el repositorio
	@Autowired
	private RepositorioLenguajes repoLeng;
	
	//findAll
	public List<Lenguaje>encuentraLeng(){
		return repoLeng.findAll();
	}
	
	//save
	public Lenguaje crearLenguaje(Lenguaje lenguaje) {
	    return repoLeng.save(lenguaje);
	}
	
	//borrar 
	public void borrarLenguaje(Long id) {
		 repoLeng.deleteById(id);
	}
	//getById
	
	//find by id
	public Lenguaje getLengById(Long id) {
	    return repoLeng.findById(id).orElse(null); 
	}

	//Update 
	public Lenguaje updateLenguaje(Lenguaje lenguaje) {
		return repoLeng.save(lenguaje);
		
	}
	
}
