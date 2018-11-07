<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function loadAll(){
   var obj = document.getElementById('FormName');
     obj.submit();
  }
</script>
</head>
<body onload="loadAll()">
    <div style="display:none">
   <form name="FormName" id="FormName" action="${pageContext.request.contextPath}/index">  
    

</form>
</div>
</body>
</html>