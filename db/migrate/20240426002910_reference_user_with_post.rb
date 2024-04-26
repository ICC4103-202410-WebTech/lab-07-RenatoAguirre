class ReferenceUserWithPost < ActiveRecord::Migration[7.1]
  def change
    change_table :posts do |t|
      t.references :user, foreign_key: true
    end
  end
end
