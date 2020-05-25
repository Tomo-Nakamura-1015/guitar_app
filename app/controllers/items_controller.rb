class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
    @q = Item.ransack(params[:q])
    @result = @q.result(distinct: true)
    @result = @result.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_path
  end

private
  def item_params
    params.require(:item).permit(:name, :company, :img, :subject)
  end

end
