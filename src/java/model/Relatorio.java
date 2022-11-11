/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BINHO
 */
public class Relatorio {
    private int idReg;
    private String descricao;
    private Aluno aluno;
    
    public Relatorio(){
        
    }

    public Relatorio(int idReg, String descricao, Aluno aluno) {
        this.idReg = idReg;
        this.descricao = descricao;
        this.aluno = aluno;
    }

    public int getIdReg() {
        return idReg;
    }

    public void setIdReg(int idReg) {
        this.idReg = idReg;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }
    
}
