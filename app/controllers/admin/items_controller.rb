class Admin::ItemsController < ApplicationController
  # 商品新規登録画面
  def new
    @item = Item.new
  end

  # 商品情報の新規登録
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  # 商品一覧
  def index
    @items = Item.all
  end

  # 商品詳細画面
  def show
    @item = Item.find(params[:id])
  end

  # 商品編集画面
  def edit
    @item = Item.find(params[:id])
  end

  # 商品情報の更新
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
