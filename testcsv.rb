require 'csv'

csv = CSV.read('/home/luxin/Bureau/THP/Semaine_3/Mercredi/test.csv', :headers=>true)
p csv['name'] #=>["Raja", "Mathew", "harin", "Soumi"]

#or even:
t = CSV.table('/home/luxin/Bureau/THP/Semaine_3/Mercredi/test.csv')
p t[:no1] #=> [77489, 77559, 77787, 77251]