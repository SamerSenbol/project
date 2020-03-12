@include('layouts.header')
@yield('center')
 @yield('content')
@include('layouts.footer')

<script type="text/javascript">
    
    var sum = 0;
    $(".amount_total").each(function(){
        sum += +$(this).val();
    });
    $("#display_total_amount").html(sum);

     var sumq = 0;
    $(".cart_quantity_input").each(function(){
        sumq += +$(this).val();
    });
    $("#display_total_quantity").html(sumq);


$(".cart_quantity_input").change(function(){

	var id = $(this).attr('id');
	var data = $(this).attr('data');
	var val = $(this).val();

	var totalp = Number(val) * Number(data);
	$(".p"+id).val(totalp);
	$("."+id).html("Kr "+totalp);

  	var sum = 0;
    $(".amount_total").each(function(){
        sum += +$(this).val();
    });
    $("#display_total_amount").html("Kr "+sum);
    $("#display_total_amount_val").val(sum);

     var sumq = 0;
    $(".cart_quantity_input").each(function(){
        sumq += +$(this).val();
    });
    $("#display_total_quantity").html(sumq);
});

</script>