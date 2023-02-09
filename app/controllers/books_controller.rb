class BooksController < ApplicationController
  
  def index
    @bookers = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(booker_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @bookers = Book.all
      render :index
    end
  end

  def show
     @booker = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
  	 @book = Book.find(params[:id])
   if @book.update(booker_params)
    flash[:notice] = "Book was successfully updated."
  	redirect_to book_path(@book.id)
  	else
    render :edit 
   end
  end

 def destroy
  	book = Book.find(params[:id])
  if book.destroy
  	 flash[:notice] = "Book was successfully destroyed."
   redirect_to books_path
  end
 end

  private
  def booker_params
  	params.require(:book).permit(:title, :body)
  end
end
