module ItemsHelper
  def get_image_url(item)
    items =       response = RakutenWebService::Ichiba::Item.search(
        item_code: item.item_code)
    item                  = items.first
    #binding.pry
    
    rakuten_url = item['itemUrl']
  end
end
