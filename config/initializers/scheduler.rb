require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


# Stupid recurrent task...
#

s.every '90s' do
  CreateStartOrderJob.perform_later
  Rails.logger.info "Place order job"
  Rails.logger.flush
end

s.every '30m' do
  UpdateAlgoliaJob.perform_later
  Rails.logger.info "Updated Algolia"
end
