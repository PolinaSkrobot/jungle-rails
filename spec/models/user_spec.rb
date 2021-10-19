require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user=User.create(first_name: "Polina",last_name: "Ololo", email: "test1@gmail.com", password: "12345", password_confirmation: "12345")
  end
  describe 'Validations' do
    it "saves when all fields are valid" do     
      expect(@user).to be_valid
    end
    
    context 'Password checking' do
      it 'should have password' do
        @user.password=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'should have password_confirmation' do
        @user.password_confirmation=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'the password and password_confirmation should match' do
        @user.password_confirmation='123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "the password's length should be more than 5" do
        @user.password='1234'
        @user.password_confirmation='1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
      end
    end
    context "Email checking" do 

      it 'should have email' do
        @user.email=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'should have unique emails, not case sensitive' do
        @user.save
        @user2 = User.create(first_name: "Polina",last_name: "Ololo", email: "test1@gmail.COM", password: "12345", password_confirmation: "12345")
        @user2.save        
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end

    end

    context "Names checking" do
      it 'should have first name' do
        @user.first_name=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'should have last name' do
        @user.last_name=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end 

  end

  describe '.authenticate_with_credentials' do
    it 'returns nil if authentification was not successful' do
      @auth_user = User.authenticate_with_credentials("test1@gmail.com", "12344")
      expect(@auth_user).to be nil
    end

    it 'returns instance of the user if authentification was successful' do
      @auth_user = User.authenticate_with_credentials("test1@gmail.com", "12345")
      expect(@auth_user).to eq(@user)
    end
    it 'returns instance of the user if authentification was with wrong case' do
      @auth_user = User.authenticate_with_credentials("tEst1@gMail.COm", "12345")
      expect(@auth_user).to eq(@user)
    end
    it 'returns instance of the user if authentification was with spaces at the beginning and the end' do
      @auth_user = User.authenticate_with_credentials(" test1@gmail.com ", "12345")
      expect(@auth_user).to eq(@user)
    end
  end
end
