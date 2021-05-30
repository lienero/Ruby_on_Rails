class Post < ApplicationRecord
    # belongs_to 다음에는 항상 단수형(bulletin)으로 지정
    # belongs_to ~에 속하다
    belongs_to :bulletin, optional: true
end
