package br.tsi.questio.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public final class JPAUtil{
	
	private final static String DB_NAME = "questiogen"; 
	private final static EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_NAME);

	private JPAUtil() {
		throw new UnsupportedOperationException("Utility Class");
	}
	
	public static EntityManager getEntityManager() {
		return emf.createEntityManager();
	}
}
