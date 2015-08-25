module Optimadmin
  class ApplicationsController < Optimadmin::ApplicationController
    before_action :set_application, only: [:show, :edit, :update, :destroy]

    def index
      @applications = Optimadmin::BaseCollectionPresenter.new(collection: Application.where('title ILIKE ?', "#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ApplicationPresenter)
    end

    def show
    end

    def new
      @application = Application.new
    end

    def edit
    end

    def create
      @application = Application.new(application_params)
      if @application.save
        redirect_to applications_url, notice: 'Application was successfully created.'
      else
        render :new
      end
    end

    def update
      if @application.update(application_params)
        redirect_to applications_url, notice: 'Application was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @application.destroy
      redirect_to applications_url, notice: 'Application was successfully destroyed.'
    end

  private


    def set_application
      @application = Application.find(params[:id])
    end

    def application_params
      params.require(:applications).permit(:name, :grade, :speciality, :email, :phone_number, :date, :additional_information, :cv)
    end
  end
end
