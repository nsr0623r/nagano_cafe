class Public::HomesController < ApplicationController
  # トップページ
  def top
    @items = Item.order('id DESC').limit(4)
  end

  # アバウトページ
  def about
  end
end
