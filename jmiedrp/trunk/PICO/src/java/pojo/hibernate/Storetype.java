package pojo.hibernate;
// Generated May 30, 2013 2:31:14 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Storetype generated by hbm2java
 */
public class Storetype  implements java.io.Serializable {


     private Byte stTypeId;
     private String stName;
     private Set storemasters = new HashSet(0);

    public Storetype() {
    }

	
    public Storetype(String stName) {
        this.stName = stName;
    }
    public Storetype(String stName, Set storemasters) {
       this.stName = stName;
       this.storemasters = storemasters;
    }
   
    public Byte getStTypeId() {
        return this.stTypeId;
    }
    
    public void setStTypeId(Byte stTypeId) {
        this.stTypeId = stTypeId;
    }
    public String getStName() {
        return this.stName;
    }
    
    public void setStName(String stName) {
        this.stName = stName;
    }
    public Set getStoremasters() {
        return this.storemasters;
    }
    
    public void setStoremasters(Set storemasters) {
        this.storemasters = storemasters;
    }




}


