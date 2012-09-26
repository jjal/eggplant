require "spec_helper"

describe PayRatesController do
  describe "routing" do

    it "routes to #index" do
      get("/pay_rates").should route_to("pay_rates#index")
    end

    it "routes to #new" do
      get("/pay_rates/new").should route_to("pay_rates#new")
    end

    it "routes to #show" do
      get("/pay_rates/1").should route_to("pay_rates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pay_rates/1/edit").should route_to("pay_rates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pay_rates").should route_to("pay_rates#create")
    end

    it "routes to #update" do
      put("/pay_rates/1").should route_to("pay_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pay_rates/1").should route_to("pay_rates#destroy", :id => "1")
    end

  end
end
