module ApplicationHelper

  def rewrite_type(key)
    case key
      when 'notice'
        'success'
      when 'success'
        'success'
      when 'info'
        'info'
      when 'alert'
        'warning'
      when 'error'
        'warning'
      when 'flash'
        'flash'
    end
  end

  def body_id
    if (controller.controller_name == 'landing_page' &&
          controller.action_name == 'index') ||
       (controller.controller_name == 'blogs' &&
          controller.action_name == 'index')
      return 'home'
    else
      return nil
    end
  end

  def footer_class
    if controller.controller_name == 'registrations' ||
       (controller.controller_name == 'challenges' && controller.action_name == 'edit') ||
       (controller.controller_name == 'organizers' && controller.action_name == 'edit') ||
       (controller.controller_name == 'sessions')
          return "class='no-margin-top'"
    else
      return nil
    end
  end

end
