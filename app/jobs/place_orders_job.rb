class PlaceOrdersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # place_random_num_of_orders

    if StartOrder.last[:running]
      # if StartOrder.last[:updated_at] < (Time.now-3600)
      if StartOrder.last[:updated_at] < (Time.now-60)
        StartOrder.last[:running] = false
      else
        PlaceOrdersJob.set(wait: rand(3..10).seconds).perform_later

        # .perform_later(rand(5..20))
        place_random_num_of_orders
      end
    end
  end

  private
  def place_random_num_of_orders
    [*0..rand(5)].each do |index|
      dish = Dish.find(rand(Dish.count)-1)
      Pusher.trigger('order-channel', 'order-placed', {
        message: dish.to_json,
        time: Time.now,
        user: Faker::Name.name
      })
    end
  end

end
