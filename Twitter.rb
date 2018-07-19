require 'dotenv'
Dotenv.load
require 'twitter'
require 'csv'

class Twitter_CSV  
# quelques lignes qui enregistrent les clés d'APIs
   client = Twitter::REST::Client.new do |config|
   config.consumer_key        = ENV["Twitter_Consumer_Key"]
   config.consumer_secret     = ENV["Twitter_Consumer_Secret"]
   config.access_token        = ENV["Twitter_Access_Token"]
   config.access_token_secret = ENV["Twitter_Access_Token_Secret"]
  end
#Recherche du document CSV 
csv = CSV.read('/home/luxin/Bureau/THP/Semaine_3/Mercredi/test.csv', :headers=>true)
noms = csv['name']
noms.each do |nom|
#Fonction pour rechercher la mairie 
	client.user_search("#{nom}")
#FOnction pour suivre la mairie 
	client.follow("#{nom}")
    end
end