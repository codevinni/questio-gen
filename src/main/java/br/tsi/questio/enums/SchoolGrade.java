package br.tsi.questio.enums;

public enum SchoolGrade {
    
    FIRST_GRADE("1º Ano"),
    SECOND_GRADE("2º Ano"),
    THIRD_GRADE("3º Ano"),
    FOURTH_GRADE("4º Ano"),
    FIFTH_GRADE("5º Ano"),
    SIXTH_GRADE("6º Ano"),
    SEVENTH_GRADE("7º Ano"),
    EIGHTH_GRADE("8º Ano"),
    NINTH_GRADE("9º Ano");

    private final String label;
    
    private SchoolGrade(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
    
}