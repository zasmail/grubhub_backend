class IndexOrdersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    dish = args.first[:dish]
    index = Algolia::Index.new('grubhub')
    index.partial_update_objects([{
      objectID: dish[:objectID],
      last_ordered: Time.now.to_i,
      ordered_in_last_hour: true,
      ordered_in_last_day: true,
    }])
  end
end
