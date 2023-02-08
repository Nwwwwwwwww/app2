class BookersController < ApplicationController
  def new
   @booker = Book.new
  end

 def create
    book = Book.new(booker_params)
  if book.save
    redirect_to booker_path(book.id), notice: "Book was successfully created."
  end
 end

  def index
    @bookers = Book.all
    @booker = Book.new
  end

  def show
     @booker = Book.find(params[:id])
  end

  def edit
     @booker = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
   if book.update(booker_params)
  	redirect_to booker_path(book.id), notice: "Book was successfully updated."
   end
  end

 def destroy
  	book = Book.find(params[:id])
  if book.destroy
  	redirect_to bookers_path, notice: "Book was successfully destroyed."
  end
 end

  private
  def booker_params
  	params.permit(:Title, :Body)
  end
end
