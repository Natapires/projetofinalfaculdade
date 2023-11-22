/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controle;

/**
 *
 * @author Bruno Salles
 */
public class Login {
    
    //Atributos
    private String nv = "";
    private String senha = "";
    private String login = "";    
    
    //Métodos getters

    public String getNv() {
        return nv;
    }

    public String getSenha() {
        return senha;
    }

    public String getLogin() {
        return login;
    }
   
    
    //Métodos Setters

    public void setNv(String nv) {
        this.nv = nv;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setLogin(String login) {
        this.login = login;
    }
    
   
    //Método autencicar
    public boolean autenticar(String username, String senha) {
        this.login = (username);
        return this.login != null && login.equals(senha);
    }
    
}
