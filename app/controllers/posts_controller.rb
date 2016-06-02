class PostsController < ApplicationController
  # impressionist actions: [:show, :index], unique: [:session_hash]

  before_action :set_post, only: [:show, :edit, :update, :destroy, :downvote, :upvote]

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.order(created_at: :desc)
    @smalls = Post.of_small.order(created_at: :DESC).paginate(:page => params[:page], :per_page => 15)
    @defaults = Post.of_default.order(created_at: :DESC).paginate(:page => params[:page], :per_page => 12)
    @covers = Post.of_cover.order(created_at: :DESC)
    @slides = Post.of_slide.order(created_at: :DESC).limit(5)
    @tops = Post.of_top.order(created_at: :DESC).limit(1)
    @reports = Post.order(created_at: :DESC)
    @bots = Post.of_bottom.order(created_at: :DESC).limit(1)
    @bigs = Post.of_big.order(created_at: :DESC).limit(1)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    @post.upvote_from current_user
    redirect_to root_path
  end

  def downvote
    @post.down vote_from current_user
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      # impressionist(@post, "message...") # 2nd argument is optional

      # impressionist(@post, "some message", :unique => [:session_hash])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :description, :format_post, :hide_post, :ads, :excerpt, :category_id, :user_id, :meta_title, :meta_description, :viewer)
    end
end
