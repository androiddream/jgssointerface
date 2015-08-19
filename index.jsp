<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.ly.uap.client.authentication.AttributePrincipal;"%>
<%@page language="java" import="java.util.*" import="java.sql.*"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'index.jsp' starting page</title>
	</head>

	<body>
		<%  
			AttributePrincipal principal = (AttributePrincipal)request.getUserPrincipal(); 
			String username = principal.getName();  			
			String userpwd="";
			Connection conn = null;
         try {
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
		} catch (InstantiationException e) {
			// TODO 自动生成的 catch 块
			
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
         String url = "jdbc:sqlserver://127.0.0.1\\SQL2008:1433;DatabaseName=jgyykchr";
         String user = "sa";
         String password = "123456";
         try {
			conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
         Statement stmt=null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

         ResultSet rs=null;
		try {
			rs = stmt.executeQuery("select pwd from(select e0127 as username,H01TH as pwd from UsrA01 union select e0127 as username,H01TH as pwd from SxkA01 union select e0127 as username,H01TH as pwd from GwjA01 union select e0127 as username,H01TH as pwd from GnjA01 union select e0127 as username,H01TH as pwd from RetA01 ) as a where username="+username);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
       
         try {
				while(rs.next())

				 {

				 System.out.println("密码"+rs.getString("pwd"));
                 userpwd=rs.getString("pwd");
				 }
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		 out.println(userpwd);

         try {
			rs.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

         try {
			stmt.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

      try {
		conn.close();
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
		}
	  
			   %>
   			   <form action="http://10.10.8.64:8888/logon/logonService" name="ldap" method="post">
 			   <input name="user_ID" type="hidden" value="<%=username %>">
  			   <input name="password" type="hidden" value="<%=userpwd %>">
  			   <input name="flag" type="hidden" value="26">
  			   </form>
  			   <script type="text/javascript">
  			   document.all.ldap.submit();	
  			   </script>

               <%
		
		%>
		

	</body>
</html>
