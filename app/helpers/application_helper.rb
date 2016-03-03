module ApplicationHelper
  def item_class(item)
    case item.rarity
      when 'normal' then 'panel-default'
      when 'magick' then 'panel-info'
      when 'rare' then 'panel-warning'
      when 'legendary' then 'panel-danger'
      when 'uniq' then 'panel-success'

      else 'panel-info'
    end
  end

  def icon_for(query)
    fa_class = case query
      when 'str' then 'hand-rock-o'
      when 'dex' then 'hand-spock-o'
      when 'int' then 'hand-o-up'
      when 'speed' then 'fighter-jet'
      when 'water' then 'wifi'
      when 'fire' then 'fire'
      when 'lightning' then 'flash'
      when 'wind' then 'tree'
      when 'monkey' then 'user-secret'
      when 'lsd' then 'warning'
      when 'mark' then 'wheelchair'
      when 'steel' then 'unlock-alt'
      when 'midas' then 'usd'
      when 'heat' then 'sun-o'
      when 'ice' then 'square'
                 when 'summon' then 'users'
                   else 'tasks'
               end

    fa_icon fa_class
  end
end
