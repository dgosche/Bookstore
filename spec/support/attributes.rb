def event_attributes(overrides = {})
  random_number = (0..9).to_a.shuffle[0..10].join
  {
    name: "BugSmash #{random_number}", 
    location: "Denver",     
    price: 10.00,
    description: 'A fun evening of bug smashing!',
    starts_at: 10.days.from_now,
    image_file_name: 'bugsmash.png',
    capacity: 75
  }.merge(overrides)
end

def registration_attributes(overrides = {})
  {
    name: "Joe Developer", 
    email: "joe@gmail.com",
    how_heard: "Twitter"     
  }.merge(overrides)
end

def book_attributes(overrides = {})
  {
    title: "Book Title",
    author: "Book Author",
    description: "Book Description",
    released_on: "2000-01-01",
    price: 10.00,
    book_image_name: "booktitle.jpg"
  }

def review_attributes(overrides = {})
  {
    name: "John",
    comment: "The book was great",
    stars: 5
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end
