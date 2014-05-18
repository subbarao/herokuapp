class Seat < ActiveRecord::Base
  belongs_to :district
  has_many :nominations, :order => 'votes DESC'
  has_many :winners, class_name: 'Nomination', :order => 'votes DESC', limit: 2
  has_one :winner, class_name: 'Nomination',conditions:  { position: 1 }
  has_one :runner, class_name: 'Nomination',conditions:  { position: 2 }
end
