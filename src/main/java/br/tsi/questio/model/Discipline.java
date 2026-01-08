package br.tsi.questio.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.validation.constraints.NotBlank;

@Entity
public class Discipline {

	@Id
	@SequenceGenerator(name = "discipline_id", sequenceName = "discipline_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "discipline_seq")
	private Long id;
	
	@NotBlank(message = "Forneça o nome da disciplina")
	private String name;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return String.format("Discipline [id=%s, name=%s]", id, name);
	}
}
