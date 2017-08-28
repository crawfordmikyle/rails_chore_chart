$(function() {
    console.log( "ready!" );
    loadEventListeners();
});

function loadEventListeners(){
	$(".new_task").on("click",function(e){
		e.preventDefault()
		let postData = $(this).serialize();
		debugger
	})

	$(".update_task").on("click",function(e){
		e.preventDefault()
		let postData = $(this).serialize();
		debugger
	})
}