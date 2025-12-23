package br.tsi.questio.dao;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import br.tsi.questio.model.Account;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;

public class AccountDAO extends DAO<Account>{

	private final BCryptPasswordEncoder encoder;
	
	public AccountDAO() {
		super(Account.class);
		encoder = new BCryptPasswordEncoder();
	}
	
	public Account authenticate(Account user) {
		
		if(user == null)
			throw new IllegalArgumentException("User can't be null");
		
		try(EntityManager em = JPAUtil.getEntityManager()){
		
			Query query = em.createQuery("SELECT u FROM Account u WHERE u.username = :username", Account.class);
			
			query.setParameter("username", user.getUsername());
			
			try {
				Account foundUser =  (Account)query.getSingleResult();
				
				if(encoder.matches(user.getPassword(), foundUser.getPassword()))
					return foundUser;
				else
					return null;
				
			} catch (NoResultException e){
				return null;
			}
		}
	}
	
	@Override
	public void add(Account user) {
		
		String hash = encoder.encode(user.getPassword());
		user.setPassword(hash);
		super.add(user);
	}

}
