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

  factory :admin_user, class: 'AdminUser' do |a|
    a.first_name            {'Jon'}
    a.last_name             {'Snow'}
    a.email                 {generate :email}
    a.password              {'asdfasdf'}
    a.password_confirmation {'asdfasdf'}
  end

    factory :other_user, class: 'User' do |a|
    a.first_name            {'Non'}
    a.last_name             {'Authorized'}
    a.email                 {generate :email}
    a.password              {'asdfasdf'}
    a.password_confirmation {'asdfasdf'}
  end

end