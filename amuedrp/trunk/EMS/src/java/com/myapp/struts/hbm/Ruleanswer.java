package com.myapp.struts.hbm;
// Generated Jul 30, 2012 12:01:28 PM by Hibernate Tools 3.2.1.GA



/**
 * Ruleanswer generated by hbm2java
 */
public class Ruleanswer  implements java.io.Serializable {


     private RuleanswerId id;
     private String answer;
     private String enclosure;

    public Ruleanswer() {
    }

	
    public Ruleanswer(RuleanswerId id) {
        this.id = id;
    }
    public Ruleanswer(RuleanswerId id, String answer, String enclosure) {
       this.id = id;
       this.answer = answer;
       this.enclosure = enclosure;
    }
   
    public RuleanswerId getId() {
        return this.id;
    }
    
    public void setId(RuleanswerId id) {
        this.id = id;
    }
    public String getAnswer() {
        return this.answer;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public String getEnclosure() {
        return this.enclosure;
    }
    
    public void setEnclosure(String enclosure) {
        this.enclosure = enclosure;
    }




}


