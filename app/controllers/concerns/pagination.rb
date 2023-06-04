module Pagination
  extend ActiveSupport::Concern

  included do
    private

    def remember_page
      return unless params[:page]

      session[:page] = params[:page]
    end

    def restore_page
      return unless session[:page]

      session.delete(:page)
    end

    def remember_action
      session[:last_action] = action_name
    end

    def adapter_restore_page
      return unless session[:last_action]
      return unless %w(show edit).include?(session[:last_action])

      session.delete(:last_action)

      return unless session[:page]

      session[:page]
    end
  end
end
