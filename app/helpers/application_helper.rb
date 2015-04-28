module ApplicationHelper
  def sticky?(jot)
    if jot.sticky == true
      return 'sticky'
    else
      return nil
    end
  end

  def sticky_pushpin(jot)
    if jot.sticky == true
      return "glyphicon glyphicon-pushpin"
    else
      return nil
    end
  end


end
