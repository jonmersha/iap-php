<!-- jQuery -->
<script src="../js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="../js/metisMenu.min.js"></script>
<script src="../js/dataTables.bootstrap.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/datatables-responsive.js"></script>
<!-- Morris Charts JavaScript -->
<script src="../js/raphael.min.js"></script>
<script src="../js/morris.min.js"></script>
<script src="../js/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../js/sb-admin-2.js"></script>



<script type='text/javascript' src='../js/example.js'></script>
<script src="//cdn.ckeditor.com/4.6.2/basic/ckeditor.js"></script>

<script type="text/javascript">
  CKEDITOR.replace('editor')
</script>
<script type="text/javascript">
  CKEDITOR.replace('editorD')
</script>

<script type="text/javascript">
  CKEDITOR.replace('editor1')
</script>
<script type="text/javascript">
  CKEDITOR.replace('editor2')
</script>
<script type="text/javascript">
  CKEDITOR.replace('editor3')
</script>
<script type="text/javascript">
  CKEDITOR.replace('editor5')
</script>
<script type="text/javascript">
  CKEDITOR.replace('editorCause')
</script>
<script type="text/javascript">
  CKEDITOR.replace('editoref')
</script>

<script type="text/javascript">
  $('.date').datepicker({
    format: "dd-mm-yyyy",
    autoclose: true,
    todayHighlight: true,
  });
</script>
<script>
  $(function() {
    $('#dataTables-example').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true

    });
  });
</script>

<script type="text/javascript">
  $(document).ready(function() {
    $('.editbtn').on('click', function() {
      $('#editModal').modal('show');
      $try = $(this).closest('tr');

      var data = $tr.children("td").map(function() {

        return $(this).text();
      }).get();

      console.log(data);

      $('#up_id').val(data[0]);
      $('#Audit_activities').val(data[1]);
      $('#Team').val(data[2]);
      $('#Year').val(data[3]);
      $('#Quantity').val(data[4]);

      $('.editModal').modal('show');

    });
  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('.editbtn1').on('click', function() {
      $('#editModal1').modal('show');
      $try = $(this).closest('tr');


      var data = $tr.children("td").map(function() {

        return $(this).text();
      }).get();

      console.log(data);

      $('#id').val(data[0]);
      $('#Team').val(data[1]);
      $('#Audit_list').val(data[2]);
      $('#Quantity').val(data[3]);
      $('#Quarter_number').val(data[4]);
      $('#Start_date').val(data[4]);
      $('#End_date').val(data[4]);

      $('.editModal1').modal('show');

    });
  });
</script>

<script type="text/javascript">
  $(document).ready(function() {
    $('.editbtn2').on('click', function() {
      $('#editModal').modal('show');
      $try = $(this).closest('tr');

      var data = $tr.children("td").map(function() {

        return $(this).text();
      }).get();

      console.log(data);

      $('#id').val(data[0]);
      $('#name').val(data[1]);
      $('#designation').val(data[2]);
      $('#Address').val(data[3]);
      $('#email').val(data[4]);

      $('.editM').modal('show');
    });
  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#dataTables-exampleplc').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
      // dom: 'Blfrtip',
      "lengthMenu": [
        [10, 25, 50, -1],
        [10, 25, 50, "All"]


      ]

    });


  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#dataTables-eg1').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
    });
  });
</script>


<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted">

  <!-- Section: Links  -->


</body>

</html>