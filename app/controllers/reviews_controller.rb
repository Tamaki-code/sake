class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sake

  def new
    @review = @sake.reviews.new
  end

  def create
    @review = @sake.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @sake, notice: 'レビューが作成されました。'
    else
      render :new
    end
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to @sake, notice: 'レビューが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to @sake, notice: 'レビューが削除されました。'
  end

  private

  def set_sake
    @sake = Sake.find(params[:sake_id])
  end

  def review_params
    params.require(:review).permit(:rating, :sweetness, :spiciness, :lightness, :richness, :aroma, :aftertaste, :drinking_style, :matching_food, :comment, :image, :recorded_at)
  end
end
