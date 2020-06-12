class ItemsController < ApplicationController

  def index
    @items = Item.where(sold_day: nil).includes(:images).order(updated_at: "DESC")
    @parents = Category.where(ancestry: nil)
  end

  def show
  end
  
  def new
    @item = Item.new
  end

  # 親カテゴリーが選択された後に動くアクション
  def category_children
    #親カテゴリーに紐付く子カテゴリーを取得
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  # 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    #子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    # 親カテゴリを取得
    @category_parent_array = Category.where(ancestry: nil)
    # 子カテゴリを取得
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    # 孫カテゴリを取得
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
  end

  private

  def item_params
    params.require(:item).premit(:name, :category_id, :price, :explanation, :condition, :shipping_fee, :shipping_day)
  end

end
