package services;

import bean.User;
import db.JDBIConnector;

public class UserService {
    private static UserService instance;

    private UserService() {

    }

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    public User getUserById(int id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select id, name, email, phone, password, status from user where id =?")
                    .bind(0, id)
                    .mapToBean(User.class).one();
        });
    }
}
