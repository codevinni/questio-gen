package br.tsi.questio.dao;

import java.util.List;

import br.tsi.questio.model.Account;
import br.tsi.questio.model.Quiz;
import jakarta.persistence.EntityManager;

public class QuizDAO extends DAO<Quiz> {

	public QuizDAO() {
		super(Quiz.class);
	}

	public List<Quiz> filteredFind(Account user) {
		
	    try (EntityManager em = JPAUtil.getEntityManager()) {
	    	
	        String jpql = "SELECT q FROM Quiz q WHERE q.user = :u ORDER BY q.finishedAt DESC";
	        
	        return em.createQuery(jpql, Quiz.class).setParameter("u", user).getResultList();
	    }
	}
	
}
