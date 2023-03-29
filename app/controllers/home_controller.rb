class HomeController < ApplicationController

    def index
        if current_user
            if current_user.teacher?
                render
            else

            end
          else
            redirect_to '/login'
          end
    end
    
end
 