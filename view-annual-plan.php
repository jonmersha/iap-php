<?php

include 'header.php';

$viewAnnual = $oms->view_annual($_POST);

if (isset($_POST['submit'])) {

    $edAnnual = $oms->edit_annual($_POST);
}
if (isset($_POST['delete'])) {

    $delAnnual = $oms->del_annual($_POST);
}

?>


<!-- --------------------------------- -->
<!-- EDIT POP UP FORM (BOOTSTRAP MODAL) -->
<!-- --------------------------------- -->

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-10">
            <?php
            if (isset($saveReg['su'])) {
                echo $saveReg['su'];
            }
            ?>
            <h4 class="page-header">Approve for Annual Plan</h4>
        </div>

        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->

    <div class="row">

        <div class="col-lg-12">

            <div class="panel panel-default">
                <!-- <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button" value="">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div> -->
                <div class="panel-heading">

                </div>



                <!-- =========================================== -->


                <!-- /.panel-heading -->
                <div class="panel-body">

                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>


                                <th>ID</th>
                                <th>Audit Activity</th>
                                <!-- <th>Auditee Name/Team</th> -->
                                <th>Risk Score</th>
                                <th>Risk Level</th>
                                <th>Year</th>
                                <!-- <th>Quantity</th> -->

                                <th>Action</th>


                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($viewAnnual) {
                                foreach ($viewAnnual as $RegValue) {
                            ?>
                                    <tr class="odd gradeX">



                                        <td><?php echo $RegValue['id']; ?></td>
                                        
                                        <td><?php echo $RegValue['Team']; ?></td>
                                        <td><?php echo $RegValue['risk_score']; ?></td>
                                        <td><?php echo $RegValue['risk_lvl']; ?></td>
                                        <td><?php echo $RegValue['Year']; ?></td>
                                        

                                        <td>
                                            <button type="submit" class="btn btn-info btn-sm editbtn1" data-toggle="modal" data-target="#editModal1<?php echo $RegValue['id'] ?>"><span class="glyphicon glyphicon-edit"></span>Edit </button>
                                            <button type="submit" class="btn btn-danger btn-sm deletebtn " name="delete" value="Delete Data" data-toggle="modal" data-target="#deleteModal<?php echo $RegValue['id'] ?>"><span class="glyphicon glyphicon-trash"></span>Delete</button>
                                        </td>
                                    </tr>

                                    <!-- -----------------------Delete Modal----------------------------- -->

                                    <div class="modal modal-danger fade-in " id="deleteModal<?php echo $RegValue['id'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title" id="exampleModalLabel">Delete Confirmation</h3>
                                                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                                                </div>
                                                <form role="form" method="POST" action="#">
                                                    <div class="modal-body">
                                                        <input type="hidden" name="id" id="id" value="<?php echo $RegValue['id'] ?>">

                                                        <h4> Are You sure to delete this content!!</h4>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                                        <button type="submit" name="delete" class="btn btn-danger" value="delete">Yes</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- --------------------------------------------------------- -->

                                    <div class="modal fade" id="editModal1<?php echo $RegValue['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Edit and Approve Annual Plan</h5>
                                                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                                                </div>
                                                <form role="form" method="POST" action="#">
                                                    <div class="modal-body">
                                                        <input type="hidden" name="up_id" id="up_id" value="<?php echo $RegValue['id'] ?>">
                                                        <?php
                                                        if (isset($saveReg['id'])) {
                                                            echo $saveReg['id'];
                                                        }
                                                        ?>

                                                        <!-- <div class=" form-group">
                                                            <label>Audit Activities</label>
                                                            <input type="text" name="audit_activities" id="audit_activities" class="form-control" value="<?php echo $RegValue['audit_activities'] ?>" placeholder="Enter Audit Activities">

                                                        </div> -->
                                                        <!-- <div class="form-group">
                                                            <label>Team</label>
                                                            <input type="text" name="Team" id="Team" class="form-control" value="<?php echo $RegValue['Team'] ?>" placeholder="Enter Team">

                                                        </div> -->
                                                        <div class="form-group">
                                                            <label>Audit Object</label>
                                                            <input type="text" name="audit_object" id="audit_object" class="form-control" value="<?php echo $RegValue['audit_object'] ?>" placeholder="Enter Audit Object">

                                                        </div>
                                                        <div class="form-group">
                                                            <label>Risk Item</label>
                                                            <input type="text" name="risk_item" id="risk_item" class="form-control" value="<?php echo $RegValue['risk_item'] ?>" placeholder="Enter risk item">

                                                        </div>
                                                        <div class="form-group">
                                                            <label>Risk Score</label>
                                                            <input type="text" name="risk_score" id="risk_score" class="form-control" value="<?php echo $RegValue['risk_score'] ?>" placeholder="Enter risk score">

                                                        </div>
                                                        <div class="form-group">
                                                            <label>Risk Level</label>
                                                            <input type="text" name="risk_lvl" id="risk_lvl" class="form-control" value="<?php echo $RegValue['risk_lvl'] ?>" placeholder="Enter risk level">

                                                        </div>
                                                        <!-- <div class="form-group">
                                                            <label>Year</label>
                                                            <input type="text" name="Year" id="risk_lvl" class="form-control" value="<?php echo $RegValue['Year'] ?>" placeholder="Enter Year">

                                                        </div> -->
                                                        
                                                        <div class="form-group">
                                                            <label>Year</label>
                                                            <input type="text" name="Year" id="Year" class="form-control" data-date-format="mm-dd-yyyy" value="<?php echo $RegValue['Year'] ?>" placeholder="mm-dd-yyyy">

                                                        </div>

                                                        <!-- <div class="form-group">
                                                            <label>Quantity</label>
                                                            <input type="text" name="Quantity" id="Quantity" value="<?php echo $RegValue['Quantity'] ?>" class="form-control" placeholder="Enter Quantity">

                                                        </div> -->
                                                        <!-- <div class="form-group">
                                                            <label>Approval</label>
                                                            <input type="text" name="Approval" id="Approval" value="<?php echo $RegValue['Approval'] ?>" class="form-control" placeholder="Approval">

                                                        </div> -->
                                                        <div class="form-group">
                                                            <label>Approval</label>
                                                            <input type="text" name="Approval" id="Approval" value="<?php echo $RegValue['Approval'] ?>" class="form-control">

                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">

                                                        <button type="submit" name="submit" class="btn btn-info" value="submit">Update</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>



                            <?php
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                    <!-- <script>
                        function show() {
                            var rowId =
                                event.target.parentNode.parentNode.id;
                            //this gives id of tr whose button was clicked
                            var data =
                                document.getElementById(rowId).querySelectorAll(".row-data");
                            /*returns array of all elements with 
                            "row-data" class within the row with given id*/

                            var Audit_activities = data[0].innerHTML;
                            var Team = data[1].innerHTML;
                            

                        }
                    </script> -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<?php
include "footer.php";
?>