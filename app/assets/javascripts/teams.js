function loadEventListeners(){
	$(".accept-chore-btn").on("click",function(e){
		e.preventDefault()
		console.log(this)
	})
	$(".complete-chore-btn").on("click",function(e){
		e.preventDefault()
		console.log(this)
	})
}

$(function() {
    console.log( "ready!" );
    loadEventListeners();
});