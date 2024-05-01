package com.teste.hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@SpringBootApplication
@RestController
public class HelloApplication {

	@GetMapping("/")
	public String getMessage() {
		return "Hurray! Openshift deployment is succesful";
	}
	
	@PostMapping("/{name}")
	public String getMessage(@PathVariable String name){
		return "Your name is " + name;
	}
	public static void main(String[] args) {
		SpringApplication.run(HelloApplication.class, args);
	}

}
