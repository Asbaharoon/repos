package com.myapp.struts.hbm;
// Generated Mar 11, 2011 5:57:01 PM by Hibernate Tools 3.2.1.GA



/**
 * AccessionRegisterId generated by hbm2java
 */
public class AccessionRegisterId  implements java.io.Serializable {


     private int recordNo;
     private String libraryId;
     private String sublibraryId;

    public AccessionRegisterId() {
    }

    public AccessionRegisterId(int recordNo, String libraryId, String sublibraryId) {
       this.recordNo = recordNo;
       this.libraryId = libraryId;
       this.sublibraryId = sublibraryId;
    }
   
    public int getRecordNo() {
        return this.recordNo;
    }
    
    public void setRecordNo(int recordNo) {
        this.recordNo = recordNo;
    }
    public String getLibraryId() {
        return this.libraryId;
    }
    
    public void setLibraryId(String libraryId) {
        this.libraryId = libraryId;
    }
    public String getSublibraryId() {
        return this.sublibraryId;
    }
    
    public void setSublibraryId(String sublibraryId) {
        this.sublibraryId = sublibraryId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof AccessionRegisterId) ) return false;
		 AccessionRegisterId castOther = ( AccessionRegisterId ) other; 
         
		 return (this.getRecordNo()==castOther.getRecordNo())
 && ( (this.getLibraryId()==castOther.getLibraryId()) || ( this.getLibraryId()!=null && castOther.getLibraryId()!=null && this.getLibraryId().equals(castOther.getLibraryId()) ) )
 && ( (this.getSublibraryId()==castOther.getSublibraryId()) || ( this.getSublibraryId()!=null && castOther.getSublibraryId()!=null && this.getSublibraryId().equals(castOther.getSublibraryId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getRecordNo();
         result = 37 * result + ( getLibraryId() == null ? 0 : this.getLibraryId().hashCode() );
         result = 37 * result + ( getSublibraryId() == null ? 0 : this.getSublibraryId().hashCode() );
         return result;
   }   


}


