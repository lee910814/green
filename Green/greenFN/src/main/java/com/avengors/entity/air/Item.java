package com.avengors.entity.air;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public class Item {
    private List<String> imageUrls;
    private String informCode;
    private String actionKnack;
    private String informCause;
    private String informOverall;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate informData;
    @JsonFormat(pattern = "yyyy-MM-dd HH시 발표")
    private LocalDateTime dataTime;
    private Map<String, String> informGrade;

    public List<String> getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }

    public String getInformCode() {
        return informCode;
    }

    public void setInformCode(String informCode) {
        this.informCode = informCode;
    }

    public String getActionKnack() {
        return actionKnack;
    }

    public void setActionKnack(String actionKnack) {
        this.actionKnack = actionKnack;
    }

    public String getInformCause() {
        return informCause;
    }

    public void setInformCause(String informCause) {
        this.informCause = informCause;
    }

    public String getInformOverall() {
        return informOverall;
    }

    public void setInformOverall(String informOverall) {
        this.informOverall = informOverall;
    }
    public LocalDate getInformData() {
        return informData;
    }
    public void setInformData(LocalDate informData) {
        this.informData = informData;
    }
    public LocalDateTime getDataTime() {
        return dataTime;
    }
    public void setDataTime(LocalDateTime dataTime) {
        this.dataTime = dataTime;
    }

    public Map<String, String> getInformGrade() {
        return informGrade;
    }

    public void setInformGrade(Map<String, String> informGrade) {
        this.informGrade = informGrade;
    }
}
    
