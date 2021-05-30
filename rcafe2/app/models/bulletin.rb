class Bulletin < ApplicationRecord
    # has_many 다음에는 항상 복수형(posts)을 지정
    # has_many의 경우 dependent 옵션을 지정할 수 있는데, :destroy로 지정할 경우, 특정 bulletin 레코드를 삭제할 때 이 게시판에 속하는 모든 posts도 동시에 삭제된다.
    has_many :posts, dependent: :destroy
    # SimpleEnum 활용, 열거형으로 선언
    as_enum :post_type, bulletin: 0, blog: 1, gallery: 2
end
