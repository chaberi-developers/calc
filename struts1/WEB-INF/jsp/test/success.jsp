<%@ page contentType="text/html; charset=Shift_JIS"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<html>
<head>
<title>ログイン結果</title>
</head>
<body>
	<%=(String) request.getAttribute("message")%><br>
	<!--  <%=(String) request.getAttribute("hobbies")%>-->

	<form action="login.do" method="post">
		ID: <input type="text" name="id">
		<html:errors property="id" />
		<br> password: <input type="text" name="password">
		<html:errors property="password" />
		<br> <input type="submit" value="送信">
	</form>


</body>
</html>
