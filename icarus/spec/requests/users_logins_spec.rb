require 'rails_helper'

RSpec.describe "GetSessions", type: :request do
  describe "GET /sessions/new" do
    it "works! (now write some real specs)" do
      get new_sessions_path
      expect(response).to have_http_status(200)
    end
  end
end
