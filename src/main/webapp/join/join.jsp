<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<p style="color:red">
<%
	if(request.getAttribute("errors") !=null){
		List<String> errors=(List)request.getAttribute("errors");
		
		for(int i=0;i<errors.size();i++){
			
			%>
			<%=errors.get(i) %> <br />
			
			<% 
		}
		
	}

%>

</p>
<h3>join</h3>
<form action="joinProc.jsp" method="post">
<label for="id">아이디 : </label><input type="text" id="id" name="id"/> <br /> 
<label for="pwd">비밀번호 : </label><input type="password" id="pwd" name="pwd"/> <br />
비빌번호확인 : <input type="password" id="pwd2" name="pwd2"/> <br />
<label for="name">이름:</label> <input type="text" id="name" name="name"/> <br />
<label for="gender">성별:</label>

<select name="gender" id="gender">
	<option value="남성">남성</option>
	<option value="여성">여성</option>
</select>
<label for="year">생년월일:</label><input type="text" id=" " name="year" size="5"/> 년
<input type="text" id="month" name="month" size="5"/>월
<input type="text" id="day" name="day" size="5"/>일
<input type="radio" id="Islunar" name="Islunar"  value="Solar" checked/>양력
<input type="radio" id="Islunar" name="Islunar"  value="Islunar" />음력
<br />
<label for="cphone">핸드폰번호 : </label><input type="text" id="cphone" name="cphone"/> 
예)010-455-4568<br />
<label for="email">이메일:</label> <input type="text" id="email" name="email"/> <br />
<label for="habit">취미:</label> 
<input type="checkbox" id="habit" name="habit" value="music"/>음악
<input type="checkbox" id="habit" name="habit" value="movie"/>영화
<input type="checkbox" id="habit" name="habit" value="trip"/>여행 <br />


<input type="submit" value="확인" />

</form>

</body>
</html>