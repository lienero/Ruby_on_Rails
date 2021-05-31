module ApplicationHelper
    # type 변수 값에 따라 CSS 클래스를 달리 지정할 수 있도록 bootstrap_class_for()라는 어플리케이션 헬퍼 메소드를 정의
    def bootstrap_class_for(flash_type)
        case flash_type
          when "success"
            "alert-success"   # 초록색
          when "error"
            "alert-danger"    # 빨간색
          when "alert"
            "alert-warning"   # 노랑색
          when "notice"
            "alert-info"      # 파랑색
          else
            flash_type.to_s
        end
    end

    def tag_icons(tag_list)
      tag_list.map do | tag |
        # CGI::escape() 메소드는 태그에서 사용할 수 있는 특수문자를 이스케이핑하기 위한 것이다
        "<a href='/posts?tag=#{CGI::escape(tag)}' class='tag'>#{tag}</a>"
      end.join(', ').html_safe
    end

end
