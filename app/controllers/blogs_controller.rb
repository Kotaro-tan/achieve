class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  
  def index
    # インスタンス変数でビューに渡す
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      # ActiveRecord::Baseを継承したBlogクラスのインスタンスを作る
      # @blogとすることでインスタンス変数を定義している
      # @をつけることでviewにファイルを渡すことができる
      @blog = Blog.new 
    end  
  end
  
  def edit
    # @blog = Blog.find(params[:id])
  end
  
  def update
    # @blog = Blog.find(params[:id])
    @blog.update(blogs_params)
    if @blog.save
      # puts '成功'
      # indexアクションにリダイレクトする
      redirect_to blogs_path, notice: 'ブログを編集しました！'
    else
      # puts '失敗'
      # 入力フォームを再描画
      render action: 'edit'
    end  
    
  end
  
  def destroy
    # @blog = Blog.find(params[:id])
    @blog.destroy
    # indexアクションにリダイレクトする
    redirect_to blogs_path, notice: 'ブログを削除しました！'
  end    
  
  def create
    @blog = Blog.create(blogs_params)
    if @blog.save
      # indexアクションにリダイレクトする
      redirect_to blogs_path, notice: 'ブログを作成しました！'
    else
      # 入力フォームを再描画
      render action: 'new'
    end  
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end  
  
  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end
    
    def set_blog
      @blog = Blog.find(params[:id])
    end  
  
end
