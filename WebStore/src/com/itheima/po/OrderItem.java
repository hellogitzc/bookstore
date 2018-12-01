package com.itheima.po;

import java.math.BigDecimal;

public class OrderItem extends OrderItemKey {
    private Integer num;

    private BigDecimal sum;

    private String bookname;

    private String bookpic;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public BigDecimal getSum() {
        return sum;
    }

    public void setSum(BigDecimal sum) {
        this.sum = sum;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public String getBookpic() {
        return bookpic;
    }

    public void setBookpic(String bookpic) {
        this.bookpic = bookpic == null ? null : bookpic.trim();
    }
}