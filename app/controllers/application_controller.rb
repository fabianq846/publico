class ApplicationController < ActionController::Base
    before_action :authenticate_user!

  def create
    @application = current_user.applications.new(job_offer_id: params[:job_offer_id])
    if @application.save
      # Notificar a Esteban (esto puede hacerse con ActionMailer, pero dejaremos un placeholder)
      redirect_to job_offers_path, notice: 'Successfully applied for the job!'
    else
      redirect_to job_offers_path, alert: 'Error applying for the job.'
    end
  end
end
unless Rails.application.config.consider_all_requests_local
  rescue_from ActionController::RoutingError, with: -> { render_404  }
end

def render_404
  respond_to do |format|
    format.html { render template: 'errors/not_found', status: 404 }
    format.all  { render nothing: true, status: 404 }
  end
end
