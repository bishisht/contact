class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :fullName
      t.string :mobile
      t.url :photo_url

      t.timestamps null: false
    end
  end
end
