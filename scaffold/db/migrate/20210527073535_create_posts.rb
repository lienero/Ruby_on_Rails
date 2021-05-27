class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :title

      t.timestamps null: false
      #Ex:- :null => false
    end
  end
end
