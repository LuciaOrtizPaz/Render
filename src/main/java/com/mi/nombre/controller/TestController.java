package com.mi.nombre.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {


    @GetMapping("/name/{nombre}")
    public String sayHello(@PathVariable String nombre) {
        return "Hola, " + nombre + "!!";
    }
}