class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :user_id
      t.integer :party_id
      t.integer :race_id
      t.integer :job_id

      t.timestamps
    end
  end
end
