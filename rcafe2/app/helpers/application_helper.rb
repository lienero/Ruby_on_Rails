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
end
