class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
    @movies_array = []
    @movies.each do |movie|
      @movies_array << movie.title
    end
  end

  def create
    @bookmark = Bookmark.new(review_params)
    @list = List.find(params[:list_id])
    @movie_title = params[:bookmark][:movie]
    @movies = Movie.all
    @movies.each do |movie|
      if movie.title == @movie_title
        @new_movie_bookmark = movie
      end
    end
    @bookmark.list_id = @list.id
    @bookmark.movie_id = @new_movie_bookmark.id
    if @bookmark.save
      redirect_to list_path(@list.id), notice: 'Bookmark was successfully created.'
    else
      redirect_to new_list_bookmark_path(@list.id)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list_id)
  end

  private

  def review_params
    params.require(:bookmark).permit(:comment, :movie_title)
  end
end
