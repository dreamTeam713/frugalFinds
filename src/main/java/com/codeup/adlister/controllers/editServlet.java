package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "editServlet", urlPatterns = "/ads/editAds")
public class editServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("test");
        Long id = Long.parseLong(request.getParameter("adId"));
        Ad curAd = DaoFactory.getAdsDao().findSingleAd(id);
//        response.setContentType("application/json");
        System.out.println("test2");
//        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println("test3");
//        String json = objectMapper.writeValueAsString(curAd);
        System.out.println("test4");
//        System.out.println(json);
        PrintWriter out = response.getWriter();
//        out.println(json);
//        System.out.println(json);
        System.out.println("test");
    }
}