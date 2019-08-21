class ArenaController < ApplicationController
  def index
    if params[:player_one] &&  params[:player_two]
      if params[:player_one] == params[:player_two]
        @error = 'Cannot fight itself'
      else
        if rand > 0.5
          one = Character.find params[:player_one]
          two = Character.find params[:player_two]
        else
          two = Character.find params[:player_one]
          one = Character.find params[:player_two]
        end
        @log = []
        while one.life_point > 0 && two.life_point > 0
          @log += one.attack two

          if two.life_point > 0
            @log += two.attack one
          end
        end
        winner = one.life_point <= 0 ? two : one
        @log << {success: "#{winner} won with #{winner.life_point} points!"}
      end
    end
  end
end
