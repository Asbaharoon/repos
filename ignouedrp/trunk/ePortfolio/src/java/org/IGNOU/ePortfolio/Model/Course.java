package org.IGNOU.ePortfolio.Model;
// Generated Nov 6, 2012 1:18:51 PM by Hibernate Tools 3.2.1.GA

import java.util.Date;

/**
 * Course generated by hbm2java
 */
public class Course implements java.io.Serializable {

    private static final long serialVersionUID = 1L;
    private int courseId;
    private Programme programme;
    private Integer instituteId;
    private String courseCode;
    private String courseName;
    private UserList coursCreator;
    private Date courceCreatorDate;

    public Course() {
    }

    public Course(int courseId) {
        this.courseId = courseId;
    }

    public Course(int courseId, Programme programme, Integer instituteId, String courseCode, String courseName, UserList coursCreator, Date courceCreatorDate) {
        this.courseId = courseId;
        this.programme = programme;
        this.instituteId = instituteId;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.coursCreator = coursCreator;
        this.courceCreatorDate = courceCreatorDate;
    }

    public int getCourseId() {
        return this.courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public Programme getProgramme() {
        return this.programme;
    }

    public void setProgramme(Programme programme) {
        this.programme = programme;
    }

    public Integer getInstituteId() {
        return this.instituteId;
    }

    public void setInstituteId(Integer instituteId) {
        this.instituteId = instituteId;
    }

    public String getCourseCode() {
        return this.courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseName() {
        return this.courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    /**
     * @return the coursCreator
     */
    public UserList getCoursCreator() {
        return coursCreator;
    }

    /**
     * @param coursCreator the coursCreator to set
     */
    public void setCoursCreator(UserList coursCreator) {
        this.coursCreator = coursCreator;
    }

    /**
     * @return the courceCreatorDate
     */
    public Date getCourceCreatorDate() {
        return courceCreatorDate;
    }

    /**
     * @param courceCreatorDate the courceCreatorDate to set
     */
    public void setCourceCreatorDate(Date courceCreatorDate) {
        this.courceCreatorDate = courceCreatorDate;
    }
}
