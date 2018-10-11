class SongsController < ApplicationController
  # set :views, "app/views/songs"

  get '/songs' do
    @songs=Song.all
    erb :"songs/index"
  end


  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

end
