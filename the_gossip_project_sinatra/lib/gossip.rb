require 'csv'
require 'pry'
class Gossip

attr_accessor :content, :author

def initialize (author, content)
  @content = content
  @author = author
end

  def save # on conect le routeur a un fichier CSV pour enregistrer les données.
      CSV.open("/Users/louisonboisselier/Desktop/Idée/THP_2/S5/01-Lundi/the_gossip_project_sinatra/db/gossip.csv", "ab") do |csv| #utilisation du mode "a+"  Lecture-écriture, commence à la fin du fichier si le fichier existe, sinon crée un nouveau fichier pour la lecture et l'écriture.
        csv << [@author, @content]
      end
    
  end 

  def self.all
    all_gossips = []
    CSV.read("/Users/louisonboisselier/Desktop/Idée/THP_2/S5/01-Lundi/the_gossip_project_sinatra/db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

    def self.find(id)
      data_base = CSV.read("/Users/louisonboisselier/Desktop/Idée/THP_2/S5/01-Lundi/the_gossip_project_sinatra/db/gossip.csv")
      return data_base[id]
  end

  def show 
    Gossip.all.each.with_index(1) do |index|
    end
      return "#{index}"
  end 

  def self.update (id, new_author, new_content)
    all_gossips = []
    CSV.read("/Users/louisonboisselier/Desktop/Idée/THP_2/S5/01-Lundi/the_gossip_project_sinatra/db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1]) 
    end 

    gossip_edit= all_gossips[id.to_i]

    gossip_edit.author = new_author
    gossip_edit.content = new_content
    all_gossips[id.to_i] = gossip_edit

    CSV.open("/Users/louisonboisselier/Desktop/Idée/THP_2/S5/01-Lundi/the_gossip_project_sinatra/db/gossip.csv", "w") do |csv_line|
      all_gossips.each do |gossip|
        csv_line << [gossip_edit.author, gossip_edit.content]
      end
    end
  end 
  
end 
