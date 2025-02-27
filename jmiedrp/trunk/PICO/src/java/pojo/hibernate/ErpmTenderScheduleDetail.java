package pojo.hibernate;
// Generated May 30, 2013 2:31:14 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * ErpmTenderScheduleDetail generated by hbm2java
 */
public class ErpmTenderScheduleDetail  implements java.io.Serializable {


     private Integer tscdTscdId;
     private ErpmTenderSchedule erpmTenderSchedule;
     private ErpmGenMaster erpmGenMaster;
     private int tscdScheduleNo;
     private Date tscdScheduleDate;
     private String tscdScheduleTime;
     private String tscdVenue;

    public ErpmTenderScheduleDetail() {
    }

    public ErpmTenderScheduleDetail(ErpmTenderSchedule erpmTenderSchedule, ErpmGenMaster erpmGenMaster, int tscdScheduleNo, Date tscdScheduleDate, String tscdScheduleTime, String tscdVenue) {
       this.erpmTenderSchedule = erpmTenderSchedule;
       this.erpmGenMaster = erpmGenMaster;
       this.tscdScheduleNo = tscdScheduleNo;
       this.tscdScheduleDate = tscdScheduleDate;
       this.tscdScheduleTime = tscdScheduleTime;
       this.tscdVenue = tscdVenue;
    }
   
    public Integer getTscdTscdId() {
        return this.tscdTscdId;
    }
    
    public void setTscdTscdId(Integer tscdTscdId) {
        this.tscdTscdId = tscdTscdId;
    }
    public ErpmTenderSchedule getErpmTenderSchedule() {
        return this.erpmTenderSchedule;
    }
    
    public void setErpmTenderSchedule(ErpmTenderSchedule erpmTenderSchedule) {
        this.erpmTenderSchedule = erpmTenderSchedule;
    }
    public ErpmGenMaster getErpmGenMaster() {
        return this.erpmGenMaster;
    }
    
    public void setErpmGenMaster(ErpmGenMaster erpmGenMaster) {
        this.erpmGenMaster = erpmGenMaster;
    }
    public int getTscdScheduleNo() {
        return this.tscdScheduleNo;
    }
    
    public void setTscdScheduleNo(int tscdScheduleNo) {
        this.tscdScheduleNo = tscdScheduleNo;
    }
    public Date getTscdScheduleDate() {
        return this.tscdScheduleDate;
    }
    
    public void setTscdScheduleDate(Date tscdScheduleDate) {
        this.tscdScheduleDate = tscdScheduleDate;
    }
    public String getTscdScheduleTime() {
        return this.tscdScheduleTime;
    }
    
    public void setTscdScheduleTime(String tscdScheduleTime) {
        this.tscdScheduleTime = tscdScheduleTime;
    }
    public String getTscdVenue() {
        return this.tscdVenue;
    }
    
    public void setTscdVenue(String tscdVenue) {
        this.tscdVenue = tscdVenue;
    }




}


