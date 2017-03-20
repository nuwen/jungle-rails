class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @product
    else
      render 'products/show'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
  def review_params

    params.require(:review).permit(

    :description,
    :rating
    )
  end




  def require_login
    return true if current_user
    flash.now[:error] = 'You must login first to post a review!'
    render '/products/show'
  end

end
