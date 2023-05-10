package services;

import bean.Detail;
import db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class CartService {
    private static CartService instance;

    private CartService() {

    }

    public static CartService getInstance() {
        if (instance == null) {
            instance = new CartService();
        }
        return instance;
    }

    public List<Detail> getCartOfUser(int userId) {
        return JDBIConnector.get().withHandle(handle -> {
            List<Detail> result = handle.createQuery("select d.id, d.quantity from detail d join cart c on d.id = c.cart_detail_id where c.user_id = ?")
                    .bind(0, userId).mapToBean(Detail.class).stream().collect(Collectors.toList());
            for (Detail d : result) {
                d.setProduct(ProductService.getInstance().getProductByDetailId(d.getId()));
            }
            return result;
        });
    }

    public static void main(String[] args) {
        System.out.println(getInstance().getCartOfUser(1));
    }
}
