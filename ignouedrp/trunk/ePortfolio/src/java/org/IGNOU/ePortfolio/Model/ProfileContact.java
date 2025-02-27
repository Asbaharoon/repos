package org.IGNOU.ePortfolio.Model;
// Generated Jan 11, 2012 4:35:28 PM by Hibernate Tools 3.2.1.GA

/**
 * ProfileContact generated by hbm2java
 *
 * @author IGNOU Team
 * @version 2 Modified on 12-03-2012 by IGNOU Team
 */
public class ProfileContact implements java.io.Serializable {

    private long contactInfoId;
    private String userId;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String country;
    private Integer pin;
    private Long HTelephone;
    private Long OTelephone;
    private Long mobileNo;
    private Long faxNo;
    private String email1;
    private String email2;
    private String email3;
    private String owebsite;
    private String pwebsite;

    public ProfileContact() {
    }

    public ProfileContact(long contactInfoId) {
        this.contactInfoId = contactInfoId;
    }

    public ProfileContact(long contactInfoId, String userId, String address1, String address2, String city, String state, String country, Integer pin, Long HTelephone, Long OTelephone, Long mobileNo, Long faxNo, String email1, String email2, String email3, String owebsite, String pwebsite) {
        this.contactInfoId = contactInfoId;
        this.userId = userId;
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.state = state;
        this.country = country;
        this.pin = pin;
        this.HTelephone = HTelephone;
        this.OTelephone = OTelephone;
        this.mobileNo = mobileNo;
        this.faxNo = faxNo;
        this.email1 = email1;
        this.email2 = email2;
        this.email3 = email3;
        this.owebsite = owebsite;
        this.pwebsite = pwebsite;
    }

    public long getContactInfoId() {
        return this.contactInfoId;
    }

    public void setContactInfoId(long contactInfoId) {
        this.contactInfoId = contactInfoId;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAddress1() {
        return this.address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return this.address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return this.country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Integer getPin() {
        return this.pin;
    }

    public void setPin(Integer pin) {
        this.pin = pin;
    }

    public Long getHTelephone() {
        return this.HTelephone;
    }

    public void setHTelephone(Long HTelephone) {
        this.HTelephone = HTelephone;
    }

    public Long getOTelephone() {
        return this.OTelephone;
    }

    public void setOTelephone(Long OTelephone) {
        this.OTelephone = OTelephone;
    }

    public Long getMobileNo() {
        return this.mobileNo;
    }

    public void setMobileNo(Long mobileNo) {
        this.mobileNo = mobileNo;
    }

    public Long getFaxNo() {
        return this.faxNo;
    }

    public void setFaxNo(Long faxNo) {
        this.faxNo = faxNo;
    }

    public String getEmail1() {
        return this.email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getEmail2() {
        return this.email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

    public String getEmail3() {
        return this.email3;
    }

    public void setEmail3(String email3) {
        this.email3 = email3;
    }

    public String getOwebsite() {
        return this.owebsite;
    }

    public void setOwebsite(String owebsite) {
        this.owebsite = owebsite;
    }

    public String getPwebsite() {
        return this.pwebsite;
    }

    public void setPwebsite(String pwebsite) {
        this.pwebsite = pwebsite;
    }
}
