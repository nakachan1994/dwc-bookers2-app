class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book.id
    @book_comment.save
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:book_id])
    # コメント削除時発火しない
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
