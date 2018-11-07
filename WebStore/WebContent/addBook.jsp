<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
       <form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
       种类：
     <select name="booktypeid">
      <option value ="1">IT类</option>
     <option value ="2">童书</option>
      <option value="3">小说传记</option>
      <option value="4">经管</option>
      <option value="5">教辅资料</option>
     </select><br><br>
     
       书名：<input type="text" name="bookname"><br><br>
       出版社：<input type="text" name="bookpress"><br><br>
       作者：<input type="text"name="author"><br><br>
       详情：   <input type="text" name="bookinfo"><br><br>
       价格：   <input type="text" name="price"><br><br>
        图片：   <input type="file" name="file"><br><br>
      <input type="submit" value="提交">   
       </form>

 
</center>

</body>
</html>