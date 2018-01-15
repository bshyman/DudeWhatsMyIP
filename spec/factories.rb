FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    picture "MyString"
  end

  factory :interface do
    ip "MyString"
    hostname "MyString"
    port 1
    ddns "MyString"
    notes "MyString"
  end
end
