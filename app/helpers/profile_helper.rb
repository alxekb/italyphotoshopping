# frozen_string_literal: true

module ProfileHelper
  def contacts
    @profile.phone + ' ' + @profile.email
  end

  def set_iso_code
    [
      ['Russia', 643]
    ]
  end

  def profile_data(profile)
    profile = Profile.find_by(id: profile)
    p = [profile.name, profile.second_name, profile.surname].join(' ')
  end

  def profile_for_partial(id)
    @profile = Profile.find_by(id: id)
  end
end
