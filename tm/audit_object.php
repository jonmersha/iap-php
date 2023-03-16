<?php
include "tm_header.php";

$viewM = $oms->select_audit_type();

if (isset($_POST['submit'])) {
    // $register = $oms->reg_finding($data);
    $saveReg = $oms->audit_object($_POST);
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
            <h5 class="page-header">Audit Object</h5>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-sm-10">

            <form role="form" method="post">
                <div class="form-group">
                    <a href="view_annualplan.php" class="badge badge-info"><i class="fa fa-arrow-circle-left"></i> &nbsp;Back</a>&nbsp;
                    <label>Audit Object</label>
                    <input type="text" name="audit_object" class="form-control" required>
                    <?php
                    if (isset($saveReg['audit_object'])) {
                        echo $saveReg['audit_object'];
                    }
                    ?>
                </div>
                <input type="submit" name="submit" class="btn btn-info" value="submit" />
            </form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-sm-10">

        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-md-offset-0">
            <div class="panel panel-default">

                <div class="panel-heading">
                <h5>List of Audit Object</h5>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body" width="auto">

                    <table width="auto" class="table table-striped table-bordered table-hover" id="dataTables-eg1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Audit Object</th>
                                
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
                                        
                                    </tr>

                            <?php
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
    </div>
    <!-- /.row -->
</div>


<?php
include "footer.php";
?>