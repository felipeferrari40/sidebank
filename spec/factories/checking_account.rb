# frozen_string_literal: true

FactoryBot.define do
  factory :checking_account, class: 'CheckingAccount::Record' do
    association :user
    amount { 200 }
  end
end
