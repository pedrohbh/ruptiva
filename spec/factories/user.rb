FactoryGirl.define do
  factory :user do
    first_name 'Maikel'
    last_name 'Bald'
    email 'maikel@ruptiva.com'
    password 'ilikeruptiva'
    role :admin
  end
end