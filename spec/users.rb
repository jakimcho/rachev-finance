require 'rails_helper'

describe User do
  before :each do
    @user = User.new "Yakim", "123321"
  end

  describe "#new" do
    it "takes parameters and reurns a User object" do
      expect(@user).to be_instance_of User
    end
  end

  describe "#name" do
    it "returns the correct user name" do
      expect(@user.name).to eql("Yakim")
    end
  end

  describe "#password" do
    it "returns the correct password" do
      expect(@user.password).to eql("123321")
    end
  end
end