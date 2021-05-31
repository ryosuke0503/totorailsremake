class MatchesController < ApplicationController
    def index
        @matches = Match.all
    end
    def new
        @match = Match.new
    end    
    def create
        home_id = Team.find_by(name: params[:match][:home]).id
        away_id = Team.find_by(name: params[:match][:away]).id
        Match.create(match_params.merge(home: home_id, away: away_id))
        redirect_to matches_path
    end
    def edit
        @match = Match.find(params[:id])
    end   
    def update
        @match = Match.find(params[:id])
        @match.update(match_params)
        redirect_to matches_path
    end
    def destroy
        @match = Match.find(params[:id])
        @match.destroy
        redirect_to matches_path
    end
    def import
        Match.import(params[:file])
        redirect_to matches_path
    end
    
    private
      def match_params
        params.require(:match).permit(:year, :league, :kind, :date, :time, :home, :homescore, :awayscore, :away, :stadium, :viewers, :broadcasts)
      end
end
