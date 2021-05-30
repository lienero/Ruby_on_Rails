class AddPostTypeToBulletins < ActiveRecord::Migration[6.1]
  # 게시판을 새로 추가할 때, 레이아웃를 지정하기 위해서 post_type이라는 속성을 추가
  def change
    add_column :bulletins, :post_type, :string
  end
end
