package br.tsi.questio.model;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
public class Quiz {

	@Id
	@SequenceGenerator(name = "quiz_id", sequenceName = "quiz_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "quiz_seq")
	private Long id;
	
	@NotNull
	@Size(min = 5)
	@ManyToMany(fetch = FetchType.EAGER)
	private List<Question> questions;
	
	@NotNull
	@ManyToOne
	private Account user;
	
	private Double result;
	private LocalDateTime createdAt = LocalDateTime.now();
	private LocalDateTime finishedAt;
	
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @return the questions
	 */
	public List<Question> getQuestions() {
		return questions;
	}

	/**
	 * @return the user
	 */
	public Account getUser() {
		return user;
	}

	/**
	 * @return the result
	 */
	public Double getResult() {
		return result;
	}

	/**
	 * @return the createdAt
	 */
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	/**
	 * @return the finishedAt
	 */
	public LocalDateTime getFinishedAt() {
		return finishedAt;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @param questions the questions to set
	 */
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(Account user) {
		this.user = user;
	}

	/**
	 * @param result the result to set
	 */
	public void setResult(Double result) {
		this.result = result;
	}
	
	/**
	 * @param createdAt the createdAt to set
	 */
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	/**
	 * @param finishedAt the finishedAt to set
	 */
	public void setFinishedAt(LocalDateTime finishedAt) {
		this.finishedAt = finishedAt;
	}

	@Override
	public String toString() {
		return String.format("Quiz [id=%s]", id);
	}
	
}