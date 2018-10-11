class SongsController < ApplicationController

	set :views, "app/views/songs"

	get "/songs" do
		@songs = Song.all
		erb :index
	end

	get "/songs/new" do
		@genres = Genre.all
		erb :new
	end

	get "/songs/:slug" do
		@song = Song.find_by_slug(params[:slug])

		erb :show
	end

	post '/songs' do
		name = params[:song][:name]
		song = Song.create(name: name)
		genres = params[:song][:genres]
		song.genres << genres
	end

end
