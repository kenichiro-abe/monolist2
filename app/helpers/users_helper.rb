module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def item_status_want? (item_code) #検証中
    item = want_items.find_by(item_code: item_code)
    #binding.pry
    item_id = item.id if item != nil
    wants.find_by(item_id: item_id) != nil 
  end
  def getWantItemId (item_code) #検証中
    item = want_items.find_by(item_code: item_code)
    item_id = item.id if item != nil
    #binding.pry
    item_id
  end


  def item_status_have? (item_code) #検証中
    item = have_items.find_by(item_code: item_code)
    item_id = item.id if item != nil
    haves.find_by(item_id: item_id) != nil
  end
  def getHaveItemId (item_code) #検証中
    item = have_items.find_by(item_code: item_code)
    item_id = item.id if item != nil
    #binding.pry
    item_id
  end
end
