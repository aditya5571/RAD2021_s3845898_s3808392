class NewusersController < ApplicationController
  before_action :set_newuser, only: %i[ show edit update destroy ]

  # GET /newusers or /newusers.json
  def index
    @newusers = Newuser.all
  end

  # GET /newusers/1 or /newusers/1.json
  def show
  end

  # GET /newusers/new
  def new
    @newuser = Newuser.new
  end

  # GET /newusers/1/edit
  def edit
  end

  # POST /newusers or /newusers.json
  def create
    @newuser = Newuser.new(newuser_params)

    respond_to do |format|
      if @newuser.save
        format.html { redirect_to @newuser, notice: "Newuser was successfully created." }
        format.json { render :show, status: :created, location: @newuser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @newuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newusers/1 or /newusers/1.json
  def update
    respond_to do |format|
      if @newuser.update(newuser_params)
        format.html { redirect_to @newuser, notice: "Newuser was successfully updated." }
        format.json { render :show, status: :ok, location: @newuser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @newuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newusers/1 or /newusers/1.json
  def destroy
    @newuser.destroy
    respond_to do |format|
      format.html { redirect_to newusers_url, notice: "Newuser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newuser
      @newuser = Newuser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def newuser_params
      params.require(:newuser).permit(:name, :email, :login)
    end
end
