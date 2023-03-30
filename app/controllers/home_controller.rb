class HomeController < ApplicationController

    def index
        if current_person.student?
            redirect_to '/grades'
        elsif current_person.teacher?
            redirect_to '/lectures'
        end
    end
    
end
 