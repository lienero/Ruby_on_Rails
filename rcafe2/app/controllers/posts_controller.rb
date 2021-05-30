class PostsController < ApplicationController
  # bulletins 리소스와 중첩해서 사용하기 위해 선언
  # set_bulletin을 set_post 보다 먼저 before_action으로 지정하였다. 
  # 왜냐하면 set_post 메소드에서 조건절에 @bulletin 인스턴스 변수의 유무를 점거하기 때문이다.
  before_action :set_bulletin
  # 이것은 posts 컨트롤러의 액션 중에서 show, edit,update, destroy 액션이 실행되기 전에 
  # 반드시 set_post 메소드를 실행하도록 해 준다. 이와 같은 필터 메소드는 해당 컨트롤러에서 private으로 선언되어 있다.
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    # 삼항 연산자
    # [구문] 조건식 ? 참인 경우 값 : 거짓인 경우 값
    @posts = @bulletin.present? ? @bulletin.posts.all : Post.all
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
    # @bulletin.posts.new : 글을 새로 추가저장할 때 해당 게시판에 포함
    @post = @bulletin.present? ? @bulletin.posts.new : Post.new
  end

  # GET /posts/1/edit
  # 기존 데이터를 수정하기 위한 폼을 렌더링하여 응답으로 보낸다.
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @bulletin.present? ? @bulletin.posts.new(post_params) : Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  # DB 쿼리후, 특정 모델의 속성을 변경한 후 DB 테이블로 저장한다. 액션 종료시 show 액션으로 리디렉트된다.
  def update
    respond_to do |format|
      if @post.update(post_params)
        #[@post.bulletin, @post] : bulletin_post_path(@post.bulletin, @post)의 축약형
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  # DB 쿼리후, 특정 모델의 특정 객체를 삭제한다. 액션 종료시 index 액션으로 리디렉트된다.
  def destroy
    @post.destroy
    respond_to do |format|
      # @bulletin 인스턴스 변수의 유무에 따라 각각 bulletin_posts_path(@bulletin), posts_path로 리디렉트 되도록 한다.
      format.html { redirect_to (@bulletin.present? ? bulletin_posts_url : posts_url), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin
      #blank? : 문자열에서 사용할 경우 빈 문자열 뿐만 아니라 공백까지 전부 true 로 리턴합니다.
      # .present? :  blank?와 정반대의 결과를 반환합니다.
      # bulletin_id 파라미터 값을 넘겨 받지 못할 경우에는 @bulletin 인스턴스 변수가 생성되지 않는다.
      @bulletin = Bulletin.find(params[:bulletin_id]) if params[:bulletin_id].present?
    end

    def set_post
      if @bulletin.present?
        @post = @bulletin.posts.find(params[:id])
      else
        @post = Post.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
