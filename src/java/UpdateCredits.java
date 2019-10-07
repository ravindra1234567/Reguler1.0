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
import java.util.ArrayList;
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
public class UpdateCredits extends HttpServlet {

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
            try{
            Class.forName(context.getInitParameter("Driver"));
            }
       catch(ClassNotFoundException e)
       {
           out.println(e);
           //out.println("hello driver not loaded");
       }
          //  ServletContext context = getServletContext();
    //Class.forName(context.getInitParameter("Driver"));
   Connection  con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
         
            HttpSession session=request.getSession();
            ArrayList sclist=(ArrayList)session.getAttribute("subject_code_list");
            String items=sclist.toString();
            //out.println(items);
            
            //out.println("now saving changes!!");
            //out.println("before loop!");
            for(int i=0;i<sclist.size();i++)
            {
                String s1=(String)sclist.get(i);
               // out.println("working for subject_code:"+s1);
                String tc=s1+"1";
                String pc=s1+"2";
                String t_credits=request.getParameter(tc);
                String p_credits=request.getParameter(pc);
                //out.println()
                
                
                String qr="Update subject_table set theory_credits=?,practical_credits=? where subject_code=?";
                PreparedStatement ps=con.prepareStatement(qr);
                ps.setString(1,t_credits);
                ps.setString(2,p_credits);
                ps.setString(3,s1);
                try{
                int n=ps.executeUpdate();
               // out.println("rows updated:"+n);
                }
                catch(Exception e)
                {
                    out.println("caught"+e);
                }
            }
            //out.println("saved");
           // out.println("<a href=edpuserHome.jsp>HOME</a>");
            response.sendRedirect("credithome.jsp");
            //response.sendRedirect("option.jsp?list="+s1);
            }
            catch(Exception e)
            {
                out.println("exc:"+e);
            }
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
           Logger.getLogger(UpdateCredits.class.getName()).log(Level.SEVERE, null, ex);
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
           Logger.getLogger(UpdateCredits.class.getName()).log(Level.SEVERE, null, ex);
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
