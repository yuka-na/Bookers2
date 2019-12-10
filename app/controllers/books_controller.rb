class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:about]
    before_action :currentbook, only: [:update, :edit, :destroy]
	def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
        @user = current_user
        @books = Book.all
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book.id)
        else
            render :index
        end
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book.id)
            flash[:notice] = "Book was successfully updated."
        else
            render :edit
        end
    end
    def index
        @book = Book.new
    	@books = Book.all
    end
    def show
    	@book = Book.find(params[:id])
        @bookn = Book.new
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
        flash[:notice] = "Book was successfully destroyed."
    end
    def about
    end
    def home
    	@book = Book.new
    end

private
    def book_params
        params.require(:book).permit(:title, :body)
    end
    def currntbook
        currentbook = Book.find(params[:id])
        if currentbook.user != current_user
            redirect_to books_path
        end
    end
end
