package com.myapp.struts.hbm;
// Generated May 21, 2011 1:22:24 PM by Hibernate Tools 3.2.1.GA



/**
 * BaseCurrency generated by hbm2java
 */
public class BaseCurrency  implements java.io.Serializable {


     private BaseCurrencyId id;
     private String formalName;
     private String direction;

    public BaseCurrency() {
    }

	
    public BaseCurrency(BaseCurrencyId id) {
        this.id = id;
    }
    public BaseCurrency(BaseCurrencyId id, String formalName, String direction) {
       this.id = id;
       this.formalName = formalName;
       this.direction = direction;
    }
   
    public BaseCurrencyId getId() {
        return this.id;
    }
    
    public void setId(BaseCurrencyId id) {
        this.id = id;
    }
    public String getFormalName() {
        return this.formalName;
    }
    
    public void setFormalName(String formalName) {
        this.formalName = formalName;
    }
    public String getDirection() {
        return this.direction;
    }
    
    public void setDirection(String direction) {
        this.direction = direction;
    }




}


