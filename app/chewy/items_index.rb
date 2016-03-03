class ItemsIndex < Chewy::Index
  define_type Item.includes(:mods, :league) do
    field :name
    field :str, type: 'integer'
    field :dex, type: 'integer'
    field :int, type: 'integer'
    field :league_id, type: 'integer'
    field :mods_sum, value: ->(item) { item.mods.sum(:value) }
    field :mods_count, value: ->(item) { item.mods.count }
    field :mods, type: 'nested' do
      field :name
      field :value, type: 'integer'
    end
  end
end