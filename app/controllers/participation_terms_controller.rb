class ParticipationTermsController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_challenge

  def index
  end

  def create
    @challenge_participant = @challenge
      .challenge_participants
      .find_by(participant_id: current_participant.id)
    
    if @challenge_participant.blank?
      @challenge_participant = ChallengeParticipant.create!(
        challenge_id: @challenge.id,
        participant_id: current_participant.id
      )
    end
    @challenge_participant.update(accepted_dataset_toc: true)
    redirect_to challenge_path(@challenge)
  end

  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end
end
