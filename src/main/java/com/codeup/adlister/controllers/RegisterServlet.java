package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }
        if(DaoFactory.getUsersDao().findByUsername(request.getParameter("username")) ==null){
            User newUser = new User(
                    request.getParameter("username"),
                    request.getParameter("email"),
                    request.getParameter("password")
            );
            int numberOfRounds = 12;
            String hash = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt(numberOfRounds));
            newUser.setPassword(hash);
            DaoFactory.getUsersDao().insert(newUser);
            HttpSession session = request.getSession();
            session.setAttribute("user", newUser);
            response.sendRedirect("/profile");
        }else {
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("email", email);
            response.sendRedirect("/register");
        }
    }
}
