FactoryBot.define do 
  factory :audit_log do |al|
    al.user
    al.status { 0 }
    al.start_date { Date.today - 6.days}
    al.end_date { nil }
  end
end
