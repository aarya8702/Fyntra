package org.marketing.config;

import java.io.IOException;
import java.util.Properties;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.thymeleaf.spring4.SpringTemplateEngine;
import org.thymeleaf.spring4.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring4.view.ThymeleafViewResolver;

@Configuration
@ComponentScan({"org.marketing.*"})
@EnableWebMvc
@Import(value = {SecurityConfig.class})
public class WebConfig extends WebMvcConfigurerAdapter{
	
	 
//    @Autowired
//	private EntityManager bentityManager;
//
//	@Bean
//	HibernateSearchService hibernateSearchService() {
//		HibernateSearchService hibernateSearchService = new HibernateSearchService(bentityManager);
//		hibernateSearchService.initializeHibernateSearch();
//		return hibernateSearchService;
//	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
	}
	

	@Bean(name="multipartResolver") 
  	public CommonsMultipartResolver getResolver() throws IOException{
  		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
  	//Set the maximum allowed size (in bytes) for each individual file.
  		resolver.setMaxUploadSizePerFile(5242880);
  		return resolver;
  	}
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean
	public JavaMailSender getMailSender() {
		 JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
         
	        //Using gmail
	        mailSender.setHost("smtp.gmail.com");
	        mailSender.setPort(587);
	        mailSender.setUsername("aarya526@gmail.com");
	        mailSender.setPassword("ABhishek1234");
	         
	        Properties javaMailProperties = new Properties();
	        javaMailProperties.put("mail.smtp.starttls.enable", "true");
	        javaMailProperties.put("mail.smtp.auth", "true");
	        javaMailProperties.put("mail.transport.protocol", "smtp");
	        javaMailProperties.put("mail.debug", "true");
	         
	        mailSender.setJavaMailProperties(javaMailProperties);
	        return mailSender;
	    
	}
	    @Bean
	    public SpringTemplateEngine templateEngine() {
	        SpringTemplateEngine templateEngine = new SpringTemplateEngine();
	        templateEngine.setTemplateResolver(thymeleafTemplateResolver());
	        return templateEngine;
	    }
	 
	    @Bean
	    public SpringResourceTemplateResolver thymeleafTemplateResolver() {
	        SpringResourceTemplateResolver templateResolver 
	          = new SpringResourceTemplateResolver();
	        templateResolver.setPrefix("/WEB-INF/views/");
	        templateResolver.setSuffix(".html");
	        templateResolver.setTemplateMode("HTML5");
	        return templateResolver;
	    }
	    
	    @Bean
	    public ThymeleafViewResolver thymeleafViewResolver() {
	        ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();
	        viewResolver.setTemplateEngine(templateEngine());
	        return viewResolver;
	    }
	
}
