class UpdateAlgoliaJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    index = Algolia::Index.new('grubhub')
    hits = []
    index.browse({
      query: '' }) do |hit|
      # numericFilters: ["last_ordered<#{(Time.now-(24*60*60)).to_i}"] }) do |hit|
        hits << hit
    end
    updated_hits = []
    hits.each do |hit|
      if !hit["last_ordered"].blank?
        hit['ordered_in_last_day'] = hit['last_ordered'] > (Time.now-(24*60*60)).to_i
        hit['ordered_in_last_hour'] = hit['last_ordered'] > (Time.now-(60*60)).to_i
        if hit['ordered_in_last_hour']
          hit['fire'] = "🔥🔥"
        elsif hit['ordered_in_last_day']
          hit['fire'] = "🔥"
        else
          hit['fire'] = ""
        end

        updated_hits << hit
      end
    end
    index.add_objects(updated_hits)
  end
end
