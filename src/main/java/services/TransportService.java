package services;

import bean.Transport;
import db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class TransportService {
    private static TransportService instance;

    private TransportService() {

    }

    public static TransportService getInstance() {
        if (instance == null) {
            instance = new TransportService();
        }
        return instance;
    }

    public List<Transport> getListTransport() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select id, name, fee from transport").mapToBean(Transport.class).stream().collect(Collectors.toList());
        });
    }

    public Transport getTransportById(int id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select id, name, fee from transport where id = ?").bind(0, id).mapToBean(Transport.class).one();
        });
    }

}
