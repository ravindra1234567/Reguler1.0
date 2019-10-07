
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : ex_student_fee_update
    Created on : 1 Jun, 2018, 2:33:20 PM
    Author     : Lenovo
--%>
<%  
    String sub=request.getParameter("sub");
    String fee=request.getParameter("fee");
    try
		{
                           ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
			PreparedStatement ps=con.prepareStatement("update ex_fees set fees=? where subjects=?");
                    
                      ps.setString(1,fee);
                      ps.setString(2,sub);
                        
                    int i=0;
                   // out.println("1");
                   // out.println(fee);
                   // out.println(sub);
                    
                    
                    i=ps.executeUpdate();
                     //out.println(i);
                    if(i>0)
                        response.sendRedirect("ex_student_fee.jsp");
                        
			
                }
                catch(Exception e)
                {
                out.println(e);
                }
                            
                            
                            %>


