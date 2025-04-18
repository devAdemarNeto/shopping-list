require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/items/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/items/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/items/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /toggle" do
    it "returns http success" do
      get "/items/toggle"
      expect(response).to have_http_status(:success)
    end
  end

end
