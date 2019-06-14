module DealsHelper
  def profile_deals(profile)
    profile_deals = Deal.where('profile_id= ?', profile)
  end
end
