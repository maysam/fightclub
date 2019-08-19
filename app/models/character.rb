class Character < ApplicationRecord

  def avatar
    "https://randomuser.me/api/portraits/med/#{id%2 == 0 ? 'women' : 'men'}/#{id%100}.jpg"
  end
end
