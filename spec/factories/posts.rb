FactoryBot.define do
  factory :post do |p|
    p.date      { Date.today}
    p.rationale {'Some rationale'}
    p.user
  end

    factory :second_post, class: 'post' do |p|
    p.date      { Date.today}
    p.rationale {'Another Comment'}
    p.user
  end
end