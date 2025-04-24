FactoryBot.define do
  factory :image do
    name { "Test Image" }
    picture { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test.jpg'), 'image/jpeg') }
    association :user
  end
end
