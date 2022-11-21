class UsersController < ApplicationController

  def new
  end

  def create
     user = User.new(user_params)
     @user.user_name = current_user.name
     @user.user_introduction = current_user.introduction
     user.save
     redirect_to '/books'
  end



  def edit
  end


     private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
