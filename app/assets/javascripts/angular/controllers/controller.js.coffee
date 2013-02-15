app = angular.module("LaughingMushrooms", ["ngResource"])	
# 
# app.config ($routeProvider, $locationProvider) ->
# 	$locationProvider.html5Mode(true)
# 
# 	$routeProvider
# 	.when("/archived", {controller: ArchivedCtrl, templateUrl: 'assets/hilight_list.html'})
# 	# .when("/delete/:hilightId", {controller: DeleteCtrl, templateUrl: 'assets/hilight_list.html'})
# 	.otherwise({controller: OrganizeCtrl, templateUrl: 'assets/hilight_list.html'})	
	

app.factory "Post", ["$resource", ($resource) ->
	$resource("/posts/:id", {id: "@id"}, {
		update: {method: "PUT"},
		archived: {method: "GET", params:{archived: true}, isArray: true},
		})  	
]

app.config ["$httpProvider", (provider) -> 
	provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
	provider.defaults.headers.put['Content-Type'] = 'application/json'
]

@OrganizeCtrl = ["$scope", "Post", ($scope, Post) ->
	$scope.title = "my feed"
	$scope.posts = Post.query()
	
	$scope.archivePost = (post) ->
		post.archived = true
		post.$update()	
			
		angular.element('.alert').remove()		
		angular.element('body').prepend('
		<div class="alert alert-success">
			post archived
			<button type="button" class="close" data-dismiss="alert">×</button>
		</div>')
		
		$scope.posts = Post.query()
		
	
	$scope.deletePost = (postId) ->
		Post.delete({id: postId})
		angular.element('.alert').remove()
		angular.element('body').prepend('
		<div class="alert alert-warning">
			post deleted
			<button type="button" class="close" data-dismiss="alert">×</button>
		</div>')
		
		$scope.posts = Post.query()
]

@ArchivedCtrl = ["$scope", "Post", ($scope, Post) ->
	$scope.title = "archived feed"
	$scope.posts = Post.archived()	
	
	$scope.dearchivePost = (post) ->
		post.archived = false
		post.$update()	
		angular.element('.alert').remove()
		angular.element('body').prepend('
		<div class="alert alert-success">
			post dearchived
			<button type="button" class="close" data-dismiss="alert">×</button>
		</div>')
		
		$scope.posts = Post.archived()	
		
		
	$scope.deletePost = (postId) ->
		Post.delete({id: postId})
		angular.element('.alert').remove()
		angular.element('body').prepend('
		<div class="alert alert-warning">
			post deleted
			<button type="button" class="close" data-dismiss="alert">×</button>
		</div>')

		$scope.posts = Post.archived()
	
]