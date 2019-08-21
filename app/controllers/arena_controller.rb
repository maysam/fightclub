class ArenaController < ApplicationController
  def index
    if params[:player_one] &&  params[:player_two]
      if params[:player_one] == params[:player_two]
        @error = 'Cannot fight itself'
      else
        @fight = Fight.new
        if rand > 0.5
          one = Character.find params[:player_one]
          two = Character.find params[:player_two]
        else
          two = Character.find params[:player_one]
          one = Character.find params[:player_two]
        end
        one.life = one.life_point
        two.life = two.life_point

        @log = []
        while one.life > 0 && two.life > 0
          @log += one.attack two

          if two.life > 0
            @log += two.attack one
          end
        end
        @fight.winner = one.life <= 0 ? two : one
        @fight.loser = one.life <= 0 ? one : two
        @fight.points = @fight.winner.life.round(2)
        @fight.save
        @log << {status: :success, news: "#{@fight.winner} won with #{@fight.points} points!"}
        @log.each { |entry|
          @fight.logs.create entry
        }
      end
    end
  end

  def fight
    @fight = Fight.find params[:id]
  end
end
