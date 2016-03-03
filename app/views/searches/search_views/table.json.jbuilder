json.total_count @items.total_count
json.results do
  json.array! @items do |item|
    json.name item.name
    json.str item.str
    json.dex item.dex
    json.int item.int
    json.full_name item.full_name.titleize
  end
end