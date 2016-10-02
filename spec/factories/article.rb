FactoryGirl.define do
  factory :article do
    user  User.first
    title FFaker::HealthcareIpsum.words.map(&:capitalize).join(' ')
    featured true
    spotlighted false
    content FFaker::HealthcareIpsum.paragraph
    feature_image FFaker::Avatar.image
  end
end
