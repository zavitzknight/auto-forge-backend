require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
}

  it 'gets validate car' do 
    car = user.car.create(
      model: 'Tundra',
      year: 2018,
      color: 'black',
      miles: '8000',
      image: 'test.image',
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:make]).to include("can't be blank ")
  end
end
