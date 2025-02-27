package com.myapp.struts.hbm;
// Generated May 2, 2011 12:00:18 PM by Hibernate Tools 3.2.1.GA



/**
 * Reservationlist generated by hbm2java
 */
public class Reservationlist  implements java.io.Serializable {


     private ReservationlistId id;
     private Library library;
     private String accessionno;
     private String cardId;
     private String title;
     private String category;
     private String author;
     private String isbn;
     private String callno;
     private String edition;
     private String volume;
     private String publication;
     private String remark;
     private String requestDate;
     private String status;
     private String issn;
     private String language;
     private String pubYear;

    public Reservationlist() {
    }

	
    public Reservationlist(ReservationlistId id, Library library) {
        this.id = id;
        this.library = library;
    }
    public Reservationlist(ReservationlistId id, Library library, String accessionno, String cardId, String title, String category, String author, String isbn, String callno, String edition, String volume, String publication, String remark, String requestDate, String status, String issn, String language, String pubYear) {
       this.id = id;
       this.library = library;
       this.accessionno = accessionno;
       this.cardId = cardId;
       this.title = title;
       this.category = category;
       this.author = author;
       this.isbn = isbn;
       this.callno = callno;
       this.edition = edition;
       this.volume = volume;
       this.publication = publication;
       this.remark = remark;
       this.requestDate = requestDate;
       this.status = status;
       this.issn = issn;
       this.language = language;
       this.pubYear = pubYear;
    }
   
    public ReservationlistId getId() {
        return this.id;
    }
    
    public void setId(ReservationlistId id) {
        this.id = id;
    }
    public Library getLibrary() {
        return this.library;
    }
    
    public void setLibrary(Library library) {
        this.library = library;
    }
    public String getAccessionno() {
        return this.accessionno;
    }
    
    public void setAccessionno(String accessionno) {
        this.accessionno = accessionno;
    }
    public String getCardId() {
        return this.cardId;
    }
    
    public void setCardId(String cardId) {
        this.cardId = cardId;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public String getCategory() {
        return this.category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getIsbn() {
        return this.isbn;
    }
    
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public String getCallno() {
        return this.callno;
    }
    
    public void setCallno(String callno) {
        this.callno = callno;
    }
    public String getEdition() {
        return this.edition;
    }
    
    public void setEdition(String edition) {
        this.edition = edition;
    }
    public String getVolume() {
        return this.volume;
    }
    
    public void setVolume(String volume) {
        this.volume = volume;
    }
    public String getPublication() {
        return this.publication;
    }
    
    public void setPublication(String publication) {
        this.publication = publication;
    }
    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public String getRequestDate() {
        return this.requestDate;
    }
    
    public void setRequestDate(String requestDate) {
        this.requestDate = requestDate;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public String getIssn() {
        return this.issn;
    }
    
    public void setIssn(String issn) {
        this.issn = issn;
    }
    public String getLanguage() {
        return this.language;
    }
    
    public void setLanguage(String language) {
        this.language = language;
    }
    public String getPubYear() {
        return this.pubYear;
    }
    
    public void setPubYear(String pubYear) {
        this.pubYear = pubYear;
    }




}


