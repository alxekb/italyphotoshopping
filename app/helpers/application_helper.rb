module ApplicationHelper
  def wa_message(phone, message)
    "https://api.whatsapp.com/send?phone=#{phone}&text=#{message}&source=&data="
  end
end
