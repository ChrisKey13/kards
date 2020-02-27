class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @languages = Language.all
    if params[:query].present?
      @lists = current_user.lists.search_by_title_and_description(params[:query])
    else
      @lists = List.all
    end
  end

  def show
    @flashcard = Flashcard.new
  end

  def new
    @list = List.new
  end

  def create
    authorize @list
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize @list
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'Your list has been successfully created'
    else
      render :edit
    end
  end

  def destroy
    authorize @list
    if @list.destroy
      redirect_to root_path, notice: 'Your list was successfully destroyed'
    else
      render :show
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :language_id)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
