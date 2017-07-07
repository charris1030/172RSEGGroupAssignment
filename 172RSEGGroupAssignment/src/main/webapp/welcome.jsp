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

<body ng-app="app" ng-controller="Ctrl" ng-cloak>

<div class="LoginWrapper">

<c:if test="${pageContext.request.userPrincipal.name != null}">
          <form id="logoutForm" method="POST" action="${contextPath}/logout">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>

          <div class="LoginUser">${pageContext.request.userPrincipal.name}</div>
          <div class="Logout"><a onclick="document.forms['logoutForm'].submit()">Logout</a></div>
</c:if>

</div>
<div id="LogoWrapper" ng-class="{'Expanded':Expanded};" ng-click="Expanded=!Expanded">

  <ul id="LogoNames">
    <li ng-click="ChangeScreen('Splash')">Home</li>
    <li ng-click="ChangeScreen('Create')">Upload</li>
<li ng-click="ChangeScreen('List')">List</li>
    <li ng-click="ChangeScreen('About')">About</li>
  </ul>
</div>

<div class="wrapper" ng-if="CurrScreen=='Splash'">
  <h2>Image Sharing Over Cloud</h2>

  <a class="button" ng-click="ChangeScreen('Create')">Lets Start</a>
</div>

<div class="wrapper" ng-if="CurrScreen=='About'">
  <h2>Project Purpose</h2>
  <p> The project will provide a service to the patients of the different branches of the XXX Orthopedic Hospital with following benefits:
    <ul>
      <li>The service will allow the doctors of the different branches of the XXX Orthopedic Hospital to access the X-ray images of the patients from anywhere at any time</li>
      <li>This service will eliminate the current practice of sharing the images through physical media such as images, CDs, memory sticks etc</li>
      <li>This service will enhance ability of the top notch specialists to share their opinions about the X-ray images fo the patients from all the countries where XXX Hospital has its branches</li>
      <li>This service will also provide a way for the patients who cannot move from their homes to share their X-ray images to the doctors sitting at their homes</li>
      <li>All the above benefits are provided in a most secured way</li>

    </ul>

  </p>
  <h2>Project Technologies</h2>
  <p>
    <ul>
      <li>Angular client</li>
      <li>Spring boot/java server</li>
      <li>Git Hub Version Control</li>
      <li>MySQL Database</li>
      <li>App Server and DB will run on AWS elastic beanstock model</li>
    </ul>
  </p>
<h2>Members</h2>
  <p>
    <ul>
      <li>Srikant</li>
      <li>Chris Harris</li>
      <li>Brad Hardwick</li>
    </ul>
  </p>
</div>

<div ng-controller="CreateCtrl" class="wrapper" ng-if="CurrScreen=='Create'" nv-file-drop="" uploader="uploader" filters="queueLimit, customFilter">
  <h2>Lets Add Things</h2>
  <p ng-if="Messages!=''">{{Messages}}</p>

  <div class="inputwrapper">
  <form method="POST" enctype="multipart/form-data"
        action="/s3/upload">
      File to upload: <input type="file" name="file"><br /> Name: <input
          type="text" name="name"><br /> <br /> <input type="submit"
                                                       value="Upload"> Press here to upload the file!
  </form>
    <form id="imageForm"  method="POST" modelAttribute="imageForm">
     <input type="text" ng-model="Model.FirstName" path="first_name" placeholder="First Name" />
        <input type="text" ng-model="Model.LastName"  path="last_name" placeholder="Last Name" />
        <input type="text" ng-model="Model.DoctorName" placeholder="Doctor Name" />
        <input type="text" ng-model="Model.SSN" placeholder="SSN" />
        <br/>
        <input type="text" ng-model="Model.Address"  path="address" placeholder="Address" />
        <input type="text" ng-model="Model.City"  path="city" placeholder="City" />
        <input type="text" ng-model="Model.Zip" path="zip" placeholder="Zip Code" />
    <select ng-model="Model.State" ng-options="P.Value as P.Display for P in States"></select>

    <div ng-repeat="n in uploader.queue" ng-if="uploader.queue.length>0">{{n._file.name}}
      <div ng-thumb="{file:n._file, height:150}">

        <canvas width="500" height="150"></canvas>
      </div>

    </div>
    <div ng-if="File==null" class='Dropbox' nv-file-over="" uploader="uploader" over-class="Accent">Drop File Here</div>
  </div>

  <a class="button" ng-click="Upload(uploader.queue[0])">Lets Upload</a>

  </form>
</div>

<div ng-if="CurrScreen=='List'" ng-init="Init()" ng-controller="ListCtrl" class="wrapper">
    <h2>Current Files</h2>
    <input type="text" class="SearchFiles" placeholder="Search" ng-model="SearchFiles" />
    <p>
		<ul class="FileList">
			<li ng-repeat="f in ListofFiles |filter: SearchFiles" class="FileCard" style="overflow:hidden">
        <img src="{{f.Fullpath}}" alt="{{f.FileName}}"></img>
        <dl style="line-height:18px; color:black;">
        	<dt>{{f.Model.FirstName}} {{f.Model.LastName}}</dt>
        	<dt>{{f.Model.Address}}</dt>
        	<dt>{{f.Model.City}} {{f.Model.State}} {{f.Model.Zip}}</dt>
        </dl>
				<a href="{{f.Fullpath}}"> {{f.FileName}}</a>
				<span class="timestamp" style="display: flex;color: #CCC;font-size: 12px;margin-bottom: 0px;padding-bottom: 0px;">{{f.Model.Timestamp}}</span>
			</li>

		</ul>
    </p>
</div>
		<ul style="display:none" class="FileList">
			<li th:each="file : ${files}">

				<a class="FileLink" th:href="${file}" th:text="${file}" />
			</li>
		</ul>

	<div id="Dump" style="display: none;"></div>

<script  src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.1/angular.min.js"></script>
<script  src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-cookies.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-file-upload/2.3.4/angular-file-upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="${contextPath}/resources/js/app.js"></script>



</div>
</body>
</html>

