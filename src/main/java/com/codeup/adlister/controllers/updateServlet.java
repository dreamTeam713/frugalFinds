package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "updateServlet", urlPatterns = "/ads/update")
public class updateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/ads");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User curUser = (User) request.getSession().getAttribute("user");
        long adId = Long.parseLong(request.getParameter("adId"));
        long userId = curUser.getId();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Ad ad = new Ad(adId, userId, title, description);
        DaoFactory.getAdsDao().update(ad);
        response.sendRedirect("/ads");
    }
}
