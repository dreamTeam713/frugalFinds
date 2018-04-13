package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
        maxFileSize=1024*1024*10,      // 10MB
        maxRequestSize=1024*1024*50)   // 50MB

public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }
    /**
     * Name of the directory where uploaded files will be saved, relative to
     * the web application directory.
     */
    private static final String SAVE_DIR = "resources/img";

    /**
     * handles file upload
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String filename = "";
        String url = "";
        System.out.println("url= " + request.getParameter("url"));
        System.out.println("photo= " + request.getPart("photo"));
        if (request.getParameter("addedPicture").equals("0")) {
          url = "https://is3-ssl.mzstatic.com/image/thumb/Purple30/v4/1f/a4/83/1fa4837d-7775-681c-2815-e9c36c9c7285/mzm.cqfnvudd.png/1200x630bb.jpg";
        } else {
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + SAVE_DIR;
            Part part = request.getPart("photo");
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            filename = savePath + File.separator + extractFileName(part);
            url = SAVE_DIR + File.separator + extractFileName(part);
            part.write(filename);
        }
        Ad ad = new Ad(
            Long.parseLong(request.getParameter("userId")),
            request.getParameter("title"),
            request.getParameter("description"),
            Double.parseDouble(request.getParameter("price")),
            url
        );
        DaoFactory.getAdsDao().insert(ad);
        System.out.println("Inserting add after uploading picture successful!!");
        response.sendRedirect("/profile");
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
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
}
