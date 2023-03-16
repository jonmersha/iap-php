<?php
include "tm_header.php";

//$auditType_select = $oms->select_auditType();
//$audit_activities = $oms->select_audit_activities();
$audit_object = $oms->select_audit_object();
// $Team = $oms->select_team();
// $listAudit_select = $oms->select_auditee();
$viewM = $oms->view_annual();
$risk_lvl = $oms->select_risk_level();
// $risk_itm = $oms->select_risk_item();
if (isset($_POST['submit'])) {
    // $register = $oms->reg_finding($data);

    $saveReg = $oms->annual_tm_plan($_POST);
}
if (isset($_POST['edit'])) {
    $editch = $oms->edit_anual_plan($_POST);
}
?>

<div id="page-wrapper">

    <div class="row">
        <div class="col-lg-10">
            <?php
            if (isset($saveReg['su'])) {
                echo $saveReg['su'];
            }
            ?>
            <h4 class="page-header">Annual Plan</h4>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- <button type="button" class="btn btn-info" ><a href=""> Audit Activities</a></button> -->

    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#form_modal"><span class="glyphicon glyphicon-plus"></span>Create New Plan</button> &nbsp; &nbsp;
    <a href="audit_object.php" class="badge badge-info"><span class="glyphicon glyphicon-plus"></span>Audit Object</a> &nbsp; &nbsp;
    <!-- <a href="team.php" class="badge badge-info"><span class="glyphicon glyphicon-plus"></span>Team</a> -->
    <div class="row">
        <div class="col-sm-10">


        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">

                <div class="panel-heading">

                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">

                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-eg1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <!-- <th>Serial</th> -->
                                <th>Auditee</th>
                                <th>Risk Item</th>
                                <th>Risk Score</th>
                                <th>Risk Level</th>
                                <th>Year</th>
                                <!-- <th>Name</th> -->
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($viewM) {
                                foreach ($viewM as $RegValue) {
                            ?>
                                    <tr class="odd gradeX">
                                        <td><?php echo $RegValue['id']; ?></td>
                                        
                                        <td><?php echo $RegValue['audit_object']; ?></td>
                                        <td><?php echo $RegValue['risk_item']; ?></td>
                                        <td><?php echo $RegValue['risk_score']; ?></td>
                                        <td><?php echo $RegValue['risk_level']; ?></td>
                                        <td><?php echo $RegValue['Year']; ?></td>
                                        
                                        <td>
                                            <!-- <button type="button" data-id="1" class="btn btn-default btn-view" data-toggle="modal" data-target="#myModal">View</button> -->
                                            <button type="submit" class="btn btn-info btn-sm editbtn" data-toggle="modal" data-target="#editModal2<?php echo $RegValue['id'] ?>"><span class="glyphicon glyphicon-eye-open">View</span></button>
                                            <button type="submit" class="btn btn-primary editbtn1" data-toggle="modal" data-target="#editModal3<?php echo $RegValue['id'] ?>"><span class="glyphicon glyphicon-edit"></span>Edit </button>
                                        
                                        </td>
                                        
                                    </tr>
                                    

                                        <!-- View Modal for each Record -->
                                    <div class="modal fade" id="editModal2<?php echo $RegValue['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h5 class="modal-title" id="exampleModalLabel"><i class="glyphicon glyphicon-file"></i>View record detail</h5>
                                                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                                                </div>
                                                <form role="form" method="POST" action="#">
                                                    <div class="modal-body">
                                                        
                                                        <div class="form-group">
                                                            <label>Auditee:</label><?php echo $RegValue['audit_object'] ?>

                                                        </div>
                                                        
                                                      

                                                        <div class="form-group">
                                                            <label>Risk Item:</label><?php echo $RegValue['risk_item'] ?>

                                                        </div>
                                                        <div class="form-group">
                                                            <label>Risk Score:</label><?php echo $RegValue['risk_score'] ?>

                                                        </div>
                                        
                                                        <div class="form-group">
                                                            <label>Risk Level:</label><?php echo $RegValue['risk_level'] ?>

                                                        </div>
                                                        <div class="form-group">
                                                                <label>Year:</label><?php echo $RegValue['Year'] ?>

                                                            </div>
                                                    </div>
                                                    <!-- <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        
                                                    </div> -->
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Edit Record -->
                                    <div class="modal fade" id="editModal3<?php echo $RegValue['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Update the records</h5>
                                                    <div class="row">

                                                        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                                                    </div>
                                                    <form role="form" method="POST" action="#">
                                                        <div class="modal-body">
                                                            <input type="hidden" name="up_id" id="up_id" value="<?php echo $RegValue['id'] ?>">
                                                            

                                                            <div class="form-group">
                                                                <label>Auditee</label>
                                                                <input type="text" name="audit_object" id="audit_object" class="form-control" value="<?php echo $RegValue['audit_object'] ?>" placeholder="Edit Audit Object">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Audit type</label>
                                                                <input type="text" name="audit_type" id="audit_type" class="form-control" value="<?php echo $RegValue['audit_type'] ?>" placeholder="Edit audit type">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Risk Item</label>
                                                                <input type="text" name="risk_item" id="risk_item" class="form-control" value="<?php echo $RegValue['risk_item'] ?>" placeholder="Edit Risk Item">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Risk Score</label>
                                                                <input type="text" name="risk_score" id="risk_score" class="form-control" value="<?php echo $RegValue['risk_score'] ?>" placeholder="Edit Risk Score">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Risk Level</label>
                                                                <input type="text" name="risk_level" id="risk_level" class="form-control" value="<?php echo $RegValue['risk_level'] ?>" placeholder="Edit Risk Level">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Year</label>
                                                                <input type="text" name="Year" id="Year" class="form-control" value="<?php echo $RegValue['Year'] ?>" placeholder="Edit Year">

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Updated by:</label>
                                                                <input value="<?php echo Session::get("name"); ?>" class="form-control" disabled>

                                                            </div>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        </div>
                                                        <div class="modal-footer">

                                                            <button type="submit" name="edit" class="btn btn-info" value="edit">Update</button>
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

                    <!-- Modal -->
					


                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
    </div>
    <!-- /.row -->
</div>



<!-- <div class="cliyerfix"></div> -->
<!-- /.row -->
</div>
<!-- /#page-wrapper -->
<div class="modal fade" id="form_modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="#">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Plan</h5>
                </div>
                <div class="modal-body">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">

                        <div class="form-group">
                            <label>Auditee</label>
                            <select name="audit_object" class="form-control">
                                <option value="">--- Select ---</option>
                                <?php
                                if (isset($audit_object)) {
                                    foreach ($audit_object as $value) {
                                ?>
                                        <option value="<?php echo $value['audit_object']; ?>"> <?php echo $value['audit_object']; ?> </option>
                                <?php }
                                } ?>
                            </select>
                            <?php
                            if (isset($saveM['audit_object'])) {
                                echo $saveM['audit_object'];
                            }
                            ?>
                        </div>
                        <div class="form-group">
                            <label>Audit Type</label>
                            <select name="audit_type" class="form-control">
                                <option value="">--- Select ---</option>
                                <?php
                                if (isset($audit_type)) {
                                    foreach ($audit_type as $value) {
                                ?>
                                        <option value="<?php echo $value['audit_type']; ?>"> <?php echo $value['audit_type']; ?> </option>
                                <?php }
                                } ?>
                            </select>
                            <?php
                            if (isset($saveM['audit_type'])) {
                                echo $saveM['audit_type'];
                            }
                            ?>
                        </div>

                        
                        <!-- <div class="form-group">
                            <label>Auditee Name</label>
                            <input type="text" name="auditee_name" class="form-control" placeholder="Enter auditee name/Team/District/Branches">
                            
                        </div> -->
                        <div class="form-group">
                        <label>Risk Item</label>
                            <input type="text" name="risk_item" class="form-control" placeholder="Enter risk item">
                            <?php
                            if (isset($saveM['risk_item'])) {
                                echo $saveM['risk_item'];
                            }
                            ?>  
                        </div>
                        <div class="form-group">
                            <label>Risk Score</label>
                            <input type="number" name="risk_score" class="form-control" placeholder="Enter Risk Score">
                            <?php
                            if (isset($saveM['risk_score'])) {
                                echo $saveM['risk_score'];
                            }
                            ?>
                        </div>
                        <div class="form-group">
                            <label>Risk Level</label>
                            <select name="risk_level" class="form-control">
                                <option value="">--- Select ---</option>
                                <?php
                                if (isset($risk_lvl)) {
                                    foreach ($risk_lvl as $value) {
                                ?>
                                        <option value="<?php echo $value['risk_level']; ?>"> <?php echo $value['risk_level']; ?> </option>
                                <?php }
                                } ?>
                            </select>
                            <?php
                            if (isset($savec['risk_level'])) {
                                echo $savec['risk_level'];
                            }
                            ?>
                        </div>
                        
                        <div class="form-group">
                        <label>Year</label>
                            <input type="text" name="Year" class="form-control" placeholder="Enter year">
                            <?php
                            if (isset($saveM['Year'])) {
                                echo $saveM['Year'];
                            }
                            ?>  
                        </div>
                    </div>
                </div>
                <div style="clear:both;"></div>
                <div class="modal-footer">
                    <button type="submit" name="submit" class="btn btn-info" value="submit"><span class="glyphicon glyphicon-save"></span> Save</button>
                    <button class="btn btn-danger" type="button" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Close</button>
                </div>
        </div>
        </form>
    </div>
</div>

<?php
include "footer.php";
?>