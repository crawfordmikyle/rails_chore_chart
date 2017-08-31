var users = []

function User(name,teams,points){
	this.name = name
	this.teams = teams
	this.points = points
}

$(function() {
	$.ajax({
        type: "GET",
        dataType: "json",
        url: "/users",
        success: function(responce){
        	let userData = responce.data;
        	for(var i = userData.length - 1; i >= 0; i--) {
        		let userInfo = userData[i].attributes;
        		let userName = userInfo.name;
        		let userPoints = userInfo.points;
        		let userTeams = userInfo.teams;
        		users.push(new User(userName,userTeams,userPoints));
        	}
        }
    });

     
});

