class ApplicationsController < ApplicationController

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      ApplicationMailer.application_created(@application).deliver_now
      redirect_to root_path, notice: "Thank you for your application"
    else
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit!
  end
end