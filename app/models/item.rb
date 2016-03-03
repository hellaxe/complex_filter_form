class Item < ActiveRecord::Base
  has_many :mods, dependent: :destroy
  belongs_to :league

  update_index('items#item') { self }

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  #
  # def as_indexed_json(options = {})
  #   as_json(
  #       only: [:id, :name, :str, :dex, :int, :full_name],
  #       include: [:mods, :league],
  #       methods: [:mods_count, :mods_sum, :full_name]
  #   )
  # end


  def full_name
    name = affix.present? ? "#{affix} #{self.name}" : "#{self.name}"
    name += prefix.present? ? " of #{prefix}" : ''

    name.titleize
  end

  def mods_sum
    self.mods.sum(:value)
  end

  def mods_count
    self.mods.count
  end

  def apply_affix
    affix = Affix.generate
    self.affix = affix.name
    self.str += affix.str
    self.dex += affix.dex
    self.int += affix.int
  end

  def apply_prefix
    prefix = Prefix.generate
    self.prefix = prefix.name
    self.str += prefix.str
    self.dex += prefix.dex
    self.int += prefix.int
  end
end
