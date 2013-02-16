module ApplicationHelper

  def user
    current_user = User.find_by_id(session[:user_id])
    return current_user if current_user
    return nil
  end

  def filter_bar
    return '<input type="text" style="width: 800px" ng-model="search" placeholder="filter posts">'.html_safe
  end

  def dearchive_btn
    return '<button class="btn btn-success btn-mini" ng-click="dearchivePost(post)">dearchive</button>'.html_safe	
  end

  def delete_btn
    return '<button class="btn btn-danger btn-mini" ng-click="deletePost(post.id)">delete</button>'.html_safe
  end

  def archive_btn
    return '<button class="btn btn-success btn-mini" ng-click="archivePost(post)">archive</button>'.html_safe
  end


end
