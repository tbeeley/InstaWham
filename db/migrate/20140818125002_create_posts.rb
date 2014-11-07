class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :string
      t.string :text
      t.string :text

      t.timestamps
    end
  end
end
