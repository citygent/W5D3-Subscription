# Dir[File.join(File.dirname(__FILE__), '..',  'models', '**/*.rb')].sort.each do |file|
#   require file
# end
require 'sinatra'
require 'pry'

class Membership < Sinatra::Base

  #Lander
  get '/' do
    redirect to '/player'
  end

  #INDEX
  get '/players' do
    @players = Player.all
  end

  #NEW
  # get '/players/new' do
  #  Not needed we don't need a page for this exercise.
  # end

  #CREATE
  post '/players' do
    hash = {name: "Margherita", sauce: "Tomato", cheese: true, mushrooms: false, extra_toppings: false}
    @player = Player.new(hash) #Player.new hash
    if @player.save
      # redirect to show
    end
  end

  #SHOW
  get '/players/:id' do
    @player = Player.find(params[:id]) # or maybe @player = Player.find(:id)
    # render :show
  end

  #EDIT
  get '/players/:id/edit' do
    # @player = Player.find(params[:id])
    # Not needed we don't need a page for this exercise.
  end

  #UPDATE
  put '/players/:id' do
    #IRL: changes = {sauce: params[:sauce]}
    changes = {sauce: "Pomodoro"}
    @player = Player.find(params[:id]) 
    @player = @player.update(changes)
    # @player.save < not needed with update.
  end

  #DELETE
  delete '/players/:id/delete' do
    @player = Player.find(params[:id])
    @player.destroy # :'(
  end

end
