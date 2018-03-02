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
    
        <script type="text/javascript">
    function DoNav(url) {
	document.location.href=url;
	}
    </script>
</head>

<body >
    <div class="container-fluid">
        <form bethod="post" name="edits" >
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr class="info">
                            <th>S.no.</th>
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
	 while(rs.next()) { %>
	  
                        <tr onClick="DoNav('marksTest-edit.jsp?sroll=<%=rs.getString("roll")%>');">
                        
                            <th><%=rs.getString("id")%></th>                        
                            <td><%=rs.getString("roll")%></td>
                            <td><%=rs.getString("studname")%></td>
                            <td><%=rs.getString("sub1")%></td>
                            <td><%=rs.getString("sub2")%></td>
                            <td><%=rs.getString("sub3")%></td>                            
                </tr>           
<% } %> 								
                    </tbody>
                    <caption> View Marks </caption>
        <% 					
	}
	catch(Exception e){
	e.printStackTrace();
	}  %>                    
                </table>
            </div>            
        </form>
        <b> To Edit/update : click on respective row..</b>
    </div>
                    	
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
        <b> <br>To Edit/update entire column :</b>    
        <button class="btn btn-success" onClick="DoNav('Test_Result.jsp');"> Edit </button>
    </div>	

    <script src="t_test/js/jquery.min.js"></script>
    <script src="t_test/bootstrap/js/bootstrap.min.js"></script>
    

    
</body>

</html>