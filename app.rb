require_relative 'config/environment'


class App < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    session["name"] = "Emily"
    @session = session
    erb :index
  end

  post '/checkout' do
    session[:item] = params[:item]
    @item = session[:item]
    erb :checkout
  end
end
