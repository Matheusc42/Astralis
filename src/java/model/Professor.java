/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BINHO
 */
public class Professor extends Funcionario {
    private String formacao;

    public Professor(int idReg, String nome, String RG, String CPF, String endereco, String cargo, String formacao) {
        super(idReg, nome, RG, CPF, endereco, cargo);
        this.formacao = formacao;
    }

    public String getFormacao() {
        return formacao;
    }

    public void setFormacao(String formacao) {
        this.formacao = formacao;
    }
    
    
    
}
