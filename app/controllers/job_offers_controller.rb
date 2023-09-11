class JobOffersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :ensure_esteban, only: [:new, :create, :edit, :update, :destroy]

  def index
    @job_offers = JobOffer.all
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end

  def new
    @job_offer = JobOffer.new
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    if @job_offer.save
      redirect_to @job_offer, notice: 'Job offer was successfully created.'
    else
      render :new
    end
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:title, :description)
  end

  def ensure_esteban
    unless current_user && current_user.email == 'esteban@example.com'
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
