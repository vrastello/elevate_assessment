
class Api::GameEventsController < ApplicationController
  def create
    @game_event = @current_user.game_events.new(game_event_params)
    if @game_event.save
      head :created
    else
      render json: { error: @game_event.errors }, status: :unprocessable_entity
    end
  end

  private

  def game_event_params
    puts params.inspect
    # we cannot/don't want to use 'type' as db field due to ruby using type already for its own purposes
    params.require(:game_event).permit(:game_name, :type, :occured_at).tap do |whitelisted|
      whitelisted[:event_type] = whitelisted.delete(:type) if whitelisted[:type]
    end
  end
end
