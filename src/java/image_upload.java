import java.io.File;

import java.io.IOException;

import java.io.PrintWriter;
import static java.lang.System.out;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;

import javax.servlet.annotation.MultipartConfig;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Part;

@WebServlet(urlPatterns = {"/image_upload "})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 100)

public class image_upload extends HttpServlet {

// this if directory name where the file will be uploaded and saved
    private static final String SAVE_DIR = "image";
  

// this is the method which is created by system it self
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

// this tyr is created by me for the connection of database
            try {

// this is the path provide by me to save the image
                  out.println("hello");
               String savePath = "C:" + File.separator + SAVE_DIR;
                  out.println("hello1");
          /*in place of C: you can place a path wher you need to save the image*/
// this comment will picup the image file and have convert it into file type
                File fileSaveDir = new File(savePath);

                if (!fileSaveDir.exists()) {

                    fileSaveDir.mkdir();

                }

// this two comment will take the name and image form web page
                String application_no = request.getParameter("name");
                  out.println("hello2");
                Part part = request.getPart("file");

// this comment will extract the file name of image
                String fileName = extractFileName(part);
                  out.println("hello3");
// this will print the image name and user provide name
                out.println(fileName);

                out.println("\n" + application_no);

                /*if you may have more than one files with same name then you can calculate

                 some random characters and append that characters in fileName so that it will

                 make your each image name identical.*/
                try{
               part.write(savePath + File.separator + fileName);
                }catch(Exception ee)
                {out.println("hello4"+ee);}
                  
                /*

                 You need this loop if you submitted more than one file

                 for (Part part : request.getParts()) {

                 String fileName = extractFileName(part);

                 part.write(savePath + File.separator + fileName);

                 }*/
// connectio to database
                out.println("hello");
                ServletContext context = this.getServletContext();
                Class.forName(context.getInitParameter("Driver"));

                Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

// query to insert name and image name
                String query = "INSERT INTO all_students (application_no,photourl) values (?, ?)";

                PreparedStatement pst;

                pst = con.prepareStatement(query);

                pst.setString(1, application_no);

                String filePath = savePath + File.separator + fileName;

                pst.setString(2, filePath);

                pst.executeUpdate();

            } catch (IOException | ServletException | ClassNotFoundException | SQLException ex) {

                out.println("error" + ex);

            }

        }

    }

// the extractFileName() is method used to extract the file name
    private String extractFileName(Part part) {

        String contentDisp = part.getHeader("content-disposition");

        String[] items = contentDisp.split(";");

        for (String s : items) {

            if (s.trim().startsWith("filename")) {

                return s.substring(s.indexOf("=") + 2, s.length() - 1);

            }

        }

        return "";

    }

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    @Override

    public String getServletInfo() {

        return "Short description";

    }// </editor-fold>

}
