user1 = User.where(email: 'test1@example.com').first_or_create(password:'password', password_confirmation:'password')
user2 = User.where(email: 'test2@example.com').first_or_create(password:'password', password_confirmation:'password')




user1_cars = [
    {
        user_id:1 ,
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: '8000',
        image: 'test.image',
        cost:'$1000',
        description: 'Exciting new paint job'
    },
    {
        user_id:2 ,
        make: 'Ford',
        model: 'F-150',
        year: 2018,
        color: 'white',
        miles: '12000',
        image: 'test.image',
        cost:'$4000',
        description: 'Added a winch'
    }
]
user2_cars = [
    {
        user_id:2 ,
        make: 'Ram',
        model: '1500',
        year: 2023,
        color: 'silver',
        miles: '1000',
        image: 'test.image',
        cost:'$500',
        description: 'Stealth mode modification'
    }
]

user1_cars.each do |car|
    user1.cars.create car
    puts "creating car #{car}"
end

user2_cars.each do |car|
    user2.cars.create car
    puts "creating car #{car}"
end
