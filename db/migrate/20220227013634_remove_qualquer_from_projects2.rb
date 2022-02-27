class RemoveQualquerFromProjects2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :qualquer, :string
  end
end
