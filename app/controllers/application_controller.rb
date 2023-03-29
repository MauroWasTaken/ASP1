class ApplicationController < ActionController::Base
    def current_user
        current_person
    end
end