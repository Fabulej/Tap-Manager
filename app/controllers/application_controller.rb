class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :pub_and_taps

    private

    def pub_and_taps
      if user_signed_in?
        unless current_user.pub
          flash[:error] = "You should start by creating a pub!"
          redirect_to new_pub_path
        else
          unless current_user.pub && current_user.pub.taps.any?
            flash[:error] = "Don't you think your pub needs some taps?"
            redirect_to new_tap_path
          end
        end
      end
    end
end
