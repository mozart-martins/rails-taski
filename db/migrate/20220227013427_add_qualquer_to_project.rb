class AddQualquerToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :qualquer, :string
  end
end
