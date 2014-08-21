module DotaHelper
  def hero_name(hero_id)
    Dota::Constants::Heroes[hero_id]
  end

  def img_url_from_steam(name, item_type = "items", thumbnail = true)
    suffix = thumbnail ? "eg" : "lg"
    "http://media.steampowered.com/apps/dota2/images/#{item_type}/#{name}_#{suffix}.png"
  end

end

