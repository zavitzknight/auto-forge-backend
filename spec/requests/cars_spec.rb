require 'rails_helper'

RSpec.describe "Cars", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
  )}

  describe "GET /index" do
    it 'gets a list of cars' do
      car = user.cars.create(
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:'$1000',
        description: 'Exciting new paint job'
      )
    get '/cars'

    car = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(car.first['make']).to eq('Toyota')
    end
  end

  
  describe "POST /create" do
    it "creates a car" do
      car_params = {
        car: {
          user_id: user.id,
          make: 'Toyota',
          model: 'Tundra',
          year: 2018,
          color: 'black',
          miles: 8000,
          image: 'test.image',
          cost: '$1000',
          description: 'Exciting new paint job'
        }
      }
      post '/cars', params: car_params

      expect(response).to have_http_status(200)

      car = Car.first

      expect(car.model).to eq 'Tundra'
    end
  end

  describe "PATCH /update" do
    it "updates a car's info" do
      car_params = {
        car: {
          user_id: user.id,
          make: 'Toyota',
          model: 'Tundra',
          year: 2018,
          color: 'black',
          miles: 8000,
          image: 'test.image',
          cost:'$1000',
          description: 'Exciting new paint job'
        }
      }
      post '/cars/', params: car_params
      car = Car.first

      updated_params = {
        car: {
          user_id: user.id,
          make: 'Ford',
          model: 'Tundra',
          year: 2018,
          color: 'black',
          miles: 8000,
          image: 'test.image',
          cost:'$1000',
          description: 'Exciting new paint job'
        }
      }
      patch "/cars/#{car.id}", params: updated_params

      updated_car = Car.find(car.id)
      expect(response).to have_http_status(200)
      expect(updated_car.make).to eq "Ford"

    end
  end

  describe "DELETE /destroy" do
    it "destroys a car" do
      car_params = {
        car: {
          user_id: user.id,
          make: 'Toyota',
          model: 'Tundra',
          year: 2018,
          color: 'black',
          miles: '8000',
          image: 'test.image',
          cost:'$1000',
          description: 'Exciting new paint job'
        }
      }
      post '/cars', params: car_params
      car = Car.first

      delete "/cars/#{car.id}"

      expect(response).to have_http_status(200)
      expect(Car.find_by(id: car.id)).to be_nil

    end
  end
end

