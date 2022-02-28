class CreateBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :benefits do |t|
      t.string :name
      t.integer :value
      t.integer :race_id

      t.timestamps
    end
  end
end
