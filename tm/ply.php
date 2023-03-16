<?php
include 'tm_header.php';

$conn = new PDO('mysql:host=localhost; dbname=oms', 'root', '');
if (isset($_POST['submit']) != "") {
    $name = $_FILES['file']['Location'];
    $size = $_FILES['file']['size'];
    $type = $_FILES['file']['type'];
    $temp = $_FILES['file']['tmp_name'];
    // $folder = "C:\xamppss\htdocs\AMS\auditor\upload";
    // $caption1=$_POST['caption'];
    // $link=$_POST['link'];

    $FileName = date("YmdHis") . '_' . $name;
    $chk = $conn->query("SELECT * FROM  policyregistration where Location = '$name' ")->rowCount();
    if ($chk) {
        $i = 1;
        $c = 0;
        while ($c == 0) {
            $i++;
            $reversedParts = explode('.', strrev($name), 2);
            $tname = (strrev($reversedParts[1])) . "_" . ($i) . '.' . (strrev($reversedParts[0]));
            // var_dump($tname);exit;
            $chk2 = $conn->query("SELECT * FROM  policyregistration where Location = '$tname' ")->rowCount();
            if ($chk2 == 0) {
                $c = 1;
                $name = $tname;
            }
        }
    }
    $move =  move_uploaded_file($temp, "../uplds/" . $fname);
    if ($move) {
        $query = $conn->query("INSERT into policyregistration(Location,Filename)values('$name','$fname')");
        if ($query) {
            header("location: ply.php");
        } else {
            //die(mysql_error());
        }
    }
}
?>
<!-- <html>

<head>
    <title>Attachments Files</title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/DT_bootstrap.css">
    <link rel="shortcut icon" type="image/png" href="../image/favicons.png">
</head>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>

<script type="text/javascript" charset="utf-8" language="javascript" src="../js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8" language="javascript" src="../js/DT_bootstrap.js"></script>

<style>
</style> -->


<div class="container">

    <div class="row">
        <div class="col-md- col-md-offset-2">
            <div>
                <h4>Policy Procedures Attachment files</h4>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    &nbsp; &nbsp;

                </div>
                <div class="panel-body">
                    <br />
                    <br />
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="dataTables-eg1">
                        <thead>
                            <tr>
                                <th width="90%" align="center">Files</th>
                                <th align="center">Action</th>
                            </tr>
                        </thead>
                        <?php
                        $query = $conn->query("SELECT * from policyregistration order by id desc");
                        while ($row = $query->fetch()) {
                            $name = $row['Location'];
                        ?>
                            <tr>

                                <td>
                                    &nbsp;<?php echo $name; ?>
                                </td>
                                <td>
                                    <button class="alert-success"><a href="download.php?filename=<?php echo $name; ?>&f=<?php echo $row['Location'] ?>">Download</a></button>
                                </td>
                            </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
include "footer.php";
?>