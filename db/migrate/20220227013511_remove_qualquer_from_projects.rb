class RemoveQualquerFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :qualuqer, :string
  end
end
