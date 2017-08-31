function User(id,name,teams,points,email){
	this.id = id
	this.name = name
	this.teams = teams
	this.points = points
	this.email = email

	this.keyWordString = function(){
		return name+","+email
	}

}

function liveSearch(users){
	debugger
}

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
        		let teamNames = []

        		//if (userInfo.teams.length > 0){
	        	//	for (var i = userInfo.teams.length - 1; i >= 0; i--) {
	        	//		teamNames.push(userInfo.teams[i].name)
	        	//	}
        		//}

        		users.push(new User(userID,userName,teamNames,userPoints,userEmail));
        	}
        },
        complete: function(){
        	liveSearch(users);
        }
    })


});

