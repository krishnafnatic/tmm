<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <title>{{ config('app.name', 'Laravel') }}</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
  <!-- Tell the browser to be responsive to screen width width=device-width, initial-scale=1, shrink-to-fit=no -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/bootstrap/dist/css/bootstrap.min.css' ) }}" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/font-awesome/css/font-awesome.min.css' ) }}" />
  <!-- Select2 -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/select2/dist/css/select2.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset( 'backend/dist/css/AdminLTE.min.css' ) }}" />
  <!-- backend Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="{{ asset( 'backend/dist/css/skins/_all-skins.min.css' ) }}" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">
  @include('backend.elements.header')
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    @include('backend.elements.sidebar')
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  @yield('content')
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    @include('backend.elements.footer')
  </footer>
</div>
<!-- ./wrapper -->
<!-- jQuery 3 -->
<script src="{{ asset( 'backend/bower_components/jquery/dist/jquery.min.js' ) }}"></script>
<!-- Bootstrap 3.3.7 -->
<script src="{{ asset( 'backend/bower_components/bootstrap/dist/js/bootstrap.min.js' ) }}"></script> 
<!-- backend App -->
<script src="{{ asset( 'backend/dist/js/adminlte.min.js' ) }}"></script>
<!-- backend for demo purposes -->
<script src="{{ asset( 'backend/dist/js/demo.js' ) }}"></script>
<script>
$(document).ready(function(){      
      var postURL = "<?php echo url('admin/setting'); ?>";
      var option = '';
      <?php 
        if( isset( $playlist ) && count( $playlist ) > 0 ) {
          foreach( $playlist as $listing ) {
      ?>
        option += "<option value='{{ $listing['slug'] }}'>{{ $listing['name'] }}</option>";
      <?php
          }
        }
      ?>

      if( count>1 ) {
        var i=count;
      } else {
        var i=1;  
      }


      $('#add').click(function(){  
          i++;  
          var html  = '<tr id="row_'+i+'">';
              html += '<td><select name="setting['+i+'][type]" id="type_'+i+'" class="form-control select_'+i+'" onchange="getval(this, '+i+');"><option value="0"> Select</option><option value="ads"> Advertisement</option><option value="popular">Popular</option><option value="most">Most Viewed</option>'+option+'</select><span class="help-block" id="type_error_'+i+'"></span></td>' + '<td class="text-center" id="heading_'+i+'"><input name="setting['+i+'][heading]" type="text" placeholder="Add heading" class="form-control" size="10" style="" required /><span class="help-block" id="order_error_'+i+'"></span></td>' + '<td class="text-center" id="order_'+i+'"><input name="setting['+i+'][order]" type="text" placeholder="Add Order" class="form-control" size="10" style="" required /><span class="help-block" id="order_error_'+i+'"></span></td>' + '<td class="text-center"><select name="setting['+i+'][status]" id="status_'+i+'" class"form-control><option value="active">Active</option><option value="inactive">In Active</option></select></td>'
          html += '</tr>';
          
          $('#dynamic_field').append(html);

           //$('#dynamic_field').append('<tr id="row'+i+'" class="dynamic-added"><td><input type="text" name="name[]" placeholder="Enter your Name" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  
      });  


      $(document).on('click', '.btn_remove', function(){  
           var button_id = $(this).attr("id");   
           $('#row_'+button_id+'').remove();  
      }); 


      function printErrorMsg (msg) {
         $(".print-error-msg").find("ul").html('');
         $(".print-error-msg").css('display','block');
         $(".print-success-msg").css('display','none');
         $.each( msg, function( key, value ) { 
            $(".print-error-msg").find("ul").append('<li>'+value+'</li>');
         });
      }
    });

    function getval(sel, i) {

      // var append = '<input type="file" name="setting['+i+'][image]" id="image_'+i+'"  multiple="true" accept="image/*" /><input type="text" name="setting['+i+'][order]" id="order_'+i+'" placeholder="Add Order" class="form-control" autocomplete="off" required /><input type="text" name="setting['+i+'][width]" id="width_'+i+'" placeholder="Add width of image" class="form-control" autocomplete="off" required /><input type="text" name="setting['+i+'][height]" id="height_'+i+'" placeholder="Add height of image" class="form-control" autocomplete="off" required />';

      var append = '<input type="file" name="setting['+i+'][image]" id="image_'+i+'"  multiple="true" accept="image/*" /><input type="text" name="setting['+i+'][order]" id="order_'+i+'" placeholder="Add Order" class="form-control" autocomplete="off" required />';

      var order = '<input type="text" name="setting['+i+'][order]" id="order_'+i+'" placeholder="Add Order" class="form-control" autocomplete="off" required />';

      if( sel.value == 'ads' ){
          $("#row_"+i+' #order_'+i).html( append );
      } else {
          $("#row_"+i+' #order_'+i).html( order );
      }
    }

    function addImage( i ){
      alert(i);
    }
</script>
</body>
</html>