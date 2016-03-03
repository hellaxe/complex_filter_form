class League < ActiveRecord::Base
  has_many :items, dependent: :destroy

  update_index('items#item') { items }
end
