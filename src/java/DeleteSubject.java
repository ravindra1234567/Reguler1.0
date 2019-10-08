/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class DeleteSubject extends HttpServlet {
    private Object Intarger;

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
        ServletContext context=this.getServletContext();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
            Class.forName(context.getInitParameter("Driver"));
            }
       catch(ClassNotFoundException e)
       {
           out.println(e);
           //out.println("hello driver not loaded");
       }
            /* TODO output your page here. You may use following sample code. */
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"), context.getInitParameter("Password"));
        HttpSession session=request.getSession();
            //String class_id=(String)session.getAttribute("class_id");
            
            int sem = Integer.parseInt(request.getParameter("sem"));
            String subcode=request.getParameter("subcode");
            String subtype=request.getParameter("subtype");
//            String ctype = request.getParameter("ctype");
           String course=request.getParameter("course");
           String branch = request.getParameter("branch");
        out.println("branch = "+branch);
        out.println("<br> sem = "+ sem);
        out.println("<br> subcode ="+subcode);
        out.println("<br> subtype ="+subtype);
        out.println("<br> course = "+ course);
        
        String qr="delete from schema_table where subcode=? and subtype=? and sem=? ";
        PreparedStatement ps=con.prepareStatement(qr);
        ps.setString(1, subcode);
        ps.setInt(2,Integer.parseInt(subtype));
//        ps.setString(3, class_id);
       ps.setInt(3,sem);
        int n=ps.executeUpdate();
        //out.println("rows deleted:"+n);
        response.sendRedirect("subjectAlloc.jsp?course="+course+"&sem="+sem+"&branch="+branch);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteSubject.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DeleteSubject.class.getName()).log(Level.SEVERE, null, ex);
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
