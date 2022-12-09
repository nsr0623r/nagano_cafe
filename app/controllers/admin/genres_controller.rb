class Admin::GenresController < ApplicationController
  # ジャンル管理画面(一覧・追加を兼ねる)
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  # ジャンルデータ登録
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  # ジャンル編集画面
  def edit
  end
  
  # ジャンルデータ更新
  def udpate
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
