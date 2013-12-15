module PagesHelper
  def first_field_with_errors(field)
    controller_name.eql?('registrations') && @user.errors.first[0].eql?(field)
  end
end
