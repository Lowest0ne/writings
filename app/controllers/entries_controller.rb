class EntriesController < ApplicationController
  before_action :find_entry, only: [ :show, :edit, :update, :destroy ]
  before_action :find_book, only: [ :new, :create, :index ]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy ]

  def new
    @entry = Entry.new
    @categories = Category.all
  end

  def create
    @entry  = @book.entries.build( entry_params )
    if @entry.save
      redirect_to entry_path( @entry ), notice: 'Entry Created'
    else
      render :new
    end
  end

  def show
    @categories = Category.joins( :entry_categories ).where( "entry_categories.entry_id = #{@entry.id} " ).select( "name, categories.id " )
    @category_class = @categories.first.name.downcase.gsub( / /, '_' ) if @categories.any?
  end

  def index
    @entries = @book ? @book.entries : Entry.all
  end

  def edit
    @categories = Category.all
  end

  def update
    if @entry.update( entry_params )
      redirect_to entry_path( @entry ), notice: 'Entry Updated'
    else
      render :edit
    end
  end

  def destroy
    @book = @entry.book
    @entry.destroy
    redirect_to book_path( @book ) , notice: 'Entry Destroyed'
  end

  protected
  def entry_params
    params.require(:entry).permit( :title, :contents, :year, :month, :day, category_ids: [] )
  end

  def find_entry
    @entry = Entry.find( params[:id] )
  end

  def find_book
    @book = Book.find( params[ :book_id ] )
  rescue
    @book = nil
  end

end
