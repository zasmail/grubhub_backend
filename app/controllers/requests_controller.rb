class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # user_id = req.body.user_id
  # status = "Searching"
  # rider = { name: "Jane Doe", number: "+18001234567", longitude: -122.088426, latitude: 37.388064 }
  #
  # // sendDriverPushNotification()
  #
  # pusher.trigger('cabs', 'status-update', { status, rider })
  # res.json({ status: true })

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    status = "Searching"
    rider = { name: "Jane Doe", number: "+18001234567", latitude: 37.388064, longitude: -122.088426, }
    driver = { name: "", number: "", longitude: 0, latitude: 0 }
    Pusher.trigger('cabs', 'status-update', {
      status: status,
      rider_latitude: rider[:latitude],
      rider_longitude: rider[:longitude],
      driver_latitude: driver[:latitude],
      driver_longitude: driver[:longitude],
      driver_name: driver[:name],
      rider: rider,
      driver: driver
    })
    DeliverOrderJob.perform_now({
      status: status,
      rider: rider,
      driver: driver
    })
    render json: {status: true}

    # respond_to do |format|
    #   if @request.save
    #     format.html { redirect_to @request, notice: 'Request was successfully created.' }
    #     format.json { render :show, status: :created, location: @request }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @request.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.fetch(:request, {})
    end
end
