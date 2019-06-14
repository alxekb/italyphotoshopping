module ProfileHelper

  def full_name
    @profile.name + " " + @profile.second_name + " " + @profile.surname
  end

  def contacts
    @profile.phone + ' ' + @profile.email
  end

  def set_iso_code
    [
      ['Russia', 643]
    ]
  end

end
