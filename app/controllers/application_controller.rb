class ApplicationController < ActionController::Base
    before_action :authenticate_person!, except: [:login]
end