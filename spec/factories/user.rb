require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    name 'Owen'
    email 'owen@test.com'
    password '12345678'
    password_confirmation '12345678'
  end

 factory :user_2, parent: :user do
    name 'Harry'
    email 'harry@test.com'
    password '12345678'
    password_confirmation '12345678'
 end

 factory :user_3, parent: :user do
    name 'Fred'
    email 'fred@test.com'
    password '12345678'
    password_confirmation '12345678'
 end
end
