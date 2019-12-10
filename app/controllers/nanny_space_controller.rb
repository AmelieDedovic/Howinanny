class NannySpaceController < ApplicationController
  layout 'application_nanny'
  # before_action :authenticate_nanny!
  def after_sign_in_path_for(nanny_space)
    super(nanny_space)
    nanny_space_conversations_path # or whatever path you want here
  end
end
