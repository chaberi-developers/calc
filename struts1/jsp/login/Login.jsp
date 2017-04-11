<%@ page contentType="text/html; charset=Shift_JIS"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<html>
<head>
<title>ƒƒOƒCƒ“‰æ–Ê</title>
</head>
<body>
	<form action="../../login/login.do" method="post">
		ID: <input type="text" name="id">
		<html:errors property="id" />
		<br> password: <input type="text" name="password">
		<html:errors property="password" />
		<br> <input type="submit" value="‘—M"> <br>
	</form>
	<br>
</body>
</html>