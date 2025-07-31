package model;

public class customer {

    private int c_id;
    private String c_name;
    private String c_address;
    private String c_phone;  // ✅ Changed to String
    private String c_email;
    private int c_unit;      // ✅ Newly added

    public customer() {}

    // Parameterized constructor
    public customer(int c_id, String c_name, String c_address, String c_phone, String c_email, int c_unit) {
        this.c_id = c_id;
        this.c_name = c_name;
        this.c_address = c_address;
        this.c_phone = c_phone;
        this.c_email = c_email;
        this.c_unit = c_unit;
    }

    // Getters and Setters
    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_address() {
        return c_address;
    }

    public void setC_address(String c_address) {
        this.c_address = c_address;
    }

    public String getC_phone() {
        return c_phone;
    }

    public void setC_phone(String c_phone) {
        this.c_phone = c_phone;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

    public int getC_unit() {
        return c_unit;
    }

    public void setC_unit(int c_unit) {
        this.c_unit = c_unit;
    }

    @Override
    public String toString() {
        return "customer{" +
                "ID=" + c_id +
                ", Name='" + c_name + '\'' +
                ", Address='" + c_address + '\'' +
                ", Phone='" + c_phone + '\'' +
                ", Email='" + c_email + '\'' +
                ", Unit=" + c_unit +
                '}';
    }
}
