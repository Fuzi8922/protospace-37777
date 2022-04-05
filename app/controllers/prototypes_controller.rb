class PrototypesController < ApplicationController

  before_action :authenticate_user!,only: [:new, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(prototype_id: params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user == current_user
      redirect_to action: :index
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.update(prototype_params)
      redirect_to action: :show
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to action: :index
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(
      user_id: current_user.id)
  end

end
