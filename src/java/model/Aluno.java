
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
    private String birthCertificate;
    private Date   dataNasc;
    private String responsavelMae;
    private String RGMae;
    private String CPFMae;
    private String responsavelPai;
    private String RGPai;
    private String CPFPai;
    private String mobilePhone;
    private String Phone;
    private String Mail;
    private String CEP;
    private String address;
    private String number;
    private String city;
    private String district;
    private String birthCity;
    private String UF;
    private boolean isMatriculado;
    private int FkClass;


    public String getUF() {
        return UF;
    }

    public void setUF(String UF) {
        this.UF = UF;
    }

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

    public String getBirthCertificate() {
        return birthCertificate;
    }

    public void setBirthCertificate(String birthCertificate) {
        this.birthCertificate = birthCertificate;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getResponsavelMae() {
        return responsavelMae;
    }

    public void setResponsavelMae(String responsavelMae) {
        this.responsavelMae = responsavelMae;
    }

    public String getRGMae() {
        return RGMae;
    }

    public void setRGMae(String RGMae) {
        this.RGMae = RGMae;
    }

    public String getCPFMae() {
        return CPFMae;
    }

    public void setCPFMae(String CPFMae) {
        this.CPFMae = CPFMae;
    }

    public String getRGPai() {
        return RGPai;
    }

    public void setRGPai(String RGPai) {
        this.RGPai = RGPai;
    }

    public String getCPFPai() {
        return CPFPai;
    }

    public void setCPFPai(String CPFPai) {
        this.CPFPai = CPFPai;
    }

    public String getResponsavelPai() {
        return responsavelPai;
    }

    public void setResponsavelPai(String responsavelPai) {
        this.responsavelPai = responsavelPai;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String Mail) {
        this.Mail = Mail;
    }

    public String getCEP() {
        return CEP;
    }

    public void setCEP(String CEP) {
        this.CEP = CEP;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getBirthCity() {
        return birthCity;
    }

    public void setBirthCity(String birthCity) {
        this.birthCity = birthCity;
    }

    public boolean getIsIsMatriculado() {
        return isMatriculado;
    }

    public void setIsMatriculado(boolean isMatriculado) {
        this.isMatriculado = isMatriculado;
    }

    public int getFkClass() {
        return FkClass;
    }

    public void setFkClass(int FkClass) {
        this.FkClass = FkClass;
    }
    
    
    

}