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
    f.phone                 {'551234567'}
  end

  factory :admin_user, class: 'AdminUser' do |a|
    a.first_name            {'Jon'}
    a.last_name             {'Snow'}
    a.email                 {generate :email}
    a.password              {'asdfasdf'}
    a.password_confirmation {'asdfasdf'}
    a.phone                 {'551234578'}
  end

    factory :other_user, class: 'User' do |o|
    o.first_name            {'Non'}
    o.last_name             {'Authorized'}
    o.email                 {generate :email}
    o.password              {'asdfasdf'}
    o.password_confirmation {'asdfasdf'}
    o.phone                 {'582316094'}
  end

end