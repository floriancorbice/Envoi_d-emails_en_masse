# ____________________________________________________________________________________
# Le scrappeur : l'email / le nom de la commune / le département
# ____________________________________________________________________________________

require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'csv'

class Scrap

  def get_url_gwada # Récupérer les url

     @list_town =[]

     page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/guadeloupe.html"))
     page.css('a.lientxt').each do |node|
        @liens_gwada = node['href'].slice!(1,1000)
        @list_town = node.text.downcase
        get_emails(@liens_gwada)
        departement(@liens_gwada)
     end

     page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/martinique.html"))
     page.css('a.lientxt').each do |node|
        @liens_marti = node['href'].slice!(1,1000)
        @list_town = node.text.downcase
        get_emails(@liens_marti)
        departement(@liens_marti)
     end

     page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/reunion.html"))
     page.css('a.lientxt').each do |node|
        @liens_reunion = node['href'].slice!(1,1000)
        @list_town = node.text.downcase
        get_emails(@liens_reunion)
        departement(@liens_reunion)
     end

  end


  def get_emails(liens) # Récupérer les emails

     page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+liens))
     page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
       @list_adress = node.text
       @list_town
       @depart_name

       # @all_info = [@list_adress, @list_town, @depart_name]
       #
       # @headers = ["Ville","email","departement"]
       #
       # CSV.open("/Users/steven/Desktop/projet-thp/week_3/exo-google-drive/db/data.csv", "a") do |csv|
       #   csv << @headers
       #   @all_info.each do |all|
       #     csv << all
       #   end
       #   end
       @headers = ["Ville","email","departement"]
       @all = [[@list_town, @list_adress, @depart_name]]
        CSV.open("/Users/steven/Desktop/big-projet/Envoi_d-emails_en_masse/db/data.csv", "a") do |csv|
          csv << @headers
          @all.each do |i|
            csv << i
          end
          end

     end
   end

    def departement(liens) # Récuperer le nom de département

     page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+liens))
     page.xpath('/html/body/div/main/section[4]/div/table/tbody/tr[1]/td[2]').each do |node|
       @depart_name = node.text.downcase
       end

     end

end


# -----------------------------------------------------------------------------
get_email = Scrap.new
mailer = get_email.get_url_gwada
# -----------------------------------------------------------------------------
