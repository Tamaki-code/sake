class SakesController < ApplicationController
  def index
    @sakes = Sake.all
  end

  def show
    @sake = Sake.find(params[:id])
    @reviews = @sake.reviews
  end

  def fetch_sake_data # まだ作成していない、仮の状態
    Sake.fetch_and_save_sake_data
    redirect_to sakes_path, notice: '日本酒データが更新されました。'
  end

  def search
    @sakes = if params[:query].present?
               Sake.where('name LIKE ?', "%#{params[:query]}%")
             else
               Sake.all
             end
    render :index
  end
end
