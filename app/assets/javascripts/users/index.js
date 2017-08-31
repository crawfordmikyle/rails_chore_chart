function User(id,name,teams,points){
	this.id = id
	this.name = name
	this.teams = teams
	this.points = points
}

function liveSearch(){
	let = input = $()
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
        		let userName = userInfo.name;
        		let userPoints = userInfo.points;
        		let teamNames = []

        		//if (userInfo.teams.length > 0){
	        	//	for (var i = userInfo.teams.length - 1; i >= 0; i--) {
	        	//		teamNames.push(userInfo.teams[i].name)
	        	//	}
        		//}

        		users.push(new User(userID,userName,teamNames,userPoints));
        	}
        },
        complete: function(){
        	for (var i = users.length - 1; i >= 0; i--) {
        		var source   = $("#user-template").html();
						var template = Handlebars.compile(source);
						$("#user-div").append (template(users[i]));
        	}
        }
    })


});

