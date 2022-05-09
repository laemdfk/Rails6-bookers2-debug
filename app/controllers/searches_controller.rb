class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = User.search_for(params[:search],params[:word])
    @content = params[:content]
		@method = params[:method]
    # @word = params([:word])
    # @search = params([:search])
	if @range == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Book.search_for(@content, @method)
		end
	end
end
