module CheckingAccount
  class Record < ApplicationRecord
    self.table_name = 'checking_accounts'
    belongs_to :user
  end
end
