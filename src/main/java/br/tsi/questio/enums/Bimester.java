package br.tsi.questio.enums;

public enum Bimester {

    FIRST_BIMESTER("1º Bimestre"),
    SECOND_BIMESTER("2º Bimestre"),
    THIRD_BIMESTER("3º Bimestre"),
    FOURTH_BIMESTER("4º Bimestre");

    private final String label;

    private Bimester(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
	
}