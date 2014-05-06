class BooksController < ApplicationController
  before_action :find_book, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy ]

  def new
    @book = Book.new
  end

  def create
    @book  = Book.new( book_params )
    if @book.save
      redirect_to book_path( @book ), notice: 'Book Created'
    else
      render :new
    end
  end

  def show
  end

  def index
    @books = Book.all
  end

  def edit
  end

  def update
    if @book.update( book_params )
      redirect_to book_path( @book ), notice: 'Book Updated'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book Destroyed'
  end

  protected
  def book_params
    params.require(:book).permit( :title, :about )
  end

  def find_book
    @book = Book.find( params[:id] )
  end

end
