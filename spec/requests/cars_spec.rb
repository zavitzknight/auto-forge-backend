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
    expect(car.first['year']).to eq(2018)
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
          model: 'F-150',
          year: 2022,
          color: 'white',
          miles: 8000,
          image: 'test.image',
          cost:'$4000',
          description: 'new muffler'
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
          miles: 8000,
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




# Create/

describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a make" do
    car_params = {
      car: {
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:"$1000",
        description: 'Exciting new paint job'
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['make']).to include "can't be blank"
  end
end

describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a model" do
    car_params = {
      car: {
        make: 'Toyota',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:"$1000",
        description: 'Exciting new paint job'
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['model']).to include "can't be blank"
  end
end

describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a year" do
    car_params = {
      car: {
        make: 'Toyota',
        model: 'Tundra',
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:"$1000",
        description: 'Exciting new paint job'
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['year']).to include "can't be blank"
  end
end

describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a color" do
    car_params = {
      car: {
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        miles: 8000,
        image: 'test.image',
        cost:"$1000",
        description: 'Exciting new paint job'
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['color']).to include "can't be blank"
  end
end

describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a miles" do
    car_params = {
      car: {
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        image: 'test.image',
        cost:"$1000",
        description: 'Exciting new paint job'
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['miles']).to include "can't be blank"
  end
end
describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a image" do
    car_params = {
      car: {
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        cost:"$1000",
        description: 'Exciting new paint job'
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['image']).to include "can't be blank"
  end
end

describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a cost" do
    car_params = {
      car: {
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        description: 'Exciting new paint job'
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['cost']).to include "can't be blank"
  end
end
describe "cannot create a car without valid attributes" do
  it "doesn't create a car without a description" do
    car_params = {
      car: {
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:"$1000"
      }
    }
    post '/cars', params: car_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['description']).to include "can't be blank"
  end
end


# Update

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without a make" do
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
        make: '',
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
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['make']).to include "can't be blank"
  end
end

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without a model" do
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
        make: 'Toyota',
        model: '',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:'$1000',
        description: 'Exciting new paint job'
      }
    }
    patch "/cars/#{car.id}", params: updated_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['model']).to include "can't be blank"
  end
end

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without a year" do
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
        make: 'Toyota',
        model: 'Tundra',
        year: '',
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:'$1000',
        description: 'Exciting new paint job'
      }
    }
    patch "/cars/#{car.id}", params: updated_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['year']).to include "can't be blank"
  end
end

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without a color" do
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
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: '',
        miles: 8000,
        image: 'test.image',
        cost:'$1000',
        description: 'Exciting new paint job'
      }
    }
    patch "/cars/#{car.id}", params: updated_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['color']).to include "can't be blank"
  end
end

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without miles" do
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
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: '',
        image: 'test.image',
        cost:'$1000',
        description: 'Exciting new paint job'
      }
    }
    patch "/cars/#{car.id}", params: updated_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['miles']).to include "can't be blank"
  end
end

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without a image" do
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
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: '',
        cost:'$1000',
        description: 'Exciting new paint job'
      }
    }
    patch "/cars/#{car.id}", params: updated_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['image']).to include "can't be blank"
  end
end

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without a cost" do
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
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:'',
        description: 'Exciting new paint job'
      }
    }
    patch "/cars/#{car.id}", params: updated_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['cost']).to include "can't be blank"
  end
end

describe "cannot update a car without valid attributes" do
  it "doesn't update a car without a description" do
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
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: 8000,
        image: 'test.image',
        cost:'$1000',
        description: ''
      }
    }
    patch "/cars/#{car.id}", params: updated_params
    expect(response.status).to eq 422
    car = JSON.parse(response.body)
    expect(car['description']).to include "can't be blank"
  end
end
end


