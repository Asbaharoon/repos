package org.IGNOU.ePortfolio.Model;
// Generated Feb 17, 2012 3:51:22 PM by Hibernate Tools 3.2.1.GA

/**
 * TalkLecture generated by hbm2java
 *
 * @author IGNOU Team
 * @version 1
 * @since 17-02-2012
 */
public class TalkLecture implements java.io.Serializable {

    private long talkLectureId;
    private String userId;
    private String eventType;
    private String nameUniversity;
    private String address;
    private String nameEvent;
    private String lectureTopic;
    private String deleveredOn;
    private String timeFrom;
    private String timeTo;
    private String level;
    private String url;
    private String description;

    public TalkLecture() {
    }

    public TalkLecture(long talkLectureId) {
        this.talkLectureId = talkLectureId;
    }

    public TalkLecture(long talkLectureId, String userId, String eventType, String nameUniversity, String address, String nameEvent, String lectureTopic, String deleveredOn, String timeFrom, String timeTo, String level, String url, String description) {
        this.talkLectureId = talkLectureId;
        this.userId = userId;
        this.eventType = eventType;
        this.nameUniversity = nameUniversity;
        this.address = address;
        this.nameEvent = nameEvent;
        this.lectureTopic = lectureTopic;
        this.deleveredOn = deleveredOn;
        this.timeFrom = timeFrom;
        this.timeTo = timeTo;
        this.level = level;
        this.url = url;
        this.description = description;
    }

    public long getTalkLectureId() {
        return this.talkLectureId;
    }

    public void setTalkLectureId(long talkLectureId) {
        this.talkLectureId = talkLectureId;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEventType() {
        return this.eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getNameUniversity() {
        return this.nameUniversity;
    }

    public void setNameUniversity(String nameUniversity) {
        this.nameUniversity = nameUniversity;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNameEvent() {
        return this.nameEvent;
    }

    public void setNameEvent(String nameEvent) {
        this.nameEvent = nameEvent;
    }

    public String getLectureTopic() {
        return this.lectureTopic;
    }

    public void setLectureTopic(String lectureTopic) {
        this.lectureTopic = lectureTopic;
    }

    public String getDeleveredOn() {
        return this.deleveredOn;
    }

    public void setDeleveredOn(String deleveredOn) {
        this.deleveredOn = deleveredOn;
    }

    public String getTimeFrom() {
        return this.timeFrom;
    }

    public void setTimeFrom(String timeFrom) {
        this.timeFrom = timeFrom;
    }

    public String getTimeTo() {
        return this.timeTo;
    }

    public void setTimeTo(String timeTo) {
        this.timeTo = timeTo;
    }

    public String getLevel() {
        return this.level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
