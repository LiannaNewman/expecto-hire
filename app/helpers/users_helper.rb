module UsersHelper
  def display_name(user)
    if current_user && current_user.company_id != nil
      current_user.first_name
    end
  end
end
