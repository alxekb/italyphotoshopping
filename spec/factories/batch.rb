FactoryBot.define do
  factory :batch do
    cost { 230 }
    batch_status
  end

  factory :batch_status do
    status { 'Collect' }
  end
end
