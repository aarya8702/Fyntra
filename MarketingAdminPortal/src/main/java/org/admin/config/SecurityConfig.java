package org.admin.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	DataSource dataSource;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception{
		
		auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery("select email,password, 'true' as enabled from user where email = ?")
		.authoritiesByUsernameQuery("select user_email,role from authorities where user_email = ?");
	}
	

	
	@Override
	public void configure(HttpSecurity http) throws Exception{
		http.authorizeRequests()
		.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')").and().authorizeRequests().antMatchers("/**")
		.permitAll().and().exceptionHandling().accessDeniedPage("/404")
		.and()
		.formLogin()
		.loginPage("/")
		.defaultSuccessUrl("/admin/home")
		.loginProcessingUrl("/j_spring_security_check")
		.failureUrl("/?error=1")
		.usernameParameter("j_username")
		.passwordParameter("j_password")
		.and()
		.logout().logoutSuccessUrl("/")
		.permitAll()
		.and().csrf().disable();
	}
	
}
