class Mod < ActiveRecord::Base
  belongs_to :item

  update_index('items#item') { item }
end
