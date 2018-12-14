# Grubhub & Pusher Demo app
This is a quick and dirty rails app which serves at the backedn for [this iOS App](https://github.com/zasmail/grubhub_ios) and also fakes orders which are sent to Pusher and Algolia.

## Jobs

### [DeliverOrderJob](https://github.com/zasmail/grubhub_backend/blob/master/app/jobs/deliver_order_job.rb)
This job is responsible for faking a delivery. The delivery always occurs in the same location and a driver is assigned to the order. The Driver moves toward the orderer for a set number of intervals while pushing each step to Pusher. The location is updated on the map on the iOS app.


### [PlaceOrdersJob](https://github.com/zasmail/grubhub_backend/blob/master/app/jobs/place_orders_job.rb)
This job is responsible for creating a random number of orders, each will contain a random number of dishes and have random names assigned to them. 

### [IndexOrdersJob](https://github.com/zasmail/grubhub_backend/blob/master/app/jobs/index_orders_job.rb)
When a new order is made, this job is responsible for indexing it to in Algolia

### [UpdateAlgoliaJob](https://github.com/zasmail/grubhub_backend/blob/master/app/jobs/update_algolia_job.rb)
This job runs ever 30 minutes and updates the attributes in Algolia to prevent drift
