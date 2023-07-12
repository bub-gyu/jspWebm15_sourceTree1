<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<link rel="stylesheet" href="../css/join_style.css" />
<script>

	function goJoinForm(){
		
		location.href="../join/join.jsp";
	}
	
	function checkValue(){
		
		inputForm=eval("document.loginInfo");
		
		if(!inputForm.id.value){
			//alert(11);
			inputForm.id.focus();
			return false;
			
		}
		
		
		if(!inputForm.pwd.value){
			//alert(11);
			inputForm.pwd.focus();
			return false;
			
		}
	}
	
	
</script>
<div id="wrap">
<form action="loginProc.do" name="loginInfo" method="post" onsubmit="return checkValue();">
	<img src="../img/welcome.jpg" alt="wel_img" /> <br /><br />
	<table>
		<tr>
			<td bgcolor="skyblue">아이디</td>
			<td><input type="text" id="id" name="id" /></td>
		</tr>
			<tr>
			<td bgcolor="skyblue">비빌번호</td>
			<td><input type="password" id="pwd" name="pwd" /></td>
		</tr>
	
	</table>
	<input type="submit"  value="login"/>
	<input type="button"  value="join" onclick="goJoinForm();"/>
</form>
<%
	String msg=request.getParameter("msg");
	if( msg !=null &&  msg.equals("0")){
		
		out.println("<br>");
		out.println("<font color='red' size='5'>비밀번호 확인</font>");
		
		
	}else if( msg !=null &&  msg.equals("-1")){
		out.println("<br>");
		out.println("<font color='red' size='5'>아이디 확인</font>");
	}
	

%>

</div>
</body>
</html>