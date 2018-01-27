
<!DOCTYPE html>
<html>
<title>Exam Framework</title>
<link href="../js/bootstrap.min.js" rel="stylesheet">
<link href="../css/bootstrap.css" rel="stylesheet">
</head>

<body>
<script src="bootstrap.min.js"></script>

<%@include file="header.html"%>
<div class="row">
    <div class="col-md-offset-2 col-md-8">
        <div class="panel panel-info text-center " style="width: 1100px; height: 350px" >
            <div class="panel-heading text-right"><h3>Fill Registration Details </h3></div>
            <div class="panel-body">
                <form class = "form-horizontal " role = "form" action="process.jsp" method="fetchData.do">

  <div class = "form-group">
    <label for = "firstname" class = "col-sm-3 control-label">Title</label>

    <div class = "col-sm-6">
      <input type = "text" class = "form-control" id = "title" placeholder = "Enter Title" name="title">
    </div>
  </div>
    <div class="form-group">
        <label for="datetime" class="col-sm-3 control-label">Exam Time</label>
        <div class="col-sm-6">
            <input type="datetime-local" class="form-control" id="datetime" placeholder="Enter date and time" name="datetime">
        </div>
    </div>


  <div class = "form-group">
    <label for = "Duraiton" class = "col-sm-3 control-label">Exam  Duration</label>

    <div class = "col-sm-6 " >
      <input type = "text" class = "form-control" id = "duration" placeholder = "Enter Duration in minutes" name="examDuration">
    </div>
  </div>

  <div class = "form-group">
    <div class = "col-sm-offset-3 col-sm-9">
      <button type = "submit" class="btn btn-default btn-primary" >Register</button>
    </div>
  </div>

</form>

            </div>
        </div>
    </div>
</div>

<%@include file="footer.html"%>

</body>
</html>
