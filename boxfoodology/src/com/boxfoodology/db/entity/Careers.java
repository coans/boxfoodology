package com.boxfoodology.db.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;



/**
 * The persistent class for the careers database table.
 * 
 */
@Entity
@NamedQuery(name="Careers.findAll", query="SELECT c FROM Careers c")
public class Careers implements Serializable {
	private static final long serialVersionUID = 1L;
	//TODO add enum for position
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String position;
	private Blob cv;
	private Date created;
	private String contentType;
	private String cvFileName;
	
	@Transient
	private MultipartFile cvFile;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Blob getCv() {
		return cv;
	}
	public void setCv(Blob cv) {
		this.cv = cv;
	}
	public MultipartFile getCvFile() {
		return cvFile;
	}
	public void setCvFile(MultipartFile cvFile) {
		this.cvFile = cvFile;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getCvFileName() {
		return cvFileName;
	}
	public void setCvFileName(String cvFileName) {
		this.cvFileName = cvFileName;
	}
}
