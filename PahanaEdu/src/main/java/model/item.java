package model;

public class item {

    private int i_id;
    private String i_name;
    private String i_type;
    private byte[] i_image;
    private int i_qty;
    private String i_price;

    public int getI_id() {
        return i_id;
    }

    public void setI_id(int i_id) {
        this.i_id = i_id;
    }

    public String getI_name() {
        return i_name;
    }

    public void setI_name(String i_name) {
        this.i_name = i_name;
    }

    public String getI_type() {
        return i_type;
    }

    public void setI_type(String i_type) {
        this.i_type = i_type;
    }

    public byte[] getI_image() {
        return i_image;
    }

    public void setI_image(byte[] i_image) {
        this.i_image = i_image;
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
}
