class Comment < ApplicationRecord
  belongs_to :post
  # body 속성에 대한 필수항목으로 유효성 검증을 지정
  validates :body, presence: true
end
