class Post < ApplicationRecord
    # belongs_to 다음에는 항상 단수형(bulletin)으로 지정
    # belongs_to ~에 속하다
    belongs_to :bulletin, optional: true
    # PictureUploader 업로더 클래스를 picture 속성으로 마우트한다.
    mount_uploader :picture, PictureUploader
    # 코멘트
    has_many :comments, dependent: :destroy
end
