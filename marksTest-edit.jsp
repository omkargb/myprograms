<%@page import="org.apache.taglibs.standard.tag.el.core.ImportTag"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*,java.time.*"%>
<taglib uri ="com.itextpdf.text.*"%>
<taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>table-test</title>
    <link rel="stylesheet" href="t_test/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="t_test/css/styles.css">
</head>

<body>
    <div class="container-fluid">
        <form method="post" action="MarksAdd_servlet">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr class="info">
                        <th> S.no.</th>
                            <th>roll no</th>
                            <th>stud-name </th>
                            <th>subject 1 </th>
                            <th>subject 2 </th>
                            <th>subject 3 </th>
                        </tr>
                    </thead>
					
                    <tbody>    
                     <% 
	try{
		Class.forName("com.mysql.jdbc.Driver");
	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/erpcompdb","root","root");		
		String query="select * from marks";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String rollno=request.getParameter("sroll");
		out.println("editing : "+rollno);
				while(rs.next())
	 {
					if(rs.getString("roll").equals(rollno)){
%>                                
                        <tr>
                            <th><%=rs.getString("id")%></td>
                            <td><input type="text" name="roll1" readonly value="<%=rollno%>"></td>
                            <td><%=rs.getString("studname")%></td>
                            <td><input class="form-control" type="text" name="sub11" value="<%=rs.getString("sub1")%>" range={1-20} required="required"/></td>
                            <td><input class="form-control" type="text" name="sub21"  value="<%=rs.getString("sub2")%>" pattern=[0-9]*{1,20} required="required"/></td>
                            <td><input class="form-control" type="text" name="sub31"  value="<%=rs.getString("sub3")%>" pattern=[0-9]*{1,20} required="required"/></td>
                        </tr>  
                <% } } %> 								
                          
                     </tbody>    
                    <caption> Marks </caption>
                </table>
        
        <% rs.close();
	stmt.close();
	conn.close();						
	}
	catch(Exception e){
	e.printStackTrace();
	}  %>
	                
            </div>
            	
    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
        <button class="btn btn-success" type="submit" name="action" value="update"> Submit </button>
    </div>
    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
        <a href="marksTest-view.jsp"><b> Back </b></a>  
    </div>
        </form>
    </div>

    <script src="t_test/js/jquery.min.js"></script>
    <script src="t_test/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>