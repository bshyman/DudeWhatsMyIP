FactoryGirl.define do
  factory :user do
    email "MyString"
  end
  factory :interface do
    ip "MyString"
    hostname "MyString"
    port 1
    ddns "MyString"
    notes "MyString"
  end
end
