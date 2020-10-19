require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end
  
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    Gossip.all.select do |gossip|
      gossip == params[:id]
    end
    erb :show
  end 


  get '/gossips/id/edit/' do
  erb :edit, locals: {gossip_edit: Gossip.find}
  end

  post '/gossips/id/edit/' do
      Gossip.update(params['id'], params["gossip_author"], params["gossip_content"])
      redirect "/gossips/#{gossip}/"
  end 
 end 
