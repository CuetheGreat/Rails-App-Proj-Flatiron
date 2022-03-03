class AddAliveColumnToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :alive, :boolean, default: true
  end
end
