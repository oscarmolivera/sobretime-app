FactoryBot.define do
  factory :post do |p|
    p.date      { Date.today}
    p.work_performed {'Some Comment'}
    p.user
    p.daily_hours {0.5}
  end

    factory :second_post, class: 'post' do |p|
    p.date      { Date.today}
    p.work_performed {'Another Work'}
    p.user
    p.daily_hours {2.5}
  end
end