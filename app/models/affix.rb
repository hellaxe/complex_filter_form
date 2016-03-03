class Affix
  include ActiveModel::Model
  attr_accessor :name, :str, :int, :dex
  AFFIXES = %w(crude superior strong old)

  def self.generate
    Affix.new(name: AFFIXES[rand(AFFIXES.length - 1)], str: rand(10), dex: rand(10), int: rand(10))
  end

end