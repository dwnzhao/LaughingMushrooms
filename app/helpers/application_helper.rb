module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'common/error_messages', :locals => {:object => object})
  end


  def user
    current_user = User.find_by_id(session[:user_id])
    return current_user if current_user
    return nil
  end

  def filter_bar
    return '<input type="text" style="width: 800px" ng-model="search" placeholder="filter posts">'.html_safe
  end

  def dearchive_btn
    return '<button class="btn btn-info btn-mini pull-right" ng-click="dearchivePost(post)">dearchive</button>'.html_safe	
  end

  def delete_btn
    return '<button class="btn btn-danger btn-mini pull-right" ng-click="deletePost(post.id)">delete</button>'.html_safe
  end

  def archive_btn
    return '<button class="btn btn-info btn-mini pull-right" ng-click="archivePost(post)">archive</button>'.html_safe
  end


  def comment_btn
    return '<button ng-click="commentStarted(post, comment)" class="btn btn-info btn-mini">add a comment</button>'.html_safe
  end
end
