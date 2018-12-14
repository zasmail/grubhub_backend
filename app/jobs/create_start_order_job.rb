class CreateStartOrderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    start_order = StartOrder.new
    if start_order.save
      PlaceOrdersJob.perform_later
    else
      return false
    end
  end
end
