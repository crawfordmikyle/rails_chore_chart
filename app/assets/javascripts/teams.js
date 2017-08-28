$(function() {
    console.log( "ready!" );
    loadEventListeners();
});

function loadEventListeners(){
	$(".accept-chore-btn").on("click",function(e){
		e.preventDefault()
		debugger
		console.log(this)
	})

	$(".complete-chore-btn").on("click",function(e){
		e.preventDefault()
		debugger
		console.log(this)
	})
}