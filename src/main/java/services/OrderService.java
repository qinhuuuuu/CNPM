package services;

import bean.Order;
import db.JDBIConnector;

public class OrderService {
    private static OrderService instance;

    private OrderService() {

    }

    public static OrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }
        return instance;
    }

    public int nextId() {
        return 1 + JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT MAX(`id`) as max FROM `order`").mapTo(Integer.class).one();
        });
    }

    // Phương thức để hệ thống thực thi câu lệnh lưu đơn hàng vào cơ sở dữ liệu.
    public void insertOrder(Order o) {
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("insert into `order`(id, user_id, address_id, total, note, transport_id) VALUES(?,?,?,?,?,?)")
                    .bind(0, nextId())
                    .bind(1, o.getUser().getId())
                    .bind(2, o.getAddress().getId())
                    .bind(3, o.getTotal())
                    .bind(4, o.getNote())
                    .bind(5, o.getTransport().getId())
                    .execute();
        });
    }
}
