module UsersHelper
  def user_possesive
    if @user == current_user
      "My"
    else
      @user.first_name.capitalize + "'s"
    end
  end
end
