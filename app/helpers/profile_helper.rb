module ProfileHelper

  def full_name
    @profile.name + " " + @profile.second_name + " " + @profile.surname
  end

end
