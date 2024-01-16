user1 = User.where(email: 'test1@example.com').first_or_create(password:'password', password_confirmation:'password')
user2 = User.where(email: 'test2@example.com').first_or_create(password:'password', password_confirmation:'password')




user1_cars = [
    {
        make: 'Cadillac',
        model: 'Escalade',
        year: 2019,
        color: 'Black',
        miles: '8000',
        image: 'https://i.postimg.cc/66ZtkQr7/escalade.jpg',
        cost:'$19,899',
        description: 'Installed six 12 inch B2 subwoofers in a custom enclosure. Added 3 way components to the front two door panels and fabricated custom speaker pods.'
    },
    {

        make: 'Lamborghini',
        model: 'Huracan',
        year: 2020,
        color: 'Black',
        miles: '26,420',
        image: 'https://i.postimg.cc/L8YTTrKM/custom-twin-turbo-lamborghini-huracan-lp610-horsepower-machined-adv1-wheels-b-1799x1200.jpg',
        cost:'$69,420',
        description: 'Installed twin turbos and did a bumper delete. Car is making over 9,000 horsepower now. Install was very easy, only took me about 30 seconds to get it all installed and tuned 10 out of 10 recommend.'
    }
]
user2_cars = [
    {

        make: 'Nissan',
        model: '370z',
        year: 2016,
        color: 'silver',
        miles: '1000',
        image: 'https://i.postimg.cc/TwY5kDLW/20180915-164724-IMG-0070-Original.jpg',
        cost:'$4,500',
        description: 'Installed Volk TE37 wheels and Hankook Ventus V3 tires. Adjusted coilevers after install to perfect fitment.'
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
