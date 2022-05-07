class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = User.search_for(params[:search],params[:word])
    # @word = params([:word])
    # @search = params([:search])

    if @range == "User"
      @users = User.search_for(params[:search],params[:word])
    else
      @books = Book.search_for(params[:search],params[:word])
    end
  end
end
