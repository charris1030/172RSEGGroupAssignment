<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Pacifico" rel="stylesheet" media="screen"/>
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet" />

    <title>Med File Upload App</title>

    


</head>

<body>

<div style="float:right; margin-top:5px; margin-right:5px;">
<center>
<c:if test="${pageContext.request.userPrincipal.name != null}">
          <form id="logoutForm" method="POST" action="${contextPath}/logout">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>

          <p>Logged in as: ${pageContext.request.userPrincipal.name} <br />
          <a onclick="document.forms['logoutForm'].submit()">Logout</a></p>
      </c:if>
</center>
</div>

     <form method="POST" enctype="multipart/form-data" action="/uploadFile">
     			<table>
     				<tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr>
     				<tr><td></td>
     				<td><input type="submit" value="Lets Upload" />
     				 </td></tr>
     			</table>
     		</form>

<hr>

   <h2>Current Files</h2>
    <p>
		<ul class="FileList">
			<li ng-repeat="f in ListofFiles" class="FileCard">
        <img src="{{f.Fullpath}}" alt="{{f.FileName}}"></img>
				<a href="{{f.Fullpath}}"> {{f.FileName}}</a>
			</li>

		</ul>
    </p>

</div>
</body>
</html>

