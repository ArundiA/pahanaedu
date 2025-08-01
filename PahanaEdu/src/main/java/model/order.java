package model;

public class order {
    private int o_id;
    private String c_name;
    private String c_email;
    private String i_name;
    private int i_qty;
    private String i_price;
    private String o_total;

    public order() {}

    public order(int o_id, String c_name, String c_email, String i_name, int i_qty, String i_price, String o_total) {
        this.o_id = o_id;
        this.c_name = c_name;
        this.c_email = c_email;
        this.i_name = i_name;
        this.i_qty = i_qty;
        this.i_price = i_price;
        this.o_total = o_total;
    }

    // ✅ Getters and Setters
    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

    public String getI_name() {
        return i_name;
    }

    public void setI_name(String i_name) {
        this.i_name = i_name;
    }

    public int getI_qty() {
        return i_qty;
    }

    public void setI_qty(int i_qty) {
        this.i_qty = i_qty;
    }

    public String getI_price() {
        return i_price;
    }

    public void setI_price(String i_price) {
        this.i_price = i_price;
    }

    public String getO_total() {
        return o_total;
    }

    public void setO_total(String o_total) {
        this.o_total = o_total;
    }
}
