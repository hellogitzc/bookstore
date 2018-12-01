package com.itheima.po;

import java.math.BigDecimal;
import java.util.Date;

public class Orders extends OrdersKey {
    private Integer addressid;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private Date endTime;

    private Date closeTime;

    private String content;

    private Integer shipment;

    private BigDecimal total;
    
    private String addressdetial;
    
    private Integer ispay;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getShipment() {
        return shipment;
    }

    public void setShipment(Integer shipment) {
        this.shipment = shipment;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

	

	public String getAddressdetial() {
		return addressdetial;
	}

	public void setAddressdetial(String addressdetial) {
		this.addressdetial = addressdetial;
	}

	public Integer getIspay() {
		return ispay;
	}

	public void setIspay(Integer ispay) {
		this.ispay = ispay;
	}
}