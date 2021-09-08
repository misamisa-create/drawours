class UsersController < ApplicationController

  def edit
  end

  def show
    # N+1問題を防ぐためのincludesメソッド
    # あとでfavoriteなども追加していく
    @posts_all = Post.includes(:user)
    @user = User.find(params[:id])
    @posts = @posts_all.where(user_id: @user).order("created_at DESC")
  end

  def update
  end
end
