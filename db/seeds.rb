cars = [
    {
        user_id:1 ,
        make: 'Toyota',
        model: 'Tundra',
        year: 2018,
        color: 'black',
        miles: '8000',
        image: 'test.image',
        cost:'$1000'
    },
    {
        user_id:2 ,
        make: 'Ford',
        model: 'F-150',
        year: 2018,
        color: 'white',
        miles: '12000',
        image: 'test.image',
        cost:'$4000'
    },
    {
        user_id:3 ,
        make: 'Ram',
        model: '1500',
        year: 2023,
        color: 'silver',
        miles: '1000',
        image: 'test.image',
        cost:'$500'
    }
]

cars.each do |each_car|
    Car.create each_car
    puts "creating car #{each_car}"
end