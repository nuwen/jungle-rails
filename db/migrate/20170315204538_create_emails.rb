class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
