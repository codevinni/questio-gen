package br.tsi.questio.dao;

import java.util.List;

import br.tsi.questio.enums.Bimester;
import br.tsi.questio.enums.SchoolGrade;
import br.tsi.questio.model.Subject;
import jakarta.persistence.EntityManager;

public class SubjectDAO extends DAO<Subject> {

	public SubjectDAO() {
		super(Subject.class);
	}

	public List<Subject> filteredFind(Long disciplineId, SchoolGrade grade, Bimester bimester){
	
		try(EntityManager em = JPAUtil.getEntityManager()){
			
			String jpql = "SELECT s FROM Subject s " +
                          "WHERE s.discipline.id = :id AND s.grade = :grade AND s.bimester = :bimester ";

			return em.createQuery(jpql, Subject.class)
	               .setParameter("id", disciplineId)
	               .setParameter("grade", grade)
	               .setParameter("bimester", bimester)
	               .getResultList();
		}
	}	
}
