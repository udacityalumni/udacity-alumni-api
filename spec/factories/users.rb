FactoryGirl.define do
  factory :user do |u|
    name {"test"}
    email {|u| "#{u.name}_#{rand(1000).to_s}@test.com" }
    password {'Password'}
  end
end
