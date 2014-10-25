class DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :apply, :cancel_apply]
  before_action :redirect_if_non_logged_in, only: [:new, :edit, :create, :update]

  # GET /demands
  # GET /demands.json
  def index
    @demands = Demand.all
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
  end

  # GET /demands/new
  def new
    @demand = current_user.demands.new
  end

  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = current_user.demands.new(demand_params)

    respond_to do |format|
      if @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully created.' }
        format.json { render :show, status: :created, location: @demand }
      else
        format.html { render :new }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
  def update
    respond_to do |format|
      if @demand.update(demand_params)
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { render :show, status: :ok, location: @demand }
      else
        format.html { render :edit }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to demands_url, notice: 'Demand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def apply
    unless current_user.already_apply_for?(@demand)
      current_user.apply!(@demand)
      Notification.send_notification_for(current_user, @demand)
    else
      flash.now[:warning] = "你已經應徵過了，請耐心等待"
    end
    redirect_to @demand
  end

  def cancel_apply
    if current_user.already_apply_for?(@demand)
      current_user.cancel_apply!(@demand)
    else
      flash.now[:warning] = "無效的操作"
    end
    redirect_to @demand
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_params
      params.require(:demand).permit(:description, :user_id, { arrangement_ids: [] }, { specification_ids: [] })
    end

    def redirect_if_non_logged_in
      unless logged_in?
        store_location
        flash.now[:danger] = "請先登入"
        redirect_to login_url
      end
    end
end
