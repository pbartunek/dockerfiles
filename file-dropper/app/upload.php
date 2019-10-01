<?php
if(isset($_FILES['uploadedFile'])){
  $errors= array();
  $file_name = $_FILES['uploadedFile']['name'];
  $file_size = $_FILES['uploadedFile']['size'];
  $file_tmp  = $_FILES['uploadedFile']['tmp_name'];
  $file_type = $_FILES['uploadedFile']['type'];

  if(empty($errors) == true) {
    move_uploaded_file($file_tmp, "/data/".$file_name);
    echo "Success";
  } else {
    echo "Error";
  }
}
?>
<html>
   <body>

      <form action="" method="POST" enctype="multipart/form-data">
         <input type="file" name="uploadedFile" />
         <input type="submit"/>
      </form>

   </body>
</html>
