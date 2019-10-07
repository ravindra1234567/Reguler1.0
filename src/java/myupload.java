/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Ravindra
 */
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class myupload
        extends HttpServlet {

    private boolean isMultipart;

    private final int maxFileSize = 50 * 1024;
    private final int maxMemSize = 4 * 1024;
    private File file;
    public String branch1="";
    public String branch ="";
    public String sem="";
    public String year="";
    public String section="";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws org.apache.commons.fileupload.FileUploadException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        // Check that we have a file upload request
        java.io.PrintWriter out = response.getWriter();
        
            out.println("hello1");
            isMultipart = ServletFileUpload.isMultipartContent(request);
            out.println("hello2");
            response.setContentType("text/html");
            out.println("hello4");
            //ServletContext context=this.getServletContext();
            out.println("hello3");

            String class_id = "";

            String filePath = "C:\\Users\\Ravindra\\Documents\\NetBeansProjects\\Reguler\\web\\input\\";//context.getInitParameter("Input_Path");
            //String class_id=request.getParameter("class_id");
            if (!isMultipart) {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet upload</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<p>No file uploaded</p>");
                out.println("</body>");
                out.println("</html>");
                return;
            } 
//            else {
//                out.println("hello");
//            }
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);

            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File("C:\\Users\\Ravindra\\Documents\\NetBeansProjects\\Reguler\\web\\output\\"));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // maximum file size to be uploaded.
            upload.setSizeMax(maxFileSize);

             // Parse the request to get file items.
             List fileItems = upload.parseRequest(request);
             // Process the uploaded file items
                Iterator i = fileItems.iterator();

                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet upload</title>");
                out.println("</head>");
                out.println("<body>");
                //out.println("hello1");
                String s1 = "";
                int flag = 0;
                String s3 = "";

                while (i.hasNext())
                {
                    //out.println("hello2");

                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField())
                    {
                        //out.println("hello3");

                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        out.println(":"+fieldName);
                        //out.println("#"+fileName);
                        //s3+=fileName;
                        String contentType = fi.getContentType();
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();

                        // Write the file
                        if (fileName.lastIndexOf("\\") >= 0)
                        {
                            flag = 1;
                            file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                            s1 += filePath + fileName.substring(fileName.lastIndexOf("\\"));
                            s3 += fileName.substring(fileName.lastIndexOf("\\"));
                        } else 
                        {
                            flag = 0;
                            //out.println("inisde else");
                            file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            s1 += filePath + fileName.substring(fileName.lastIndexOf("\\") + 1);
                            s3 += fileName.substring(fileName.lastIndexOf("\\") + 1);
                        }
                        fi.write(file);
                        out.println("<center>");
                        out.println("<h1>");
                        
                        String str = fileName ;
		out.println("Ravindra : "+str);
		String str4 =str.substring(0,str.length() - 4);
		String str2 = str4.substring(4,str4.length() - 2);
		String str3 = str2.substring(str2.length() - 1);
		
		out.println("last character CSV: " + str4);
		out.println("<br>");
                year =  str4.substring(0,3);
                out.println("<br>");
		out.println("Branch Name : " +str2);
                out.println("<br>");
                branch1 = str2.substring(0,str2.length() - 1);
                branch =  str2;
                  out.println("<br>");
		out.println("Last Charector : " +str3);
                out.println("<br>");
		 section = "A";
		if( str3.equals("A") || str3.equals("B") )
		{
			if( str3.equals("A") ){
				section = "A";
                              branch1 = str2.substring(0,str2.length() - 1);
                             branch =  branch1;
                        }
                        else{
			section = "B" ;
                        branch1 = str2.substring(0,str2.length() - 1);
                        branch =  branch1;
                        }
		}
		out.println("Section : "+section);
		out.println("<br>");
		sem = str4.substring(str4.length() - 1);
                
                
                
                             if( branch.equals("CS") )
                                {
                                branch="Computer Engineering"; 
//                                out.println("hello"+branch);
                                }
                                 else if(branch.equals("CIVIL"))
                                {
                                branch="Civil Engineering"; 
                                }
                                else if(branch.equals("EI"))
                                {
                                branch="Electronics And Instrumentation Engineering"; 
                                }
                                else if(branch.equals("ETC"))
                                {
                                branch="Electronics And Telecommunication Engineering"; 
                                }
                                else if(branch.equals("IT"))
                                {
                                branch="Information Technology";    
                             
                                }
                                else if(branch.equals("MECH"))
                                {
                                branch="Mechanical Engineering";    
                                 
                                }
                
                
                
                
                
                
                
                        out.println("<br>");
                        out.println("\nUploaded Filename: " + fileName + "<br>");
                        out.println("</h1>");
                        out.println("</center>");

                        out.println("<center>");
                        out.println("<h1>");
                        out.println("\n Uploaded at:" + s1);
                        out.println("</h1>");
                        out.println("</center>");

                    } 
                    else
                    {
                        String otherFeildName = fi.getFieldName();
                        class_id += fi.getString();
                        //out.println("inside else");
                        //out.println("name#:"+otherFeildName);
                        //out.println("value:"+class_id);
                        out.println("<br>");
                    }
                }
                String s2 = "\\n";
                String s4;
                s4 = "C:\\\\Users\\\\Ravindra\\\\Documents\\\\NetBeansProjects\\\\Reguler\\\\web\\\\input\\\\" + s3.substring(flag);
                String line = "";
                out.println("s4"+s4);
                BufferedReader br = new BufferedReader(new FileReader(s4));
                int validfile = 0;
                while ((line = br.readLine()) != null)
                {

                    // use comma as separator
                    String[] header = line.split(",");
                    /* out.println(header[0]);
                     out.println(header[1]);
                     out.println(header[2]);
                     */
                    if (header[0].equals("enrollment_no") && header[1].equals("roll_no") && header[2].equals("name"))  
                        validfile = 1;
                        break;    
                }
                if (validfile == 1)
                {
                    
                    // mysql driver
                    String driver = "com.mysql.jdbc.Driver";
//                    out.println(driver);
                    // the "url" to our DB, the last part is the name of the DB
                    String url = "jdbc:mysql://localhost:3306/reg";

                    String name = "root";
                    String pass = "";
                    try{
                            Class.forName( driver );
                            out.println("driver loading  done<br>");
                            // initialize the Connection, with our DB info ...
                            Connection con = DriverManager.getConnection( url, name, pass );
                            out.println("connection done<br>");                   
                            String qr = "load data local infile '" + s4 + "\' into table all_students fields terminated by \',\' lines terminated by \'" + s2 + "\'ignore 1 rows (@col1,@col2,@col3) set enrollment_no=@col1,roll_no=@col2,name=@col3,sem='"+sem+"',year='"+year+"',branch='"+branch+"',section='"+section+"' ";
                            out.println("hello");
                             Statement stmt = con.createStatement();
                            out.println("hello1");
                            int n = stmt.executeUpdate(qr);
                            out.println("Rows updated:"+n); 
                            out.println("hello2");
                            out.println("<center>");
                            out.println("<h1>");
                            out.println("CSV UPLOADED SUCCESSFULLY");
                            out.println("</h1>");
                            out.println("</center>");
                        }
                        catch(ClassNotFoundException | SQLException er)
                        {
                            out.println(er);
                        }
                }
                else
                {
                    out.println("<center>");
                    out.println("<h1>");
                    out.println("CSV HAS INCORRECT FORMAT");
                  out.println("   <script> window.location.href='details.jsp?page=fileupload&value=-1';</script> ");
                    out.println("</h1>");
                    out.println("</center>");
                
                }
               

                out.println("<center>");
                out.println("<h1>");
                out.println("<a href=panelHome.jsp>Go back</a>");
                out.println("</h1>");
                out.println("</center>");

                out.println("</body>");
                out.println("</html>");
        }
    
    


@Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(myupload.class.getName()).log(Level.SEVERE, null, ex);
        }
        }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
       {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(myupload.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

@Override
        public ServletContext getServletContext() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
