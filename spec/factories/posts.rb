FactoryBot.define do
  factory :post do |p|
    p.date      { Date.today}
    p.rationale {'Some Comment'}
    p.user
  end

    factory :second_post, class: 'post' do |p|
    p.date      { Date.today}
    p.rationale {'Another rationale'}
    p.user
  end
end