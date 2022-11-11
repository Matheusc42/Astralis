
package model;

import java.util.Date;

/**
 *
 * @author sfcma
 */
public class Aluno {

    private int Rm;
    private String fullName;
    private String RG;
    private String CPF;
    private String responsavelMae;
    private String responsavelPai;
    private Date   dataNasc;
    private int    idade;
    private String endereco;
    private boolean isMatriculado;
    private Classe Classe;

    public int getRm() {
        return Rm;
    }

    public void setRm(int Rm) {
        this.Rm = Rm;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRG() {
        return RG;
    }

    public void setRG(String RG) {
        this.RG = RG;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF = CPF;
    }

    public String getResponsavelMae() {
        return responsavelMae;
    }

    public void setResponsavelMae(String responsavelMae) {
        this.responsavelMae = responsavelMae;
    }

    public String getResponsavelPai() {
        return responsavelPai;
    }

    public void setResponsavelPai(String responsavelPai) {
        this.responsavelPai = responsavelPai;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public boolean isIsMatriculado() {
        return isMatriculado;
    }

    public void setIsMatriculado(boolean isMatriculado) {
        this.isMatriculado = isMatriculado;
    }

    public Classe getClasse() {
        return Classe;
    }

    public void setClasse(Classe Classe) {
        this.Classe = Classe;
    }
    
}
