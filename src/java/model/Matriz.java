/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BINHO
 */
public class Matriz {
    
    private int idReg;
    private String nome;
    private int anoLetivo;
    private String componentes;

    public Matriz(int idReg, String nome, int anoLetivo, String componentes) {
        this.idReg = idReg;
        this.nome = nome;
        this.anoLetivo = anoLetivo;
        this.componentes = componentes;
    }

    public int getIdReg() {
        return idReg;
    }

    public void setIdReg(int idReg) {
        this.idReg = idReg;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getAnoLetivo() {
        return anoLetivo;
    }

    public void setAnoLetivo(int anoLetivo) {
        this.anoLetivo = anoLetivo;
    }

    public String getComponentes() {
        return componentes;
    }

    public void setComponentes(String componentes) {
        this.componentes = componentes;
    }
    
    
}
