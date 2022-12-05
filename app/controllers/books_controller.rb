class BooksController < ApplicationController


    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
        else
        @user = current_user
        @books = Book.all
        render :index
        end
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user_id == current_user.id
            render "edit"
        else
            redirect_to books_path
        end


    end

    def show
        @newbook = Book.new
        @book = Book.find(params[:id])
        @user = @book.user
    end

    def index
        @book = Book.new
        @user = current_user
        @books = Book.all
    end

    def update
        @book = Book.find(params[:id])
        @book.user_id = current_user.id
        if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book.id)
        else
        render :edit
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to '/books'
    end


    private

    def book_params
    params.require(:book).permit(:title, :body)
    end

    def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
    end

end
