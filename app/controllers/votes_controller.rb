class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
      if @vote.save
        redirect_to root_path
      else
        redirect_back(fallback_location: root_path)
        flash[:notice] = "you already voted"
      end
  end

  private
    def vote_params
      params.require(:vote).permit(:user_id, :parent_type, :parent_id, :score)
    end
    
end
