
$(function(){
	
$('.modalButton').click(function(){
    	$('#modalView').modal('show').find('#modalContentView').load($(this).attr('value'));
        });

$('.lateButton').click(function(){
    	$('#modalView').modal('show').find('#modalContentView').load($(this).attr('value'));
        });

});

