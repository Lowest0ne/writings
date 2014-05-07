class CategoriesController < ApplicationController
  before_action :find_category, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy ]

  def new
    @category = Category.new
  end

  def create
    @category  = Category.new( category_params )
    if @category.save
      redirect_to category_path( @category ), notice: 'Category Created'
    else
      render :new
    end
  end

  def show
    @entries = Entry.joins( :entry_categories ).where( "entry_categories.category_id =  #{@category.id}" ).select( "title, year, month, day, entries.id" )
  end

  def index
    @categories = Category.all
  end

  def edit
  end

  def update
    if @category.update( category_params )
      redirect_to category_path( @category ), notice: 'Category Updated'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to entries_path, notice: 'Category Destroyed'
  end

  protected
  def category_params
    params.require(:category).permit( :name )
  end

  def find_category
    @category = Category.find( params[:id] )
  end

end
