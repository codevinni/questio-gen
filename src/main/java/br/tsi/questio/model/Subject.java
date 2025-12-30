package br.tsi.questio.model;

import br.tsi.questio.enums.Bimester;
import br.tsi.questio.enums.SchoolGrade;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
public class Subject {

	@Id
	@SequenceGenerator(name = "subject_id", sequenceName = "subject_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "subject_seq")
	private Long id;

	@NotBlank
	private String name;
	
	@ManyToOne
	private Discipline discipline;
	
	@Enumerated(EnumType.STRING)
	@NotNull
	private SchoolGrade grade;
	
	@Enumerated(EnumType.STRING)
	@NotNull
	private Bimester bimester;

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
	 * @return the discipline
	 */
	public Discipline getDiscipline() {
		return discipline;
	}

	/**
	 * @return the grade
	 */
	public SchoolGrade getGrade() {
		return grade;
	}

	/**
	 * @return the bimester
	 */
	public Bimester getBimester() {
		return bimester;
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

	/**
	 * @param discipline the discipline to set
	 */
	public void setDiscipline(Discipline discipline) {
		this.discipline = discipline;
	}

	/**
	 * @param grade the grade to set
	 */
	public void setGrade(SchoolGrade grade) {
		this.grade = grade;
	}

	/**
	 * @param bimester the bimester to set
	 */
	public void setBimester(Bimester bimester) {
		this.bimester = bimester;
	}

	@Override
	public String toString() {
		return String.format("Subject [id=%s, name=%s, discipline=%s, grade=%s, bimester=%s]", id, name, discipline,
				grade, bimester);
	}
}