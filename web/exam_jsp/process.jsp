<html>
<head>
    <title>Exam details filling</title>
    <link href="../js/bootstrap.min.js" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
     <script src="jquery-3.2.0.js"></script>
    <script src="bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            $('.checkBaba').change(function() {
               var tab = document.getElementById("scopeInfo");
                if (this.checked) {
                    var row = tab.insertRow();
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    cell1.innerHTML =uniqueID();
                    cell2.innerHTML=this.getAttribute("value");
                    count++;
                } else {
                    tab.deleteRow(-1);
                }
            });

        })
        var uniqueID = (function() {
            var id = 1; // This is the private persistent value

            return function() { return id++; };  // Return and increment
        })();

    </script>

</head>
<body>
<%@include file="header.html"%>
<div class="container-fluid">
    <div class="row">

        <div class="col">
                    <div class="panel panel-default">
                        <div class="panel-heading"><h3>Registration Details</h3></div>
                        <table class="table">
                            <tbody>
                            <tr><th>Registration ID</th><td>Exam#001</td></tr>
                            <tr><th>Title</th><td>${param.title}</td></tr>
                            <tr><th>Exam Date</th><td>${param.datetime}</td></tr>
                            <tr><th>Duration</th><td>${param.examDuration} Minutes</td></tr>
                            </tbody>
                        </table>
                    </div>

        </div>
    </div>
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading"><h3>Choose Question Scopes</h3></div>
            <div class="panel-body ">
                <form class="form-horizontal" method="post" >
                    <div class="form-group col-sm-5">
                            <div class="well" >
                                <ul class="list-group checked-list-box">
                                    <li class="list-group-item" id="list1" data-style="button">APTITUDE<input type="checkbox" class="checkbox pull-right checkBaba" id="apti" value="Aptitude" onclick="onClickFunc()" onchange="onChangeFunc()"></li>
                                    <li class="list-group-item" data-style="button" data-color="success">QUANTITATIVE<input type="checkbox" class="checkbox pull-right checkBaba" id="quant" value="Quantitative" onclick="onClickFunc()" onchange="onChangeFunc()"></li>
                                    <li class="list-group-item" data-style="button" data-color="info">VERBALE<input type="checkbox" class="checkbox pull-right checkBaba" id="verb" onclick="onClickFunc()" value="Verbal" onchange="onChangeFunc()"></li>
                                    <li class="list-group-item" data-style="button" data-color="warning">PROGRAMMINGE<input type="checkbox" class="checkbox pull-right checkBaba" id="prog" onclick="onClickFunc()" value="Programming" onchange="onChangeFunc()"></li>
                                    <li class="list-group-item" data-style="button" data-color="danger">GENERAL AWARENESSE<input type="checkbox" class="checkbox pull-right checkBaba" id="GA" onclick="onClickFunc()" value="Computer Awareness" onchange="onChangeFunc()"></li>
                                    <li class="list-group-item" data-style="button" data-color="danger">COMPUTER FUNDAMENTALSE<input type="checkbox" class="checkbox pull-right checkBaba" id="CF" onclick="onClickFunc()" value="Computer Fundamental" onchange="onChangeFunc()"></li>

                                </ul>
                            </div>
                    </div>
                    <div class="col-sm-6">
                        <table class="table table-bordered " id="scopeInfo">
                            <thead>
                            <tr>
                                <th>seq.</th>
                                <th>scope</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="form-group ">
                        <input type="submit" class="form-control btn-info" value="Submit">
                    </div>


                </form>
            </div>

        </div>
    </div>
</div>

<script>

    $('#mathcheck').change(function() {
        var tab = document.getElementById("scopeInfo");
        var row = tab.insertRow();
        if ($(this).is(':checked')) {

            var col1=row.insertCell();
            var col2=row.insertCell();
            var col3=row.insertCell();
            col1.innerHTML="1";
            col2.innerHTML="mathematics";
            col3.innerHTML="insert number";
        }
    });

</script>

<%@include file="footer.html"%>
</body>
</html>