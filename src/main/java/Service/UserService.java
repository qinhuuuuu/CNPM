package Service;

import bean.User;
import db.JDBIConnector;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;
import org.jdbi.v3.core.Jdbi;

public class UserService {
    protected Jdbi jdbi;

    public UserService() {
        this.jdbi = JDBIConnector.get();
    }

    public User findByEmail(String email) {
        try {
            return this.jdbi.withHandle(new HandleCallback<User, Exception>() {
                public User withHandle(Handle handle) throws Exception {
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM users"  + " WHERE email = ? and status = ?")
                                .bind(0, email)
                                .bind(1, 1)
                                .mapToBean(User.class).first();
                    } catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
