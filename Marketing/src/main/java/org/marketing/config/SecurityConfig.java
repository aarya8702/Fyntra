package org.marketing.config;

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
	
//	
//	
//	@Configuration
//	@Order(2)
//	public static class App2ConfigurationAdapter extends WebSecurityConfigurerAdapter{
//		
//		public App2ConfigurationAdapter() {
//			super();
//		}
		
		@Autowired
		DataSource dataSource;
		
		@Autowired
		public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception{
			auth.jdbcAuthentication().dataSource(dataSource)
			.usersByUsernameQuery("select email,password, 'true' as enabled from user where isEmailVerified = 'Verified' and email = ?")
			.authoritiesByUsernameQuery("select user_email,role from authorities where user_email = ?");
		}
		
		
		@Override
		public void configure(HttpSecurity http) throws Exception{
			http.authorizeRequests()
			.antMatchers("/customer/**").access("hasRole('ROLE_USER')")
			.antMatchers("/cart/**").access("hasRole('ROLE_USER')")
			.antMatchers("/retailer/**").access("hasRole('ROLE_RETAILER')").and()
			.authorizeRequests().antMatchers("/**").permitAll().and()
			.exceptionHandling().accessDeniedPage("/404")
			.and()
			.formLogin()
			.loginPage("/userLogin")
			.defaultSuccessUrl("/")
			.loginProcessingUrl("/j_spring_security_check")
			.failureUrl("/userLogin?error=1")
			.usernameParameter("j_username")
			.passwordParameter("j_password")
			.and()
			.logout().logoutSuccessUrl("/userLogin")
			.permitAll()
			.and().csrf().disable();
		}
	
	
//	}
//	@Configuration
//	@Order(1)
//	public static class App1ConfigurationAdapter extends WebSecurityConfigurerAdapter{
//		
//		public App1ConfigurationAdapter() {
//			super();
//		}
//		
//		@Autowired
//		DataSource dataSource;
//		
//		@Autowired
//		public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception{
//			auth.jdbcAuthentication().dataSource(dataSource)
//			.usersByUsernameQuery("select email,password, 'true' as enabled from user,authorities where authorities.role = 'ROLE_RETAILER' and email = ?")
//			.authoritiesByUsernameQuery("select user_email,role from authorities where role = 'ROLE_RETAILER' and user_email = ?");
//		}
//		
//		
//		@Override
//		public void configure(HttpSecurity http) throws Exception{
//			http.authorizeRequests()
//			.antMatchers("/retailer/**").access("hasRole('ROLE_RETAILER')").and()
//			.authorizeRequests().antMatchers("/**").permitAll().and()
//			.exceptionHandling().accessDeniedPage("/404")
//			.and()
//			.formLogin()
//			.loginPage("/retlogin")
//			.defaultSuccessUrl("/retailer/myAccount")
//			.loginProcessingUrl("/j_spring_security_check")
//			.failureUrl("/retlogin?error=1")
//			.usernameParameter("j_username")
//			.passwordParameter("j_password")
//			.and()
//			.logout().logoutSuccessUrl("/retlogin")
//			.permitAll()
//			.and().csrf().disable();
//		}	
	}

  

