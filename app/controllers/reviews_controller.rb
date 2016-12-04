class ReviewsController < ApplicationController
	def new
	  @event = Event.find(params[:event_id])
	  @review = Review.new
	end

	def create
	  @event = Event.find(params[:event_id])
	  @event.reviews.create(event_params)
	  redirect_to events_path
	end

	def event_params
	  params.require(:review).permit(:thoughts, :rating)
	end
end
