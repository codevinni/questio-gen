package br.tsi.questio.model;

import br.tsi.questio.enums.UserRole;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
public class Account {

	@Id
	@SequenceGenerator(name = "account_id", sequenceName = "account_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "account_seq")
	private Long id;
	
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	
	@Enumerated(EnumType.STRING)
	@NotNull
	private UserRole role = UserRole.UNDEFINED;
	
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * @return the role
	 */
	public UserRole getRole() {
		return role;
	}
	
	/**
	 * @param username the user to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * @param role the role to set
	 */
	public void setRole(UserRole role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return String.format("User [username=%s, password=%s, role=%s]", username, password, role);
	}
}