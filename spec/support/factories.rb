FactoryGirl.define do

  factory :admin do
    sequence( :email ){ |n| "example_#{n}@example.com" }
    password 'my_password'
  end

  factory :book do
    title "Factory Title"
    about "Factory About"
  end

  factory :entry do
    book
    title "Factory Title"
    contents "Factory Contents"
    year 2000
    month 1
    day 1
  end

  factory :category do
    sequence( :name ){ |n| "Category ##{n}" }
  end

  factory :entry_category do
    entry
    category
  end

end
