class EntriesController < ApplicationController

  def index
    @entries=Entry.all
  end

  def show
    @entry=Entry.find(params[:id])
  end

  def new
    @entry=Entry.new
  end

  def create
    @entry=Entry.new(entries_params)
    if @entry.save
      redirect_to(:action=>'index')
    else
      render('new')
    end
  end

  def edit
    @entry=Entry.find(params[:id])
  end

  def update
    @entry=Entry.find(params[:id])
    if @entry.update_attributes(entries_params)
      redirect_to(:action=>'show',:id=> @category.id)
    else
      render('index')
    end
  end

  def delete
    @entry=Entry.find(params[:id])
  end

  def destroy
    Entry.find(params[:id]).destroy
    redirect_to(:action=>'index')
  end

  private

  def set_entry 
    @entry=Entry.find(params[:id])
  end

  def entries_params
    params.require(:entry).permit(:fullName,:mobile,:photo_url)
  end

end
