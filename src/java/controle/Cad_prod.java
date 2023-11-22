/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controle;

/**
 *
 * @author Bruno Salles
 */
public class Cad_prod {
    
    private String id = "";
    private double qtd;
    private double valor ;
    private String tp_unit = "";
    private String descricao = "";
    private String especif_tec = "";
    
    
    //Métodos Getters

    public String getId() {
        return id;
    }

    public double getQtd() {
        return qtd;
    }

    public double getValor() {
        return valor;
    }

    public String getTp_unit() {
        return tp_unit;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getEspecif_tec() {
        return especif_tec;
    }
    
    

    //Métodos Setter

    public void setId(String id) {
        this.id = id;
    }

    public void setQtd(double qtd) {
        this.qtd = qtd;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public void setTp_unit(String tp_unit) {
        this.tp_unit = tp_unit;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setEspecif_tec(String especif_tec) {
        this.especif_tec = especif_tec;
    }

       
    
    
    
}
