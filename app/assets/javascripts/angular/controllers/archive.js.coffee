@ArchivedCtrl = ["$scope", "Post", ($scope, Post) ->
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