class ListingsController < ApplicationController
  before_action :authenticate_user!

  #onlyで指定したアクションの前に実行。
  before_action :set_listing, only: [:update, :basics, :description, :address, :price, :photos, :calendar, :bankaccount, :publish]

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
      redirect_to manage_listing_basics_path(@listing), notice:"リスティングを作成・保存をしました"
    else
      redirect_to edit_listing_path, notice:"リスティングを作成・保存できませんでした"
    end

  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to :back, notice:"更新できました"
    end
  end



  def basics
    
  end

  def address
  end

  def description
  end

  def price
  end

  def photos
  end

  def calendar
  end

  def bankaccount
  end

  def publish
  end  

  private
  def listing_params
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight)
  end

  # http://localhost:3000/manage-listing/2 の「2」にあたる部分
  def set_listing
    @listing = Listing.find(params[:id])
  end

end
