package com.dfong.security.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebSecurity
public class WebConfig implements WebMvcConfigurer {
	
	@Override
	 public void addViewControllers(ViewControllerRegistry registry) {
	        //registry.addViewController("/home").setViewName("home");
	        //registry.addViewController("/").setViewName("home");
	        //registry.addViewController("/hello").setViewName("hello");
	        registry.addViewController("/login").setViewName("login");
	    }
	
	

//	@Override
//	public void addViewControllers(ViewControllerRegistry registry) {
//		// TODO Auto-generated method stub
//		WebMvcConfigurer.super.addViewControllers(registry);
//		registry.addViewController("/login").setViewName("auth/login");
//		registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
//	}
	

}
