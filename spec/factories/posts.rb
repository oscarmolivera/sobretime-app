FactoryBot.define do
  factory :post do |p|
    p.date      { Date.today}
    p.rationale {'Some Comment'}
    p.user
    p.daily_hours {0.5}
  end

    factory :second_post, class: 'post' do |p|
    p.date      { Date.today}
    p.rationale {'Another rationale'}
    p.user
    p.daily_hours {2.5}
  end
end