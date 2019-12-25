class FavoritesController < ApplicationController
  def create
  	book = Book.find(params[:book_id])
  	favorite = current_user.favorites.new(book_id: book.id)
  	favorite.save
  	redirect_back(fallback_location: root_path) #fallback_location: self.locationでも可
  end

  def destroy
  	book = Book.find(params[:book_id])
  	favorite = current_user.favorites.find_by(book_id: book.id)
  	favorite.destroy
  	redirect_back(fallback_location: self.location)
  end
end
