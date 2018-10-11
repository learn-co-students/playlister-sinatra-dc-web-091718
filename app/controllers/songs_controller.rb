class SongsController < ApplicationController

	set :views, "app/views/songs"
	set :method_override, :true

	get "/songs" do
		@songs = Song.all
		erb :index
	end

	get "/songs/new" do
		@genres = Genre.all
		erb :new
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.all
		@artist = @song.artist
		erb :edit
	end

	patch '/songs/:slug' do		
		song = Song.find_by_slug(params[:slug])
		name = params[:song][:name]
		song.update(name: name)

		flash[:notice] = "Successfully updated song."
		
		song.song_genres.each {|sg| sg.delete }

		params[:song][:genres].each do |genre_slug|
			song.genres << Genre.find_by_slug(genre_slug)
		end

		artist_name = params[:artist]

		unless song.artist.name == artist_name
			artist = Artist.find_or_create_by(name: artist_name)
			song.update(artist: artist)
		end

		redirect "/songs/#{song.slug}"
	end

	get "/songs/:slug" do
		@song = Song.find_by_slug(params[:slug])

		erb :show
	end

	post '/songs' do
		name = params[:song][:name]
		song = Song.create(name: name)
		flash[:notice] = "Successfully created song."
		params[:song][:genres].each do |genre_slug|
			song.genres << Genre.find_by_slug(genre_slug)
		end

		artist_name = params[:artist]
		artist = Artist.find_or_create_by(name: artist_name)
		song.artist = artist
		song.save

		redirect "/songs/#{song.slug}"
	end


end
