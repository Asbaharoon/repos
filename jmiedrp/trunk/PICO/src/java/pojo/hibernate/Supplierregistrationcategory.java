package pojo.hibernate;
// Generated May 30, 2013 2:31:14 PM by Hibernate Tools 3.2.1.GA



/**
 * Supplierregistrationcategory generated by hbm2java
 */
public class Supplierregistrationcategory  implements java.io.Serializable {


     private Byte srcId;
     private String srcName;
     private String srcRemarks;

    public Supplierregistrationcategory() {
    }

	
    public Supplierregistrationcategory(String srcName) {
        this.srcName = srcName;
    }
    public Supplierregistrationcategory(String srcName, String srcRemarks) {
       this.srcName = srcName;
       this.srcRemarks = srcRemarks;
    }
   
    public Byte getSrcId() {
        return this.srcId;
    }
    
    public void setSrcId(Byte srcId) {
        this.srcId = srcId;
    }
    public String getSrcName() {
        return this.srcName;
    }
    
    public void setSrcName(String srcName) {
        this.srcName = srcName;
    }
    public String getSrcRemarks() {
        return this.srcRemarks;
    }
    
    public void setSrcRemarks(String srcRemarks) {
        this.srcRemarks = srcRemarks;
    }




}


