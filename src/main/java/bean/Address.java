package bean;

import java.io.Serializable;

public class Address implements Serializable {
    private int id;
    private String name;
    private String phone;
    private String detail;
    private String district;
    private String city;

    public Address() {
    }

    public Address(int id, String name, String phone, String detail, String district, String city) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.detail = detail;
        this.district = district;
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", detail='" + detail + '\'' +
                ", district='" + district + '\'' +
                ", city='" + city + '\'' +
                '}';
    }

    public String formatAddress(Address a) {
        return a.getDetail() + ", " + a.getDistrict() + ", " + a.getCity();
    }
}
