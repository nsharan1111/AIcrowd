class Submission::Cell::ChallengeRoundPills < Submission::Cell

  def show
    if challenge_rounds.count > 1
      render :challenge_round_pills
    else
      nil
    end
  end

  def challenge
    model
  end

  def current_round_id
    options[:current_round_id]
  end

  def my_submissions
    options[:my_submissions]
  end

  def challenge_rounds
    challenge.challenge_rounds
  end

  def tab_class(challenge_round)
    if challenge_round.id == current_round_id
      return 'nav-link active'
    else
      return 'nav-link'
    end
  end

end
