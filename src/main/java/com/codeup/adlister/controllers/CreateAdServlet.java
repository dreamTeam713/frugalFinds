package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = "";
        User newUser =(User) request.getSession().getAttribute("user");
        if (request.getParameter("url").isEmpty()) {
            url = "https://is3-ssl.mzstatic.com/image/thumb/Purple30/v4/1f/a4/83/1fa4837d-7775-681c-2815-e9c36c9c7285/mzm.cqfnvudd.png/1200x630bb.jpg";
        } else {
            url = request.getParameter("url");
        }
        System.out.println(url);
        Ad ad = new Ad(
            newUser.getId(),
            request.getParameter("title"),
            request.getParameter("description"),
            url
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/profile");
    }
}
