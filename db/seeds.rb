# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.first
images = Dir["db/seeds/*.jpg"]

20.times do
  book = Book.new(
    user: user,
    title: Faker::Book.title,
    description: Faker::ChuckNorris.fact
  )
  image = images.sample             
  book.cover.attach(io: File.open(image), filename: image, content_type: "image/jpg")
  images.sample(2).each do |image|
    book.related_images.attach(io: File.open(image), filename: image, content_type: "image/jpg")
  end
  book.save && puts("Created #{book.id} - #{book.title}")
end

Book.all.each do |book|
 tags = []
 tag_num = rand(1..3)
 tag_num.times { tags.push(Faker::Book.genre) }
 puts tags.inspect 
 book.genre_list = tags.uniq.join(" , ")
 book.save
end