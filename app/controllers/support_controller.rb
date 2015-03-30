class SupportController < ApplicationController
  def index
    @supports = Support.all
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(params.require(:support).permit(:name, :email, :department, :message))
    if @support.save
      redirect_to root_path
    else
      flash[:alert] = "You need to enter a name and email address."
      render :new
    end
  end

  def edit
    @support = Support.find(params[:id])
  end

  def update
    @support = Support.find(params[:id])
    if @support.update(params.require(:support).permit(:name, :email, :department, :message))
      redirect_to root_path, notice: "Updated successfully."
    else
      flash[:alert] = "You need to enter a name and email address."
      render :edit
    end
  end

  def destroy
    @support = Support.find(params[:id])
    @support.destroy
    redirect_to root_path, notice: "Post deleted."
  end



end
