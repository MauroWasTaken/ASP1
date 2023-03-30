class HomeController < ApplicationController

    def index
        if current_user.student?
            redirect_to '/grades'
        elsif current_user.teacher?
            redirect_to '/lectures'
        end
    end
    
end
 