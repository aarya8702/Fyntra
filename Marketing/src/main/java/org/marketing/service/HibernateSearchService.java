//package org.marketing.service;
//
//import org.apache.lucene.search.Query;
//import org.hibernate.search.jpa.FullTextEntityManager;
//import org.hibernate.search.jpa.Search;
//import org.hibernate.search.query.dsl.QueryBuilder;
//import org.marketing.model.Product;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import javax.persistence.EntityManager;
//import javax.persistence.NoResultException;
//import java.util.List;
//
//@Service
//public class HibernateSearchService {
//
//
//    @Autowired
//    private final EntityManager centityManager;
//
//
//    @Autowired
//    public HibernateSearchService(EntityManager entityManager) {
//        super();
//        this.centityManager = entityManager;
//    }
//
//
//    public void initializeHibernateSearch() {
//
//        try {
//            FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(centityManager);
//            fullTextEntityManager.createIndexer().startAndWait();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//    }
//
//   
//}
