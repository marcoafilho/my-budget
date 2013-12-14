class PagesController < Devise::RegistrationsController
  def home
    build_resource({})
    respond_with self.resource
  end
end
