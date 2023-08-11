class CreateBankAgencies < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_agencies do |t|
      t.string :name

      t.timestamps
    end
  end
end
