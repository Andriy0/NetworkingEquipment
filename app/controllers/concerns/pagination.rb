module Pagination
  extend ActiveSupport::Concern

  included do
    private

    def remember_page
      if params[:page]
        session[:page] = params[:page]
      end
    end

    def restore_page
      if session[:page]
        session.delete(:page)
      end
    end

    def remember_action
      session[:last_action] = action_name
    end

    def adapter_restore_page
      if session[:last_action]
        if ['show', 'edit'].include?(session[:last_action])
          last_action = session.delete(:last_action)
          
          if session[:page]
            session[:page]
          end
        end
      end
    end
    
  end
end
