function User(id,name,teams,points,email){
	this.id = id
	this.name = name
	this.teams = teams
	this.points = points
	this.email = email

	this.handlebarsData = {id: id, name: name, teams: teams, points: points}
}

User.prototype.keyWordString = function(){
	let str = this.name+","+this.email
	return str.toLowerCase();
}

function liveSearch(users){

	// for (let i = users.length - 1; i >= 0; i--) {
	//   var source = $("#user-template").html();
	//   var template = Handlebars.compile(source);
	//   $("#user-div").append(template(users[i].handlebarsData));
	// }

  users.forEach((user)=>{
    let source = $("#user-template").html();
    let template = Handlebars.compile(source);
    $("#user-div").append(template(user.handlebarsData));
  })

	$("#live-search").keyup(function(){
		$("#user-div").empty();
		var searchField = $('#live-search').val().toLowerCase();
		var matchArray = []

		// for (let i = users.length - 1; i >= 0; i--) {
		//   let keyWords = users[i].keyWordString();
		//   let searchLetters = searchField

		// if (keyWords.match(searchLetters)){
		// 	 matchArray.push(users[i])
		//  }
		// }

    users.forEach((user)=>{
      let keyWords = user.keyWordString();
      let searchLetters = searchField;

      if (keyWords.match(searchLetters)){
        matchArray.push(user)
      }
    })

		// for (let i = matchArray.length - 1; i >= 0; i--) {
		// 	var source   = $("#user-template").html();
		// 	var template = Handlebars.compile(source);
		// 	$("#user-div").append(template(matchArray[i].handlebarsData));
		// }

    matchArray.forEach((user)=>{
      var source   = $("#user-template").html();
      var template = Handlebars.compile(source);
      $("#user-div").append(template(user.handlebarsData));
    })

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

        	for(let i = userData.length - 1; i >= 0; i--) {
        		let userID = userData[i].id
        		let userInfo = userData[i].attributes;
        		let userEmail = userInfo.email;
        		let userName = userInfo.name;
        		let userPoints = userInfo.points;
        		var teamNames = []
        		for (let i = userInfo.teams.length - 1; i >= 0; i--) {
        			teamNames.push(userInfo.teams[i].name)
        		}
        		users.push(new User(userID,userName,teamNames.toString(),userPoints,userEmail));
        	}
        },
        complete: function(){
        	liveSearch(users);
        }
    });
});

