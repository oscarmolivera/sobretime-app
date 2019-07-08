FactoryBot.define do
  sequence :email do |n|
    "test#{n}@mytest.com"
  end
  factory :user do |f|
    f.first_name            {'Jon'}
    f.last_name             {'Snow'}
    f.email                 {generate :email}
    f.password              {'asdfasdf'}
    f.password_confirmation {'asdfasdf'}
  end

  factory :admin, class: 'user' do |a|
    a.first_name            {'Jon'}
    a.last_name             {'Snow'}
    a.email                 {generate :email}
    a.password              {'asdfasdf'}
    a.password_confirmation {'asdfasdf'}
  end
end