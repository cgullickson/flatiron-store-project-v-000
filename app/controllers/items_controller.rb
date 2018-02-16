class ItemsController < ApplicationController
  def show
    @item = Item(params[:id])
end
