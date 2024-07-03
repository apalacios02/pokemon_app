class HeldItemsController < ApplicationController
  def index
    @held_items = HeldItem.all
  end

  def show
    @held_item = HeldItem.find(params[:id])
  end
end
