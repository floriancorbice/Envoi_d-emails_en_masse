require 'dotenv'
require 'Gmail'

gmail = Gmail.connect(ENV["adresse"], ENV["mot_de_passe"])

gmail.deliver do
	# j'ai éssayé de connecté mon adresse mail et mot de passe mais ça na pas marché 


to "luxiluxlth@gmail.com"
    # ou envoyez le mail
		subject "object"

		html_part do

			content_type 'text/html; charset=UTF-8'

  			body "<p>Ton message a envoyé</p>"
    # message a envoyé 
		end

	end

# ça marche pô 
# j'ai aussi éssayé avec API j'ai pus faire le lien entre le compte et mon ordi mais impossible d'envoyé des mails avec sous ruby
