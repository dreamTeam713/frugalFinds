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
//
//        //Only accept mappings as src="/images/whatever.jpg", even if web.xml has other mappings to this servlet.
        if(!request.getRequestURI().startsWith("/resources/img/"))
            return;
//        System.out.println("From DisplayImage: " + filePath);
        String uri = request.getRequestURI();
//        System.out.println("uri is " + uri);
        //get the image name, or even directory and image, e.g. /images/music/beethoven.jpg:
        File file = new File(request.getServletContext().getRealPath("/resources/img"));
        if(file.exists()){
//            System.out.println("file exists");
        }
//        System.out.println("\nFetching " + file.getName() + " from " + filePath);
        response.setContentType("image/jpeg");
        //as far as I know, this works for PNG as well. You might want to change the mapping to /images/*.jpg if it's giving problems

        ServletOutputStream outStream;
        outStream = response.getOutputStream();
        FileInputStream fin = new FileInputStream(filePath + File.separator + file);

        BufferedInputStream bin = new BufferedInputStream(fin);
        BufferedOutputStream bout = new BufferedOutputStream(outStream);
        int ch = 0;
        while ((ch=bin.read()) != -1) {
            bout.write(ch);
        }
        bin.close();
        fin.close();
        bout.close();
        outStream.close();
    }
}