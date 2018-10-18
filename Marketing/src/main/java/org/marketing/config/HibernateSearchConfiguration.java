//package org.marketing.config;
//
//import javax.persistence.EntityManager;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class HibernateSearchConfiguration {
//
//    @Autowired
//    private EntityManager bentityManager;
//
//    @Bean
//    HibernateSearchService hibernateSearchService() {
//        HibernateSearchService hibernateSearchService = new HibernateSearchService(bentityManager);
//        hibernateSearchService.initializeHibernateSearch();
//        return hibernateSearchService;
//    }
//}