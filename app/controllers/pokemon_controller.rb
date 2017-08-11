class PokemonController < ApplicationController
  def show

    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")#this will now haev the dynamic id typed into url by the user.
    body = JSON.parse(res.body)
    name_of_pokemon  = body["name"]
    id  = body["id"]
    types= body["types"]
    types_array=[]

    types.each do |element|
      types_array<<element["type"]["name"]
    end

    #response from second api of GIF info
    res2 = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=89af51bfa8eb41579afee8cb3bc79629&q=#{[name_of_pokemon]}&rating=g")
    body2 = JSON.parse(res2.body)
    gif_url = body2["data"][0]["url"]

    byebug
    render json: { "message": "ok" }

  end

end
