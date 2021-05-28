Rails.application.routes.draw do
  # resource_route 모듈을 호출하여 config/routes.rb 파일에 resources :posts 라인을 추가한다. 이와 같이 라우팅을 선언하는 방법을 리소스 라우팅이라고 한다. 
  resources :posts
  # root 라우트 정의는 routes.rb 파일에서 최상위에 위치해야 한다. 
  # 여기서 welcome 컨트롤러의 index 액션을 루트 라우트로 지정하면 홈페이지(http://localhost:3000) 접속시에 자동으로 welcome 컨트롤러의 index 액션이 호출된다.
  # 주의할 것은 컨틀롤러와 액션명 사이에 '/'가 아니고 '#' 문자를 사용해야 한다는 것이다.
  root 'welcome#index'
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
