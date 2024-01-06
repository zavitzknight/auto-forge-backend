require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
}

  it 'gets validate car' do 
    car = user.cars.create(
      model: 'Tundra',
      year: 2018,
      color: 'black',
      miles: 8000,
      image: 'test.image',
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:make]).to include("can't be blank")
  end

  it 'gets validate car' do 
    car = user.cars.create(
      make: 'Toyota',
      year: 2018,
      color: 'black',
      miles: 8000,
      image: 'test.image',
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:model]).to include("can't be blank")
  end

  it 'gets validate car' do 
    car = user.cars.create(
      make: 'Toyota',
      model: 'Tundra',     
      color: 'black',
      miles: 8000,
      image: 'test.image',
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:year]).to include("can't be blank")
  end
  
  it 'gets validate car' do 
    car = user.cars.create(
      make: 'Toyota',
      model: 'Tundra',
      year: 2018,
      miles: 8000,
      image: 'test.image',
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:color]).to include("can't be blank")
  end
  it 'gets validate car' do 
    car = user.cars.create(
      make: 'Toyota',
      model: 'Tundra',
      year: 2018,
      color: 'black',
      image: 'test.image',
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:miles]).to include("can't be blank")
  end

  it 'gets validate car' do 
    car = user.cars.create(
      make: 'Toyota',
      model: 'Tundra',
      year: 2018,
      color: 'black',
      miles: 8000,
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:image]).to include("can't be blank")
  end

  it 'gets validate car' do 
    car = user.cars.create(
      make: 'Toyota',
      model: 'Tundra',
      year: 2018,
      color: 'black',
      miles: 8000,
      image: 'test.image',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:cost]).to include("can't be blank")
  end

  it 'gets validate car' do 
    car = user.cars.create(
      make: 'Toyota',
      model: 'Tundra',
      year: 2018,
      color: 'black',
      miles: 8000,
      image: 'test.image',
      cost:'$1000',
    )
    expect(car.errors[:description]).to include("can't be blank")
  end







  it 'make should be atleast 2 characters long' do  
    car = user.cars.create(
      make: 'H',
      model: 'Tundra',
      year: 2018,
      color: 'black',
      miles: 8000,
      image: 'test.image',
      cost:'$1000',
      description: 'Exciting new paint job'
    )
    expect(car.errors[:make]).to include("is too short (minimum is 2 characters)")
  end
end