FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be pretty long. At least 20 characters!"
    user
    topic { Topic.create(name: 'Topic Name') }
  end
end