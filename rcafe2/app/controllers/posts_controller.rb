class PostsController < ApplicationController
  # 이것은 posts 컨트롤러의 액션 중에서 show, edit,update, destroy 액션이 실행되기 전에 
  # 반드시 set_post 메소드를 실행하도록 해 준다. 이와 같은 필터 메소드는 해당 컨트롤러에서 private으로 선언되어 있다.
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  # posts 컨트롤러의 show 액션 뷰 템블릿 파일인 show.html.erb(app/views/posts/show.html.erb) 내의 인스턴트 변수 @post에는 선택한 객체 정보가 할당된다. 
  # posts 컨트롤러를 확인해 보면 show 액션에는 아무 내용도 없지만 private으로 선언된 set_post 메소드에 의해 
  # 파라미터로 넘겨받은 params[:id]를 이용하여 post 객체를 인스턴스 변수 @post에 할당하게 된다.
  def show
  end

  # GET /posts/new
  # 새로운 데이터를 입력 받을 폼을 렌더링하여 응답으로 보낸다.
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  # 기존 데이터를 수정하기 위한 폼을 렌더링하여 응답으로 보낸다.
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  # DB 쿼리후, 특정 모델의 속성을 변경한 후 DB 테이블로 저장한다. 액션 종료시 show 액션으로 리디렉트된다.
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  # DB 쿼리후, 특정 모델의 특정 객체를 삭제한다. 액션 종료시 index 액션으로 리디렉트된다.
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
