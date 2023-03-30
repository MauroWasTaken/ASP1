class ApplicationController < ActionController::Base
    before_action :authenticate_person!, except: [:login]
    def current_user
        @current_user = current_person
    end
end