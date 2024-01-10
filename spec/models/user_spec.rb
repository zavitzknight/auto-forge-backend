require 'rails_helper'

RSpec.describe User, type: :model do
  
#   it "should validate email" do 
#     user = User.create(
#       email: '',
#       password: 'Learn1!',
#       password_confirmation: 'Learn1!'
#     )
#     expect(user.errors[:email]).to_not be_empty
#   end


#   it "should validate password" do 
#     user = User.create(
#       email: 'test@example.com',
#       password: '',
#       password_confirmation: 'Learn1!'
#     )
#     expect(user.errors[:password]).to_not be_empty
#   end


#   it "should validate email" do 
#     user = User.create(
#       email: 'test@example.com',
#       password: 'Learn1!',
#       password_confirmation: ''
#     )
#     expect(user.errors[:password_confirmation]).to_not be_empty
#   end

#   it 'password should be atleast 6 characters long' do 
#     user = User.create(
#       email: 'test@example.com',
#       password: 'L',
#       password_confirmation: 'Learn1!'
#     )
#     expect(user.errors[:password]).to_not be_empty
#   end
  
#   it 'password_confirmation should be atleast 6 characters long' do 
#     user = User.create(
#       email: 'test@example.com',
#       password: 'Learn1!',
#       password_confirmation: 'L'
#     )
#     expect(user.errors[:password_confirmation]).to_not be_empty
#   end



# it 'does not allow duplicate emails' do
# User.create(
#   email: 'test@example.com',
#   password: 'Learn1!',
#   password_confirmation: 'Learn1!'
  
# )
# aragon = User.create(
#   email: 'test@example.com',
#   password: 'Learn1!',
#   password_confirmation: 'Learn1!'
# )
# expect(aragon.errors[:email]).to_not be_empty
# end

# it 'requires a matching password confirmation' do
#   user = User.new(password: 'password123', password_confirmation: 'differentpassword')
#   expect(user).to_not be_valid
#   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
# end
end
