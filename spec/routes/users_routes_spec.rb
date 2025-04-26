require "rails_helper"

RSpec.describe "UsersController", type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "api/user").to route_to(controller: "api/users", action: "show")
    end

    it "routes to #create" do
      expect(post: "api/user").to route_to(controller: "api/users", action: "create")
    end

    it "routes to #create_game_event" do
      expect(post: "api/user/game_events").to route_to(controller: "api/game_events", action: "create")
    end

    it "routes to sessions#login" do
      expect(post: "api/sessions").to route_to(controller: "api/sessions", action: "login")
    end
  end
end
