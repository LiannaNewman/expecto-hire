module CompaniesHelper
  def find_company(user)
    if current_user && current_user.company_id != nil
      content_tag(:h2, Company.find_by(id: user.company_id).company_name)
    end
  end
end
