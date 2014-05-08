FactoryGirl.define do

  factory :book do
    title "Factory Title"
    about "Factory About"
  end

  factory :entry do
    book
    title "Factory Title"
    contents "Factory Contents"
  end

  factory :category do
    name 'Factory Name'
  end

  factory :entry_category do
    entry
    category
  end

end
