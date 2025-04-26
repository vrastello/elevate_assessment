
class GameEventsController < ApplicationController
  def create

    @game_event = @current_user.game_events.new(game_event_params)
    if @game_event.save
      render json: @game_event, status: :created
    else
      render json: { error: @game_event.errors }, status: :unprocessable_entity
    end
  end

  private

  def game_event_params
    event_params = params.require(:game_event).permit(:game_name, :type, :occured_at)
    event_params["event_type"] = event_params.delete("type") if event_params["type"]
  end
end