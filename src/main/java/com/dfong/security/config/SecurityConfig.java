package com.dfong.security.config;

import java.util.ArrayList;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import com.dfong.security.util.PassthruEncoder;

@Configuration
@EnableGlobalMethodSecurity(securedEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private CustomUserDetailsService uds;
	
	@Autowired
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(uds).passwordEncoder(passwordEncoder());
	}
	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http
//				.authorizeRequests()
//					.antMatchers("/css/**", "/index").permitAll()
//					.antMatchers("/user/**").hasRole("USER")
//					.and()
//				.formLogin().loginPage("/login").failureUrl("/login-error");
//	}
//	
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth
//			.inMemoryAuthentication()
//				.withUser(User.withDefaultPasswordEncoder().username("user").password("password").roles("USER"));
//	}
	




//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http.formLogin()
//			.loginPage("/login")
//			.permitAll()
//		.and()
//			.logout()
//				.logoutSuccessUrl("/login?logout")
//				.permitAll();
//	}
	
	

	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/", 
                		        "/home",
                		        "/webjars/**",
                		        "/img/**",
                		        "/vendor/**",
                		        "/css/**",
                		        "/js/**").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login")
                .permitAll()
                .and()
            .logout()
                .permitAll();
    }


	
/* this works in in memory user detail manager
	
    @Bean
    @Override
    public UserDetailsService userDetailsService() {
    	System.out.print("0001:" + "userDetailsService");
        UserDetails user1 =
             User.withDefaultPasswordEncoder()
                .username("user")
                .password("password")
                .roles("USER")
                .build();
        
        UserDetails user2 =
                User.withDefaultPasswordEncoder()
                   .username("admin")
                   .password("admin")
                   .roles("ADMIN")
                   .build();
        
        return new InMemoryUserDetailsManager(user1, user2);
    }
*/
    
    
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//	    auth.inMemoryAuthentication()
//	        .passwordEncoder(passwordEncoder())
//	        .withUser("user").password(ENCODED_PASSWORD).roles("USER");
//	}
    
    
//	@Bean
//	@Override
//	protected UserDetailsService userDetailsService() {
//		InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
//	    manager.createUser(User.withUsername("user")
//	    		.password("secret123")
//	             .roles("USER").build());
//	    return manager;
//	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
//	    return new BCryptPasswordEncoder();
		return new PassthruEncoder();
	}
	
	
    
}
