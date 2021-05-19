class SubscribersController < ApplicationController
  def subscriber
    @subscriber = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    
    if @subscriber.save
      cookies[:saved_lead] = true
      redirect_to root_path, notice: "Saved succesfully!"
    else
      redirect_to root_path, notice: "Failed to save"
    end
  end

  def edit
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:name, :email)
    end
end
