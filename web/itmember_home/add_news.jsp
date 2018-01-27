<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="panel panel-info" style="margin-top: 15px">
<div style="width:100%;margin-top:5px;height: fit-content">
    <form style="margin-left: 30px;margin-right:30px; font-size: 18px;" action="Save_Servlet" enctype="multipart/form-data" method="post">
                    <b><div class="form-group">
                        <label class="label">Header News</label>
                        <input class="form-control" type="text" name="news_header" placeholder="Enter News Heading ">
                    </div>
                        
                    <div class="form-group">
                        <label class="label">News Content</label>
                        <textarea class="form-control" rows="7" placeholder="Input News Content In 60 Words" name="news_content"></textarea>
                    </div></b>
                    <div class="row panel">
                        <div class="col-lg-6 panel-primary">
                            
                            <div class="form-group">
                            <label class="con"></label>
                            <input type="text" class="form-control" name="news_link" placeholder="Enter News Link">
                            </div>
                            <div claas="form-group">
                            <label class="label">Choose Location</label>
                            <input  type="file"  onchange="loadFile(event)" id="file_loc" style="height:50px;" name="file_url" accept=".jpg,.png"> 
                            <input type="hidden" name="hidden_url" value="Hello" id="hd">
                            </div>
                            <div style="margin-top: 40px;margin-left: -15px; ">
                            <input type="submit" value="Upload" class="btn-group-justified">
                            </div>
                        </div>
                        
                        <div class="col-lg-5 panel panel-primary" style="margin-left: 75px">
                            
                            <div class="panel-body" style="width:455px;height:305px">
                                <img id="pic_out" alt="Your Image" style="width:450px;height:300px; margin-left: -25px;margin-top: -14px">
                            </div>
                        </div>
                        
                    </div>
                </form>
            </div>
</div>
<!-------------------  SCRIPT FUNCTION FOR Image-------------------->

<script type="text/javascript">
                                document.getElementById("file_loc").onchange = function () {
                                  
                                  var fudata=document.getElementById("file_loc");
                                  var fileuploadpath=fudata.value;
                                  if(fileuploadpath!="" &&fileuploadpath!=null && fileuploadpath!=" ")
                                  {
                                      var extension=fileuploadpath.substring(fileuploadpath.lastIndexOf('.')+1).toLowerCase();
                                      if(extension=="gif"||extension=="png"||extension=="bmp"||extension=="jpeg"||extension=="jpg"){
                                          
                                          var reader = new FileReader();
                                          reader.onload=function(e){
                                              document.getElementById("pic_out").src=e.target.result;
                                          };
                                          // read the image file as a data URL.
                                            reader.readAsDataURL(this.files[0]);
                                            
                                      }
                                      else
                                      {
                                          alert("Photo only allows file types of GIF, PNG, JPG, JPEG and BMP.");
                                          fudata.value="";
                                      }
                                  }
                                  
                                  
                              };
                        </script>

<!--<script type="text/javascript">
                                document.getElementById("file_loc").onchange = function () {
                                  var reader = new FileReader();

                                  reader.onload = function (e) {
                                      // get loaded data and render thumbnail.
                                      document.getElementById("pic_out").src = e.target.result;
                                     // document.getElementById("hidden_url").setAttribute('hidden','My Self Anil');
                                      //document.write();                                      
                                  };
                                  // read the image file as a data URL.
                                  reader.readAsDataURL(this.files[0]);
                                  //document.getElementById("hd").value= $('#file_loc').val(); 
                                  //document.getElementById("hidden_url").src="My Self Anil";
                              };
                        </script>-->