class Prefix
  include ActiveModel::Model
  attr_accessor :name, :str, :int, :dex
  PREFIXES = %w(power glory wind earth wind water mind steel)

  def self.generate
    Prefix.new(name: PREFIXES[rand(PREFIXES.length - 1)], str: rand(10), dex: rand(10), int: rand(10))
  end

end