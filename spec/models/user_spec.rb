require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name: "homer", last_name: "simpson", email: "homer@simpson.com", password: "aaa", password_confirmation: "aaa")
    end
  
    it "is valid with all fields" do
      expect(@user).to be_valid
    end

    it "requires first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "requires last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid with wrong password" do
      @user.password_confirmation = "bbb"
      expect(@user).to_not be_valid
    end

    it "is not valid with no email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is at least 3 letter password" do
      @user.password = "a"
      expect(@user).to_not be_valid
    end

    it "is case sensitive password" do
      @user.password = "aAA"
      expect(@user).to_not be_valid
    end

    it "only allows 1 email address to register" do
      @user.save
      @user1 = User.new(first_name: "marge", last_name: "simpson", email: "homer@simpson.com", password: "aaa", password_confirmation: "aaa")
      @user1.save
      expect(@user1.errors.messages[:email][0]).to eq("has already been taken")
    end

    it "case sensitive email" do
      @user.save
      @user1 = User.new(first_name: "marge", last_name: "simpson", email: "HOMER@simpson.com", password: "aaa", password_confirmation: "aaa")
      @user1.save
      expect(@user1.errors.messages[:email][0]).to eq("has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(id: 1, first_name: "homer", last_name: "simpson", email: "homer@simpson.com", password: "aaa", password_confirmation: "aaa")
    end

    it "is valid with correct login info" do
      @email = "homer@simpson.com"
      @password = "aaa"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@user[:email]).to eq(@logged_user[:email])
    end

    it "is valid with non case sensitive email" do
      @email = "HOMER@simpson.com"
      @password = "aaa"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@user[:email]).to eq(@logged_user[:email])
    end

    it "is valid spaces in email field" do
      @email = "    homer@simpson.com   "
      @password = "aaa"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@user[:email]).to eq(@logged_user[:email])
    end

    it "is not valid with incorrect password" do
      @email = "homer@simpson.com"
      @password = "bbbb"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@logged_user).to eq(nil)
    end

    it "is not valid with incorrect email" do
      @email = "marge@simpson.com"
      @password = "aaa"
      @logged_user = User.authenticate_with_credentials(@email, @password)
      expect(@logged_user).to eq(nil)
    end

  end

end
