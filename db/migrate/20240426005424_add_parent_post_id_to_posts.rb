class AddParentPostIdToPosts < ActiveRecord::Migration[7.1]
  def change
    change_table :posts do |t|
      t.references :parent_post, foreign_key: { to_table: :posts }
    end
  end
end
