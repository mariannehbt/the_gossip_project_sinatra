# frozen_string_literal: true

require 'csv'
require 'pry'

# On enregistre le potin dans la base de donnees
class Gossip
  attr_accessor :author, :content

  def initialize(super_author, super_description)
    @author = super_author
    @content = super_description
  end

  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def self.find(gossip_id)
    all[gossip_id]
  end

  def self.update(id, new_author, new_description)
    CSV.read('./db/gossip.csv')[id][0] == new_author
    CSV.read('./db/gossip.csv')[id][1] == new_description
  end
#binding.pry
end
