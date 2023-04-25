package Controller;

import Service.UserService;
import at.favre.lib.crypto.bcrypt.BCrypt;
import bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (email.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorLogin", "Email và mật khẩu không được bỏ trống");
            request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request, response);
            return;
        }
        User user = userService.findByEmail(email);
        HttpSession session = request.getSession(true);
        boolean isPasswordValid = (user != null && user.getPassword() != null) ? BCrypt.verifyer().verify(password.toCharArray(), user.getPassword()).verified : false;

        if ((user != null) && isPasswordValid) {
            session.setAttribute("authorization", user);
            request.setAttribute("successLogin", "Bạn đã đăng nhập thành công!");

            request.getRequestDispatcher(request.getContextPath() + "/").forward(request, response);

        } else {
            request.setAttribute("errorLogin", "Email hoặc Mật khẩu của bạn bị sai");
            request.setAttribute("emailLogin", email);
            request.getRequestDispatcher("/jsp/client/authentication.jsp").forward(request, response);
        }

    }

}
