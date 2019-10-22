# frozen_string_literal: true

require 'gossip'

# La class ApplicationController herite de la class Sinatra
# On execute le code au lancement de l'URL
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  get '/gossips/:id' do
    erb :show, locals: { gossips: Gossip.find(params['id'].to_i - 1),
                         id: params['id'].to_i }
  end

  get '/gossips/:id/edit/' do
    erb :edit, locals: { gossips: Gossip.find(params['id'].to_i - 1),
                         id: params['id'].to_i }
  end

  post '/gossips/:id/edit/' do
    Gossip.update(params['id'].to_i,
                  params['gossip_author'].to_s, params['gossip_content'].to_s)
    redirect '/'
  end
  # puts "Hello #{params['id'].to_i}!"
  # puts Gossip.find(params['id'].to_i)
  # params['id']
end
