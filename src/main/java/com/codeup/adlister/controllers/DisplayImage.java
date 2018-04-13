package com.codeup.adlister.controllers;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet(name = "controllers.DisplayImage", urlPatterns = "/resources/img/")
public class DisplayImage extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String filePath = request.getServletContext().getRealPath("/resources/img");
        if (!request.getRequestURI().startsWith("/resources/img/")) {
            return;
        }
        File file = new File(request.getServletContext().getRealPath("/resources/img"));
        if(file.exists()) {
            response.setContentType("image/jpeg");
            ServletOutputStream outStream;
            outStream = response.getOutputStream();
            FileInputStream fin = new FileInputStream(filePath + File.separator + file);

            BufferedInputStream bin = new BufferedInputStream(fin);
            BufferedOutputStream bout = new BufferedOutputStream(outStream);
            int ch = 0;
            while ((ch = bin.read()) != -1) {
                bout.write(ch);
            }
            bin.close();
            fin.close();
            bout.close();
            outStream.close();
        }
    }
}