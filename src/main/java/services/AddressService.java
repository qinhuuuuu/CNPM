package services;

import bean.Address;
import db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AddressService {
    private static AddressService instance;

    private AddressService() {

    }

    public static AddressService getInstance() {
        if (instance == null) {
            instance = new AddressService();
        }
        return instance;
    }

    public List<Address> getAddressOfUser(int userId) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select a.id, a.name, a.phone, a.detail, a.district, a.city from address a join user_address ua on a.id = ua.address_id where ua.user_id = ? ")
                    .bind(0, userId).mapToBean(Address.class).stream().collect(Collectors.toList());
        });
    }
    public Address getAddressById(int id){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select a.id, a.name, a.phone, a.detail, a.district, a.city from address a  where a.id = ? ")
                    .bind(0, id).mapToBean(Address.class).one();
        });
    }
}
