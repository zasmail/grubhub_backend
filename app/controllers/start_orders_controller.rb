class StartOrdersController < ApplicationController
  before_action :set_start_order, only: [:show, :edit, :update, :destroy]

  # GET /start_orders
  # GET /start_orders.json
  def index
    @start_orders = StartOrder.all
  end

  # GET /start_orders/1
  # GET /start_orders/1.json
  def show
  end

  # GET /start_orders/new
  def new
    @start_order = StartOrder.new
    respond_to do |format|
      if @start_order.save
        PlaceOrdersJob.perform_now
        format.html { redirect_to @start_order, notice: 'Start order was successfully created.' }
        format.json { render :index, status: :created, location: @start_order }
      else
        format.html { render :new }
        format.json { render json: @start_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /start_orders/1/edit
  def edit
  end

  # POST /start_orders
  # POST /start_orders.json
  def create
    @start_order = StartOrder.new(start_order_params)
    respond_to do |format|
      if @start_order.save
        format.html { redirect_to @start_order, notice: 'Start order was successfully created.' }
        format.json { render :show, status: :created, location: @start_order }
      else
        format.html { render :new }
        format.json { render json: @start_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /start_orders/1
  # PATCH/PUT /start_orders/1.json
  def update
    respond_to do |format|
      if @start_order.update(start_order_params)
        format.html { redirect_to action: "index", notice: 'Start order was successfully updated.' }
        format.json { render :index, status: :ok, location: @start_order }
      else
        format.html { render :edit }
        format.json { render json: @start_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /start_orders/1
  # DELETE /start_orders/1.json
  def destroy
    @start_order.destroy
    respond_to do |format|
      format.html { redirect_to start_orders_url, notice: 'Start order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_start_order
      @start_order = StartOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def start_order_params
      params.fetch(:start_order, {})
    end
end
