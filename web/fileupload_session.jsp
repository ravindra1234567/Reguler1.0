<%-- 
    Document   : fileupload_session
    Created on : 23 Aug, 2019, 6:50:50 PM
    Author     : Ravindra
--%>
<%@page import="java.util.Random"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%
	MultipartRequest mr=new MultipartRequest(request,"C:\\Users\\Ravindra\\Documents\\NetBeansProjects\\Reguler\\web\\image\\");
	
	String application_id=(String)mr.getParameter("application_id");
	String session1=(String)mr.getParameter("session");
	String image=(String)mr.getParameter("image");
	

	Enumeration files=mr.getFileNames();
	String filename=(String)files.nextElement();
        String photo=mr.getFilesystemName(filename);
//        int max=50000;
//	int min=1;
//	Random rd_num=new Random();
//	int custo_id=min+rd_num.nextInt(max);
//	String cid=Integer.toString(custo_id);
//	System.out.println(cid);
        
        out.println("Application Id"+ application_id+"<br>");
        out.println("session"+session1+"<br>");
        out.println("image name"+photo);
%>

<%

//      out.println("rollno"+rollno);
   
   /*String contentType = request.getContentType();

    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        byte dataBytes[] = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;

        while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
        }
        String file = new String(dataBytes);
        saveFile = file.substring(file.indexOf("filename=\"") + 10);
        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
        saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());

        
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
        File ff = new File("C:////Users////Ravindra////Documents////NetBeansProjects////Reguler////web////image////" + saveFile);
        FileOutputStream fileOut = new FileOutputStream(ff);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
        */
%>