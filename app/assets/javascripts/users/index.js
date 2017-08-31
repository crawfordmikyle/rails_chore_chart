function User(id,name,teams,points,email){
	this.id = id
	this.name = name
	this.teams = teams
	this.points = points
	this.email = email

	this.keyWordString = function(){
		let str = name+","+email
		return str.toLowerCase();
	}

}

function liveSearch(users){
	debugger
	$("#live-search").keyup(function(){
		var searchField = $('#live-search').val().toLowerCase();
		var matchArray = []
		for (var i = users.length - 1; i >= 0; i--) {
			let keyWords = users[i].keyWordString();
			let searchLetters = searchField

			if (keyWords.match(searchLetters)){
				matchArray.push(users[i])
			}
		}
		$("#user-div").append()
	});
};

var users = []
$(function() {
	$.ajax({
        type: "GET",
        dataType: "json",
        url: "/users",
        success: function(responce){
        	let userData = responce.data;

        	for(var i = userData.length - 1; i >= 0; i--) {
        		let userID = userData[i].id
        		let userInfo = userData[i].attributes;
        		let userEmail = userInfo.email;
        		let userName = userInfo.name;
        		let userPoints = userInfo.points;
        		var teamNames = []
        		debugger
        		for (var ii = userInfo.teams.length - 1; ii >= 0; ii--) {
        			teamNames.push(userInfo.teams[ii].name)
        		}
        		users.push(new User(userID,userName,teamNames,userPoints,userEmail));
        	}
        },
        complete: function(){
        	liveSearch(users);
        }
    });


});

