class EntriesController < ApplicationController
  before_action :find_entry, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy ]

  def new
    @entry = Entry.new
  end

  def create
    @entry  = Entry.new( entry_params )
    if @entry.save
      redirect_to entry_path( @entry ), notice: 'Entry Created'
    else
      render :new
    end
  end

  def show
  end

  def index
    @entries = Entry.all
  end

  def edit
  end

  def update
    if @entry.update( entry_params )
      redirect_to entry_path( @entry ), notice: 'Entry Updated'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path, notice: 'Entry Destroyed'
  end

  protected
  def entry_params
    params.require(:entry).permit( :title, :contents, :year, :month, :day, category_ids: [] )
  end

  def find_entry
    @entry = Entry.find( params[:id] )
  end

end
