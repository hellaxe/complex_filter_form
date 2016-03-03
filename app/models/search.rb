class Search
  include Virtus.model

  attribute :query, String
  attribute :league_id, Integer
  attribute :min_str, Integer
  attribute :max_str, Integer

  attribute :min_int, Integer
  attribute :max_int, Integer

  attribute :min_dex, Integer
  attribute :max_dex, Integer

  attribute :min_mods_count, Integer
  attribute :max_mods_count, Integer
  attribute :mods, Array
  attribute :view, String

  def index
    ItemsIndex
  end

  def to_angular
    {
        query: query,
        league_id: league_id,
        min_str: min_str,
        max_str: max_str,
        min_dex: min_dex,
        max_dex: max_dex,
        min_int: min_int,
        max_int: max_int,
        view: view,
        mods: mods.map {|n, m| {name: m[:name], min_value: m[:min_value], max_value: m[:max_value]}}
    }
  end

  def search
    [query_string, str_filter, dex_filter, int_filter, league_id_filter,
     mods_filters, mods_count_filter].compact.reduce(:merge) || index
  end

  def query_string
    index.query(query_string: {
                    fields: [:name, :full_name],
                    query: query, default_operator: 'and'
                }) if query.present?
  end

  def league_id_filter
    index.filter(term: { league_id: league_id }) if league_id.present?
  end

  def mods_filters
    mods.map {|number, mod| mods_filter(mod) }.compact.reduce(:merge)
  end

  def mods_filter(mod)
    a = {
      nested: {
        path: 'mods',
        query: {
          filtered: {
            query: {
              match_all: {}
            },
            filter: {
              and: []
            }
          }
        }
      }
    }
    mod_range_body = {}.tap do |body|
      body.merge!({gte: mod[:min_value]}) if mod[:min_value].present?
      body.merge!({lte: mod[:max_value]}) if mod[:max_value].present?
    end

    mod_term_body = {}.tap do |body|
      body.merge!({ 'mods.name' => mod[:name]}) if mod[:name].present?
    end

    if mod_term_body.present?
      a[:nested][:query][:filtered][:filter][:and] << { term: mod_term_body }
      a[:nested][:query][:filtered][:filter][:and] << { range: { 'mods.value' => mod_range_body } } if mod_range_body.present?

      index.filter(a)
    else
      nil
    end
  end

  def mods_count_filter
    body = {}.tap do |body|
      body.merge!({gte: min_mods_count}) if min_mods_count.present?
      body.merge!({lte: max_mods_count}) if max_mods_count.present?
    end
    index.filter(range: { mods_count: body }) if body.present?
  end

  def str_filter
    body = {}.tap do |body|
      body.merge!({gte: min_str}) if min_str.present?
      body.merge!({lte: max_str}) if max_str.present?
    end
    index.filter(range: { str: body }) if body.present?
  end

  def dex_filter
    body = {}.tap do |body|
      body.merge!({gte: min_dex}) if min_dex.present?
      body.merge!({lte: max_dex}) if max_dex.present?
    end
    index.filter(range: { dex: body }) if body.present?
  end

  def int_filter
    body = {}.tap do |body|
      body.merge!({gte: min_int}) if min_int.present?
      body.merge!({lte: max_int}) if max_int.present?
    end
    index.filter(range: { int: body }) if body.present?
  end

end