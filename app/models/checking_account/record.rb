module CheckingAccount
  class Record < ApplicationRecord
    belongs_to :user
  end
end
