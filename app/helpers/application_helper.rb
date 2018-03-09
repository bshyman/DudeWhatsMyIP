module ApplicationHelper
	def image_submit_tag(source, options = {})
        options = options.stringify_keys
        tag :input, { "alt" => image_alt(source), "type" => "image", "src" => path_to_image(source) }.update(options)
      end


    # helper_method :current_user

  def authenticate
  	redirect_to :login unless user_signed_in?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
  	# converts current_user to a boolean by negating the negation
  	!!current_user
  end

     
end
