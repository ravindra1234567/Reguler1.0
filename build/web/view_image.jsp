<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    byte[] imgData = null;
    try 
    {
        out.println("hello");
            ServletContext context = this.getServletContext();
            Class.forName(context.getInitParameter("Driver"));

           Connection  con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

        Statement stmt = con.createStatement();
        out.println("hello1");
        ResultSet rs = stmt.executeQuery("select photourl from all_students where roll_no='18I03094' ");
        out.println(rs);
        if ( rs.next() ) 
        {
            
            //String f1 = rs.getString("BookContent");
            String filename = rs.getString("photourl");
//             Blob blob = rs.getBlob(2);
//            out.println(blob);
//             InputStream is = blob.getBinaryStream();
//               FileOutputStream fos = new FileOutputStream("C:\\image"+ "\\" + filename);
            out.println(filename);
          %>
          <img src='image/<%= filename %>' />
       <% 
    }
        else
            out.println("error");
    }
    catch (Exception e) 
    {
        out.println("Unable To Display image"+e);
        out.println("Image Display Error=" + e.getMessage());
        return;
    } %> 
    
 