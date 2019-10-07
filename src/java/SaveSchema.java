/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.year;
import static com.sun.xml.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nice
 */
public class SaveSchema extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ServletContext context = this.getServletContext();
        response.setContentType("text/html;charset=UTF-8");
        String branch = null;
        int sem;
       String ctype;
        String course = null;
        int status1 = 0;

        branch = request.getParameter("branch");
        sem = Integer.parseInt(request.getParameter("sem"));
//                  out.println(year);
        course = request.getParameter("course");
        ctype = request.getParameter("ctype");

        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName(context.getInitParameter("Driver"));
            } catch (ClassNotFoundException e) {
                out.println(e);
                //out.println("hello driver not loaded");
            }
            /* TODO output your page here. You may use following sample code. */
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
            out.println("branch=" + branch);
            out.println("sem=" + sem);
            out.println("course=" + course);
            out.println("ctype=" + ctype);
            int i = 0;
            HttpSession session = request.getSession();
            String qr = "Insert into schema_table values( ?,?,?,?,?,? ) ";
//                    i = i+1;
            for (i = 0; i < 8; i++) {
                PreparedStatement ps = con.prepareStatement(qr);
                ps.setString(1, branch);
                ps.setInt(2, sem);

                String subject_code = request.getParameter("subcodeList" + (i + 1));
                out.println("<br>sub_code=" + subject_code + "<br>");
                int subject_type = Integer.parseInt(request.getParameter("subjectTypeList" + (i + 1)));
                out.println("sub_type=" + subject_type);
//                        String subject_type="1";
                out.println("\n");
                if (subject_code != null) {
                    if (!subject_code.equals("")) {
                        ps.setString(3, course);
                        ps.setString(4, ctype);
                        ps.setString(5, subject_code);
                        ps.setInt(6, subject_type);
                        try {
                            int n = ps.executeUpdate();
                            out.println("rows updated:" + n + "<br>");
                        } catch (Exception e) {
                            out.println(e);
                        }

                    }
                }
            }
             response.sendRedirect("subjectAlloc.jsp?course=" + course  + "&branch=" + branch+"&sem="+sem+"&ctype="+ctype);
        }
       
    }

    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
            protected void doGet 
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveSchema.class.getName()).log(Level.SEVERE, null, ex);
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveSchema.class.getName()).log(Level.SEVERE, null, ex);
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

}
