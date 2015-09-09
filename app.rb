Dir[File.join(File.dirname(__FILE__), './',  'models', '**/*.rb')].sort.each do |file|
  require file
end
require 'pry'
# require './models/member'  # see above


class Membership < Sinatra::Base

  #Lander
  get '/' do
    redirect to '/members'
  end

  #INDEX
  get '/members' do
    @members = Member.all
    erb :home
  end

  #NEW
  get '/members/new' do
    erb :new
  end

  #CREATE
  post '/members' do
    # binding.pry
    @member = Member.new params
    if @member.save
      redirect to "/members/#{@member.id}"
    else
      erb :new
    end
  end

  #SHOW
  get '/members/:id' do
    @member = Member.find(params[:id]) 
    erb :show
  end

  #EDIT
  get '/members/:id/edit' do
    @member = Member.find(params[:id])
    erb :edit
  end

  #UPDATE
  post '/members/:id' do
    @member = Member.find(params[:id]) 
    newdata = {name: params[:name], email: params[:email], expiry: params[:expiry]}
    @member.update(newdata)
      redirect to "/members/#{@member.id}"    
  end

  #DELETE
  post '/members/:id/delete' do
    @member = Member.find(params[:id])
    if @member.destroy # :'(
      redirect to '/members'
    else
      redirect to "/members/#{@member.id}"
    end
  end

end
