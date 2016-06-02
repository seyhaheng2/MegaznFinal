class AddViewerToPost < ActiveRecord::Migration
  def change
    add_column :posts, :viewer, :integer, default: 0
  end
end
