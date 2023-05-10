package controller;

import bean.Order;
import bean.User;
import services.AddressService;
import services.OrderService;
import services.TransportService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FinishBuy", value = "/finishBuy")
public class FinishBuy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String addressId = request.getParameter("addressId");
        String deliveryMethodId = request.getParameter("deliveryMethodId");
        String note = request.getParameter("note");
        Order order = new Order();
        order.setUser((User) request.getSession().getAttribute("user"));
        order.setAddress(AddressService.getInstance().getAddressById(Integer.parseInt(addressId)));
        order.setTransport(TransportService.getInstance().getTransportById(Integer.parseInt(deliveryMethodId)));
        order.setNote(note);
//    7.    Hệ thống thực thi câu lệnh lưu đơn hàng vào cơ sở dữ liệu.
        OrderService.getInstance().insertOrder(order);

        request.getRequestDispatcher("finish-buy.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
