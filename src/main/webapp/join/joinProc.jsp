<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<h3>joinProc</h3>
<!-- 회원가입처리 -->
<%
	request.setCharacterEncoding("utf8");	

	Connection conn =null;
	PreparedStatement pstmt=null;
	String sql="";


	String id= request.getParameter("id");
	String name= request.getParameter("name");
	
	String pwd= request.getParameter("pwd");
	String pwd2= request.getParameter("pwd2");
	
	String gender= request.getParameter("gender");
	String email= request.getParameter("email");
	
	String year= request.getParameter("year");
	String month= request.getParameter("month");
	String day= request.getParameter("day");
	
	String birth=String.format("%s-%s-%s",year,month,day);
	
	String Islunar= request.getParameter("Islunar");
	String cphone= request.getParameter("cphone");
	//String habit= request.getParameter("habit");
	
	String[] habits= request.getParameterValues("habit");
	String habit="";
	if (habits !=null){
		for(int i=0;i<habits.length;i++){
			if(i==habits.length-1){
				habit +=habits[i];
			}else{
			habit +=habits[i]+",";
			}
		}
	}
	

	
	//에러 메세지 전송
	//아이디 없음,비번불일치
	List<String> errors=new ArrayList();
	
	if((id==null) || id.equals("")){
		errors.add("아이디 없음");
		
	}
	
	if(!(pwd.equals(pwd2))){
		errors.add("비번불일치");
		
	}
	
	//에러가 1개라도 있으면 조건으로 불가
	if(errors.size()>0){
		
		//request에 에러 보관
		request.setAttribute("errors", errors);
		//response.sendRedirect("join.jsp");
		request.getRequestDispatcher("join.jsp").forward(request, response);
		
	}else{
		
		String driver ="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hr";
		String pass="123456";
		
		Class.forName(driver); 
		conn = DriverManager.getConnection(url, user, pass);
		
		sql="insert into member values(?,?,?,?,?,?,?,?,?,sysdate)";
		
		pstmt=conn.prepareStatement(sql);

		
		pstmt.setString(1,id );
		pstmt.setString(2,pwd );	
		pstmt.setString(3,name );
		pstmt.setString(4,gender );	
		pstmt.setString(5,birth );
		pstmt.setString(6,Islunar );
		pstmt.setString(7,cphone );
		pstmt.setString(8,email );
		pstmt.setString(9,habit );	
		
		//실행
		pstmt.executeUpdate(); //insert 실행

		System.out.println("입력 성공");
		
		
		response.sendRedirect("../index.jsp");
		
	}

	
	
	
	
	
	
	
%>
<%=id %>:<%=pwd %>:<%=pwd2 %>:<%=gender %>:<%=birth %>:<%=Islunar %>:<%=cphone %>:<%=habit %>:
<%=habits %>:
</body>
</html>