@commentCtrl = ["$scope", "Comment", ($scope, Comment) ->

	$scope.commentSubmit = (comment, post_id) ->
		scope: 
			post: '='
		comment = Comment.save({post_id: post_id, comment: comment})
		$scope.post.comments.push(comment);
		
		
]