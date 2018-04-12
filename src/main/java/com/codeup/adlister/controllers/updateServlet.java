package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "updateServlet", urlPatterns = "/ads/update")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
        maxFileSize=1024*1024*10,      // 10MB
        maxRequestSize=1024*1024*50)   // 50MB

public class updateServlet extends HttpServlet {
    private static final String SAVE_DIR = "resources/img";

    protected String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/ads");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hasPic = request.getParameter("addedPicture");
        String url = request.getParameter("url");
        System.out.println(hasPic);
        if (hasPic.equals("1")) {
            Part part = request.getPart("photo");
            url = SAVE_DIR + File.separator + extractFileName(part);
        }
        Ad ad = new Ad(
                Long.parseLong(request.getParameter("adId")),
                Long.parseLong(request.getParameter("userId")),
                request.getParameter("title"),
                request.getParameter("description"),
                Double.parseDouble(request.getParameter("price")),
                url
        );
        DaoFactory.getAdsDao().update(ad);
        response.sendRedirect("/profile");
    }
}
