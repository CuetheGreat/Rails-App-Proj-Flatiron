class CreateAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities do |t|
      t.string :name
      t.integer :value
      t.integer :character_id
      t.integer :modifier

      t.timestamps
    end
  end
end
