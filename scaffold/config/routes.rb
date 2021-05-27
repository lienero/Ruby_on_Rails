Rails.application.routes.draw do
# PUT : 자원의 전체 교체, 자원교체 시 모든 필드 필요)
# PATCH : 자원의 부분 교체, 자원교체시 일부 필드 필요
  # rake routes 명령으로 routes.rb를 분석하여 사용되고 있는 라우트 목록을 확인할 수 있다.
  # URL                       액션    HTTP 메서드   역할
  # /posts(.:format)          index   GET           목록 화면 표시 
  # /posts(.:format)          show    GET           개별 상세 화면 표시 
  # /posts/new(.:format)      new     GET           새로운 데이터 등록 화면 표시
  # /posts(.:format)          create  POST          새로운 데이터 등록 화면의 입력을 받아 데이터 등록 처리 
  # /posts/:id/edit(.:format) edit    GET           수정 화면 표시
  # /posts/:id(.:format)      update  PATCH/PUT     수정 화면의 입력을 받아 수정 처리 
  # /posts/:id(.:format)      destroy DELETE        목록 화면에서 지정된 데이터 제거 처리 
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
