class PostTypeCdToBulletins < ActiveRecord::Migration[6.1]
  def change
    add_column :bulletins, :post_type_cd, :integer, default: 0
  end
end
