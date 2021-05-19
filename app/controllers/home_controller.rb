class HomeController < ApplicationController
  def homePage
    @items = Item.all
    @saveds = Saved.all
    # @saved_exists = Saved.where(item: @item, user: current_user) == [] ? false : true
  end

  def update
    # @items = Item.all

    saved = Saved.where(item: Item.find(params[:item]))
    puts "SAVED VALUE DEFINED:"
    puts saved
    if saved == []
      Saved.find_by_sql ["INSERT INTO saveds(item_id, created_at, updated_at) VALUES (?, ?, ?)", params[:item].to_i, Time.current, Time.current]
      # Saved.create(item: Item.find(params[:item]), user: current_user)
      # user Id hardcoded as 1
      # @saved_exists = true
    else
      Saved.find_by_sql ["DELETE FROM saveds where item_id = ?", params[:item].to_i]

      # saved.destroy_all
      # @saved_exists = false
    end

    respond_to do |format|
      format.html { }
      format.js { }
    end

    # redirect_to root_path
  end

  def men
    @items = Item.all
  end

  def women
    @items = Item.all
  end

  def kids
    @items = Item.all
  end

  def newins
    @items = Item.all
  end

  def saved
    @items = Item.all
  end

  def help
    @items = Item.all
  end

  def subscribe
    puts "SENDING EMAIL"
    UserNotifierMailer.send_signup_email(params[:email]).deliver
  end
end
