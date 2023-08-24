package com.ravi.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class DemoApplication {
	@GetMapping("/")
    public String index(final Model model) {
        model.addAttribute("title", "Java Spring Boot application using Maven is Running !!");
        return "index";
    }

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}
