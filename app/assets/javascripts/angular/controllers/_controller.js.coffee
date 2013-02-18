app = angular.module("LaughingMushrooms", ["ngResource"])

app.directive "addComment", -> 
	restrict: 'E'
	scope: true
	templateUrl: 'assets/comment_box.html'


# app.config ($routeProvider, $locationProvider) ->
# 	$locationProvider.html5Mode(true)
# 
# 	$routeProvider
# 	.when("/archived", {controller: ArchivedCtrl, templateUrl: 'assets/hilight_list.html'})
# 	# .when("/delete/:hilightId", {controller: DeleteCtrl, templateUrl: 'assets/hilight_list.html'})
# 	.when("/home", {controller: OrganizeCtrl})	
# 	

app.factory "Post", ["$resource", ($resource) ->
	$resource("/posts/:id", {id: "@id"}, {
		update: {method: "PUT"},
		archived: {method: "GET", params:{archived: true}, isArray: true},
		})  	
]

app.factory "Comment", ["$resource", ($resource) ->
	$resource("/comments/:id", {id: "@id"}, {
		update: {method: "PUT"},
		})  	
]

app.config ["$httpProvider", (provider) -> 
	provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
	provider.defaults.headers.put['Content-Type'] = 'application/json'
]


@mainCtrl = ["$scope", "Post", ($scope, Post) ->

]