class Challenge::Cell::ChallengeMasthead < Challenge::Cell

  def show
    render :challenge_masthead
  end

  def show_old
    render :challenge_masthead_old
  end

  def challenge
    model
  end

  def organizer
    model.organizer
  end

  def progress
    100 - pct_remaining
  end

  def remaining_units
    if challenge.running? && remaining_time_in_days < 1
      "Ending"
    else
      nil
    end
  end

  def remaining_text
    if challenge.running?
      if remaining_time_in_days > 0
        "#{pluralize(remaining_time_in_days,'day')} left"
      elsif remaining_time_in_hours > 0
        "#{pluralize(remaining_time_in_hours,'hour')} left (#{ending_time})"
      elsif remaining_time_in_seconds > 0
        ending_time
      end
    else
      challenge.status.to_s.humanize
    end
  end

  def organizer_view
    case challenge.id
    when 31
      render 'nips-2018-ai-for-prosthetics-challenge'
    when 28, 39, 40
      render 'nips-2018-adversarial-vision-challenge'
    else
      render 'organizer_view'
    end
  end

end
