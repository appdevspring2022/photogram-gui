class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({ :username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end

  def show
    input=params.fetch("path_username") # fetch parameters first!!!!!!!!!!!!!
    matching_users=User.where({ :username => input})
    @user=matching_users.at(0) # be logic

    render({:template => "user_templates/show.html.erb"})
  end

  def create
  input=params.fetch("input_user")
  a_new_user=User.new
  a_new_user.username=input
  a_new_user.save

  redirect_to("/users/"+a_new_user.username)
  end

  def update
    input_name=params.fetch("input_user")
    user_id=params.fetch("path_id")
    user=User.where(:id=>user_id).at(0)
    user.username=input_name
    user.save
  
    redirect_to("/users/"+user.username)
    end
end
