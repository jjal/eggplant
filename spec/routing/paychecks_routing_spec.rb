require "spec_helper"

describe PaychecksController do
  describe "routing" do

    it "routes to #index" do
      get("/paychecks").should route_to("paychecks#index")
    end

    it "routes to #new" do
      get("/paychecks/new").should route_to("paychecks#new")
    end

    it "routes to #show" do
      get("/paychecks/1").should route_to("paychecks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/paychecks/1/edit").should route_to("paychecks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/paychecks").should route_to("paychecks#create")
    end

    it "routes to #update" do
      put("/paychecks/1").should route_to("paychecks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/paychecks/1").should route_to("paychecks#destroy", :id => "1")
    end

  end
end
