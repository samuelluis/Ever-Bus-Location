$(function(){
	
	$("#route_id").change(function(){
		$("#is_going").val($(this).find("option:selected").attr("going"));
	});
	
	var fetchingFilters = null;
	$("#filters").submit(function(){
		if(fetchingFilters) fetchingFilters.abort();
		fetchingFilters = $.ajax({
			type:"POST",
			url:"/public/filter",
			data:$(this).serialize(),
			success: function(data){
				fetchingFilters = null;
				$("#response").html(data);
			}
		});
		return false;
	});
});