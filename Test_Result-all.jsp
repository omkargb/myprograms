<%@page import="org.apache.taglibs.standard.tag.el.core.ImportTag"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*,java.time.*"%>
<taglib uri ="com.itextpdf.text.*"%>
<taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

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
        <form method="get" action="MarksAdd_servlet">
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
		out.println("<b>Editing ...</b>");
		int c=0;
				while(rs.next())
	 {
			c++;
%>                                
                        <tr>
                            <th><%=rs.getString("id")%></th>
                            <td><input type="text" name="rollm<%=c%>" readonly value="<%=rs.getString("roll")%>" /></td>
                            <td><%=rs.getString("studname")%></td>
                            <td><input type="text" name="sub1m<%=c%>" value="<%=rs.getString("sub1")%>" required/></td>
                            <td><input type="text" name="sub2m<%=c%>" value="<%=rs.getString("sub2")%>" /></td>
                            <td><input type="text" name="sub3m<%=c%>" value="<%=rs.getString("sub3")%>" /></td>
                        </tr>  
                <%          
	 }  %> 								
                          
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
        <button class="btn btn-success" type="submit" name="action" value="update_col"> Edit values </button>
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