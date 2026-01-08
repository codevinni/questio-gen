package br.tsi.questio.dao;

import java.util.List;

import br.tsi.questio.model.Question;
import br.tsi.questio.model.Subject;
import jakarta.persistence.EntityManager;

public class QuestionDAO extends DAO<Question> {

	public QuestionDAO() {
		super(Question.class);
	}

	public List<Question> filteredFind(Subject subject){
		
		try(EntityManager em = JPAUtil.getEntityManager()){
			
			String jpql = "SELECT q FROM Question q " +
                          "WHERE q.subject = :subject "+ 
                          "ORDER BY FUNCTION('random')";

			return em.createQuery(jpql, Question.class)
					.setParameter("subject", subject).setMaxResults(5).getResultList();
		}
	}	
	
}
