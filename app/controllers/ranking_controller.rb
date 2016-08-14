class RankingController < ApplicationController
  def have
    #binding.pry
    @select_have_want = "have"
    @want_user_list = get_want_user_list
    #binding.pry
  end

  def want
    #binding.pry
    @select_have_want = "want"
    @want_user_list = get_want_user_list
    #binding.pry
  end
  
  
  def get_want_user_list
    rank_list = []
    items = Item.all
    items.each do |item|
      rank_list << [item.id, item.want_users.count]
    end
    rank_list.sort_by{|i| [-i[1]]}.slice(0,10)
    
    #[昇順,降順]
    #p a.sort_by{|i| [i[0],-i[1]] }
    #=> [[1, 9], [1, 5], [1, 2], [2, 9], [2, 2], [7, 5], [7, 0]]

    #[降順,昇順]
    #p a.sort_by{|i| [-i[0],i[1]] }
    #=> [[7, 0], [7, 5], [2, 2], [2, 9], [1, 2], [1, 5], [1, 9]]
  end
end
