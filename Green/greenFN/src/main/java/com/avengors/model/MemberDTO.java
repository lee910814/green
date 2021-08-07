package com.avengors.model;

public class MemberDTO {
   
   
   private int idx;
   private String email, userpw, name, birth, gender, postcode, address1, address2, deleted, salt;
   
   @Override
    public String toString() {
        return "Member{" +
                "idx=" + idx +
                ", email='" + email + '\'' +
                ", userPw='" + "****" + '\'' +
                ", name='" + name + '\'' +
                ", birth='" + birth + '\'' +
                ", gender='" + gender + '\'' +
                ", postcode='" + postcode + '\'' +
                ", address1='" + address1 + '\'' +
                ", address2='" + address2+ '\'' +
                ", deleted=" + deleted + '\'' +
                ", salt=" + "****" +
                '}';
    }
   
   public MemberDTO() {
    }

    public MemberDTO(String email, String userpw, String name, String birth, String gender,String postcode, String address1, String address2, String salt) {
        this.email = email;
        this.userpw = userpw;
        this.name = name;
        this.birth = birth;
        this.gender = gender;
        this.postcode = postcode;
        this.address1 = address1;
        this.address2 = address2;
        this.salt = salt;
    }

   public int getIdx() {
      return idx;
   }

   public void setIdx(int idx) {
      this.idx = idx;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getUserpw() {
      return userpw;
   }

   public void setUserpw(String userpw) {
      this.userpw = userpw;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getBirth() {
      return birth;
   }

   public void setBirth(String birth) {
      this.birth = birth;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public String getPostcode() {
      return postcode;
   }

   public void setPostcode(String postcode) {
      this.postcode = postcode;
   }

   public String getAddress1() {
      return address1;
   }

   public void setAddress1(String address1) {
      this.address1 = address1;
   }

   public String getAddress2() {
      return address2;
   }

   public void setAddress2(String address2) {
      this.address2 = address2;
   }

   public String getDeleted() {
      return deleted;
   }

   public void setDeleted(String deleted) {
      this.deleted = deleted;
   }

   public String getSalt() {
      return salt;
   }

   public void setSalt(String salt) {
      this.salt = salt;
   }
   
   
}

