# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  password   :string(255)      not null
#  family_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#

require 'rails_helper'

describe User do
  before :each do
           @consts = {
                       user1_name: "Yakim",
                       user2_name: "Pesho",
                       user1_pass: "123321",
                       user2_pass: "123321",
                      user1_email: "gosho@muhaha.com" + rand(100...1000).to_s,
                      user2_email: "ivan@muhaha.com" + rand(100...1000).to_s
                     }

      @family_attr = {
                        name: "Rachevi", 
                        pass: "123321"
                      }

           @family = Family.create(@family_attr)

        @user1_attr = { 
                            name: @consts[:user1_name],
                           email: @consts[:user1_email],
                        password: @consts[:user1_pass],
                       family_id: @family.id 
                      }
             @user = User.create(@user1_attr)

       @user2_attr = { 
                            name: @consts[:user2_name],
                           email: @consts[:user2_email],
                        password: @consts[:user2_pass],
                       family_id: @family.id 
                     }      
  end
 
  it "should create a new instance given valid attributes" do
    User.create(@user2_attr)
  end

  it "should require name" do
    no_name_user = User.new(@user2_attr.merge(name: ""))
    
    expect(no_name_user).to_not be_valid
  end

  it "should require password" do
    no_password_user = User.new(@user2_attr.merge(password: ""))
    
    expect(no_password_user).to_not be_valid
  end

  it "should require email" do
    no_email_user = User.new(@user2_attr.merge(email: ""))
    
    expect(no_email_user).to_not be_valid
  end

  it "should reject email duplication" do
    User.create!(@user2_attr)
    existed_email_user = User.new(@user2_attr.merge(name: "Pesho123"))

    expect(existed_email_user).to_not be_valid
  end

  it "should reject email duplication case insensitive" do
    User.create!(@user2_attr)
    up_case_email = @user2_attr[:email].upcase

    existed_email_user = User.new(@user2_attr.merge(email: up_case_email))

    expect(existed_email_user).to_not be_valid
  end

  it "should require family_id" do
    no_family_user = User.new(@user2_attr.merge(family_id: ""))
    
    expect(no_family_user).to_not be_valid
  end

  it "should has correct parameters" do
    expect(@user.name).to eql(@consts[:user1_name]);
    expect(@user.email).to eql(@consts[:user1_email]);
    expect(@user.password).to eql(@consts[:user1_pass]);
    expect(@user.family_id).to eql(@family.id);
  end
end
