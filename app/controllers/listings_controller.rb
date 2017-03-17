class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    # 現在のユーザーのリスティングの作成。保存はしていない。
    @listing = current_user.listings.build
  end

  def create
    # パラメーターとともに現在のユーザーのリスティングを作成
    @listing = current_user.listings.build(listing_params)

    #セーブできたら
    if @listing.save
      redirect_to edit_listing_path(@listing), notice:"リスティングを作成・保存をしました"
    else
      redirect_to edit_listing_path, notice:"リスティングを作成・保存できませんでした"
    end
    
  end

  def edit
  end

  def update
  end

  private
  def listing_params
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size)
  end
end
