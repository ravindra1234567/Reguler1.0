
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class viee_image extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,
      ServletException {
    Blob photo = null;
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    String query = "select * from book where  BookId = '10' ";
    ServletOutputStream out = response.getOutputStream();

//    try {
//      con = getHSQLConnection();
//    } catch (Exception e) {
//      response.setContentType("text/html");
//      out.println("<html><head><title>Person Photo</title></head>");
//      out.println("<body><h1>Database Connection Problem.</h1></body></html>");
//      return;
//    }

    try {
         ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

      stmt = con.createStatement();
      rs = stmt.executeQuery(query);
      if (rs.next()) {
        photo = rs.getBlob(1);
      } else {
        response.setContentType("text/html");
        out.println("<html><head><title>Person Photo</title></head>");
        out.println("<body><h1>No photo found for id= 001 </h1></body></html>");
        return;
      }

      response.setContentType("image/pdf");
      InputStream in = photo.getBinaryStream();
      int length = (int) photo.length();

      int bufferSize = 1024;
      byte[] buffer = new byte[bufferSize];

      while ((length = in.read(buffer)) != -1) {
        System.out.println("writing " + length + " bytes");
        out.write(buffer, 0, length);
      }

      in.close();
      out.flush();
    } catch (SQLException e) {
      response.setContentType("text/html");
      out.println("<html><head><title>Error: Person Photo</title></head>");
      out.println("<body><h1>Error=" + e.getMessage() + "</h1></body></html>");
      return;
    } catch (ClassNotFoundException ex) {
          Logger.getLogger(viee_image.class.getName()).log(Level.SEVERE, null, ex);
      } finally {
      try {
        rs.close();
        stmt.close();
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }

    private Connection getHSQLConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}