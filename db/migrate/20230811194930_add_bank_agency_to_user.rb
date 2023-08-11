class AddBankAgencyToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :bank_agency, null: false, foreign_key: true
  end
end
