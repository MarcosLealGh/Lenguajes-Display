package com.codingdojo.marcos.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.marcos.modelos.Lenguaje;
import com.codingdojo.marcos.servicios.Servicios;

import jakarta.validation.Valid;

@Controller
public class ControladorLenguaje {
	@Autowired
	private Servicios servicio; 
	
	@GetMapping("/lenguajes")
	public String listaLenguajes(Model model) {
	    List<Lenguaje> lenguajes = servicio.encuentraLeng();
	    model.addAttribute("lenguajes", lenguajes);
	    model.addAttribute("lenguaje", new Lenguaje()); // Agrega un objeto Lenguaje vacío al modelo
	    return "dashboard.jsp";
	}


	@GetMapping("/lenguajes/{id}")
	public String getLenguaje(@PathVariable Long id, Model model) {
	    Lenguaje lenguaje = servicio.getLengById(id);
	    model.addAttribute("lenguaje", lenguaje); // Nombre de atributo: "lenguaje" (objeto individual)
	    return "lenguaje_view.jsp";
	}

	@PostMapping("/lenguajes/crear")
	public String createLanguage(@ModelAttribute @Valid Lenguaje lenguaje, BindingResult result, Model model) {
	    if (result.hasErrors()) {
	        return "dashboard.jsp";
	    }
	    servicio.crearLenguaje(lenguaje);
	    
	    List<Lenguaje> lenguajes = servicio.encuentraLeng();
	    model.addAttribute("lenguajes", lenguajes); // Nombre de atributo: "lenguajes" (lista)
	    
	    return "redirect:/lenguajes";
	}

	@GetMapping("/lenguajes/{id}/edit")
	public String editLenguaje(@PathVariable Long id,
								Model model) {
	    Lenguaje lenguaje = servicio.getLengById(id);
	    model.addAttribute("lenguaje", lenguaje); // Nombre de atributo: "lenguaje" (objeto individual)
	    return "leng_edit.jsp";	
	}

	@PutMapping("/lenguajes/{id}")
	public String updateLenguaje(@PathVariable Long id,
								 @ModelAttribute @Valid Lenguaje updatedLenguaje,
								 BindingResult result,
							 	 Model model) {
	    if (result.hasErrors()) {
	        Lenguaje lenguaje = servicio.getLengById(id);

	    	 model.addAttribute("lenguaje", lenguaje);
	        return "leng_edit.jsp";
	        
	    } else {
	        servicio.updateLenguaje(updatedLenguaje);
	        return "redirect:/lenguajes";
	    }
	}

	@DeleteMapping("/lenguajes/{id}/delete")
	public String deleteLenguaje(@PathVariable Long id) {
	    servicio.borrarLenguaje(id);
	    return "redirect:/lenguajes";
	}
}
