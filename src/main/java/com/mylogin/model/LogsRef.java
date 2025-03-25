
package com.mylogin.model;


import java.sql.Date;

public class LogsRef {
    private int logsRefId;
    private int userId;
    private double soTienTruoc;
    private double soTienThayDoi;
    private double soTienSau;
    private String reason;
    private Date createDate;

    // Constructor
    public LogsRef(int logsRefId, int userId, double soTienTruoc, double soTienThayDoi,
                  double soTienSau, String reason, Date createDate) {
        this.logsRefId = logsRefId;
        this.userId = userId;
        this.soTienTruoc = soTienTruoc;
        this.soTienThayDoi = soTienThayDoi;
        this.soTienSau = soTienSau;
        this.reason = reason;
        this.createDate = createDate;
    }

    // Getters and Setters
    public int getLogsRefId() {
        return logsRefId;
    }

    public void setLogsRefId(int logsRefId) {
        this.logsRefId = logsRefId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getSoTienTruoc() {
        return soTienTruoc;
    }

    public void setSoTienTruoc(double soTienTruoc) {
        this.soTienTruoc = soTienTruoc;
    }

    public double getSoTienThayDoi() {
        return soTienThayDoi;
    }

    public void setSoTienThayDoi(double soTienThayDoi) {
        this.soTienThayDoi = soTienThayDoi;
    }

    public double getSoTienSau() {
        return soTienSau;
    }

    public void setSoTienSau(double soTienSau) {
        this.soTienSau = soTienSau;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "LogRef{" +
                "logsRefId=" + logsRefId +
                ", userId=" + userId +
                ", soTienTruoc=" + soTienTruoc +
                ", soTienThayDoi=" + soTienThayDoi +
                ", soTienSau=" + soTienSau +
                ", reason='" + reason + '\'' +
                ", createDate=" + createDate +
                '}';
    }
}

