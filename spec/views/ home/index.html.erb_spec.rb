require 'rails_helper'
require 'pp'

RSpec.describe "home/index.html.erb", type: :view do
  require File.expand_path('../../../../app/helpers/sessions_helper', __FILE__)
  include SessionsHelper
  context "when no session exists" do
    
    it "has wellcome message" do
      render
      expect(rendered).to have_selector 'h1',
                                        text: "Home#index"
    end
    
    it "has no link to user" do
      render
      expect(rendered).to_not have_link "User"
    end

  end
  
  context "when session exists" do
    it "has wellcome message" do
      render
      expect(rendered).to have_selector 'h1',
                                        text: "Home#index"
    end
    
    it "has link to user" do
=begin
      current_user = User.new()
      
      assign :id, current_user.id
      log_in current_user
      render
      pp rendered
      expect(rendered).to have_link "User"
=end
      pending "complete this test #{__FILE__}"
      
    end
  end
end
