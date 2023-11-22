/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controle;

/**
 *
 * @author Bruno Salles
 */
public class Pedido {
    
    public String tp_frete;
    public String dt_entrega;
    public Double vl_total;
    
    //Métodos Getters

    public String getTp_frete() {
        return tp_frete;
    }

    public String getDt_entrega() {
        return dt_entrega;
    }

    public Double getVl_total() {
        return vl_total;
    }
    
    //Métodos Setters

    public void setTp_frete(String tp_frete) {
        this.tp_frete = tp_frete;
    }

    public void setDt_entrega(String dt_entrega) {
        this.dt_entrega = dt_entrega;
    }

    public void setVl_total(Double vl_total) {
        this.vl_total = vl_total;
    }   
}
