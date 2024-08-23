class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sake

  def index
    @sake = Sake.find(params[:sake_id])
    @reviews = @sake.reviews
  end
  

  def new
    @review = @sake.reviews.new
  end

  def create
    @sake = Sake.find(params[:sake_id])
    @review = @sake.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "投稿完了しました"
      redirect_to sake_path(@sake)
    else
      # エラーメッセージが配列で返されるため、事前にメッセージを構築する
      error_messages = @review.errors.full_messages.join(', ')
      flash.now[:alert] = "投稿に失敗しました: #{error_messages}"
      # flash.now[:alert] = "投稿に失敗しました" + @review.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  # def create
  #   @review = @sake.reviews.new(review_params)
  #   @review.user = current_user
  #   Rails.logger.debug("current_user: #{current_user.inspect}")
  #   if @review.save
  #     redirect_to @sake, notice: 'レビューが作成されました。'
  #   else
  #     render :new
  #   end
  # end

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
    params.require(:review).permit(:sake_id, :rating, :sweetness, :spiciness, :lightness, :richness, :aroma, :aftertaste, :drinking_style, :matching_food, :comment, :image, :recorded_at)
  end
end
