package com.erp.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class MarksAdd_servlet 
 * */

@WebServlet("/MarksAdd_servlet")
public class MarksAdd_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarksAdd_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action =request.getParameter("action");
		if(action.equals("update_col"))
		{
			
			try
				{
					Connection con=null;
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erpcompdb","root","root");
					System.out.println("Database Connected");	
					
					java.sql.PreparedStatement ps = null;

					
					for (int c = 1; c <= 6; c++) 
					{
						String mroll=request.getParameter("rollm"+c);
						String msub1=request.getParameter("sub1m"+c);
						String msub2=request.getParameter("sub2m"+c);
						String msub3=request.getParameter("sub3m"+c);
						System.out.print(" r: "+mroll);
						System.out.print(" s1: "+msub1 );
						System.out.print(" s2: "+msub2 );
						System.out.println(" s3: "+msub3 );

						ps=con.prepareStatement("update marks set sub1=?,sub2=?,sub3=? where roll=?");	
						ps.setString(1, msub1);
						ps.setString(2, msub2);
						ps.setString(3, msub3);
						ps.setString(4, mroll);	
						ps.executeLargeUpdate();
					}
					
					int a=ps.executeUpdate();
					if(a>0)
					{ System.out.println("success in updation");	
					response.sendRedirect("marksTest-view.jsp"); 
					}
					else { System.out.println("error in updation");	}
				}
				catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace(); }		
	}
} 
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
		String action =request.getParameter("action");
		
		String roll=request.getParameter("roll1");
		String studname=request.getParameter("studname1");
		String sub1=request.getParameter("sub11");
		String sub2=request.getParameter("sub21");
		String sub3=request.getParameter("sub31");
		
		java.sql.PreparedStatement pst;
		
		if(action!=null && action.equals("add"))
	{
			
		PrintWriter out=response.getWriter();
out.println("Your roll is : "+roll);	

	try {
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erpcompdb","root","root");
		System.out.println("Database Connected");
	pst=con.prepareStatement("insert into marks values(?,?,?,?,?)");	
	out.println("inserting values");
	
	pst.setString(1, roll);
	pst.setString(2, studname);
	pst.setString(3, sub1);
	pst.setString(4, sub2);
	pst.setString(5, sub3);
	
		
	int i=pst.executeUpdate();
	out.println("values inserted");
	
		if(i>0)
		{
		out.println(" Marks Added");
		}
	}
	catch (Exception e){
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
		if(action!=null && action.equals("update"))
	{
			try
			{
				Connection con=null;
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erpcompdb","root","root");
				System.out.println("Database Connected");	
				java.sql.PreparedStatement ps;
				
				
		ps=con.prepareStatement("update marks set sub1=?,sub2=?,sub3=? where roll=?");	
				ps.setString(1, sub1);
				ps.setString(2, sub2);
				ps.setString(3, sub3);
				ps.setString(4, roll);
				
				
				int i=ps.executeUpdate();
				if(i>0)
				{	System.out.println("success in updation");	
				response.sendRedirect("marksTest-view.jsp");
				}
				else
				{	System.out.println("error in updation");	}
			} 
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}		
			

 }
}
	}
