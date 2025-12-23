package br.tsi.questio.enums;

public enum UserRole {

	ADMIN("admin"),
	USER("user"),
	UNDEFINED("undefined role");

	private String name;
	
	private UserRole(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
