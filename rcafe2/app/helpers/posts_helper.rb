module PostsHelper
    # post 객체의 bulletin_id 속성값으로부터 게시판 이름을 얻기 위한 헬퍼 메소드를 작성
    def bulletin_name(bulletin_id)
        Bulletin.find(bulletin_id).title
    end
end
