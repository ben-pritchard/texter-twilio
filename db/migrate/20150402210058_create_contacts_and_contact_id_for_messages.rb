class CreateContactsAndContactIdForMessages < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :number
    end

    add_column :messages, :contact_id, :integer
  end
end
