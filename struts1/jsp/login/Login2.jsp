<%@ page contentType="text/html; charset=Shift_JIS"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<html>
<head>
<title>ログイン画面２</title>
</head>
<body>
	<html:form action="login/login2.do">
		<html:submit value="ログイン"></html:submit>
		<html:cancel value="キャンセル"></html:cancel>
		<html:button property="aaaaa" value="ボタン"></html:button>
		<html:reset value="リセット"></html:reset>
		<br>
		id:<html:text property="id"></html:text>
		<html:errors property="id" />
		<br>
		password:<html:text property="password"></html:text>
		<html:errors property="password" />
		<br>
		<html:image page="/img/img1.gif"></html:image>
		<br>
<%-- 		<html:hidden property="id" value="aaa" />
		<html:hidden property="password" value="eeee" /> --%>
	</html:form>
	<html:link href="https://www.yahoo.co.jp/">yahoo</html:link>
	<html:link action="login/login2.">action</html:link>
</body>
</html>