package bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

public class Order implements Serializable {
    private int id;
    private User user;
    private List<Detail> orderDetail;
    private Address address;
    private int total;
    private String note;
    private LocalDateTime orderDate;
    private Transport transport;

    public Order() {
    }

    public Order(int id, User user, List<Detail> orderDetail, Address address, int total, String note, LocalDateTime orderDate, Transport transport) {
        this.id = id;
        this.user = user;
        this.orderDetail = orderDetail;
        this.address = address;
        this.total = total;
        this.note = note;
        this.orderDate = orderDate;
        this.transport = transport;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Detail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<Detail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", user=" + user +
                ", orderDetail=" + orderDetail +
                ", address=" + address +
                ", total=" + total +
                ", note='" + note + '\'' +
                ", orderDate=" + orderDate +
                ", transport=" + transport +
                '}';
    }
}
