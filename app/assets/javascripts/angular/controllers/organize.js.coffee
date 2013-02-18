@OrganizeCtrl = ["$scope", "Post", ($scope, Post) ->
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
		
		
	$scope.likeTogglePost = (post) ->
		post.liked = !post.liked
		post.$update()
]