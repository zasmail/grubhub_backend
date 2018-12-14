class DeliverOrderJob < ApplicationJob
  queue_as :default
  SLEEP_TIME = 0.1
  TOTAL_INTERVALS = 100

  def perform(*args)
    # Do something later
    @rider = args.first[:rider]
    @latitude_interval_size = (37.395119 - @rider[:latitude])/TOTAL_INTERVALS
    @longitude_interval_size = (-122.083479 - @rider[:longitude])/TOTAL_INTERVALS
    # @longitude_interval_size = 1
    @driver = create_driver

    trigger_event("FoundRide")

    [*0..TOTAL_INTERVALS].each do |interval|
      puts "r: #{@rider[:latitude]}, #{@rider[:longitude]}"
      puts "d: #{@driver[:latitude]}, #{@driver[:longitude]}"
      move_driver
      # puts @driver
      sleep SLEEP_TIME
      trigger_event("FoundRide")

    end
    trigger_event("EndedTrip")


  end

  private

  def trigger_event(status)
    Pusher.trigger('cabs', 'status-update', {
      status: status,
      rider_latitude: @rider[:latitude],
      rider_longitude: @rider[:longitude],
      driver_latitude: @driver[:latitude],
      driver_longitude: @driver[:longitude],
      driver_name: @driver[:name],
      rider: @rider,
      driver: @driver
    })
  end

  def create_driver
    return{
      latitude: @rider[:latitude] + (@latitude_interval_size*TOTAL_INTERVALS),
      longitude: @rider[:longitude] + (@longitude_interval_size*TOTAL_INTERVALS),
      name: Faker::Name.name
    }
    # return{
    #   latitude: 37.395119,
    #   longitude: -122.083479,
    #   name: Faker::Name.name
    # }
  end

  def move_driver
    @driver[:latitude] = @driver[:latitude] - @latitude_interval_size
    @driver[:longitude] = @driver[:longitude] - @longitude_interval_size
  end
end
