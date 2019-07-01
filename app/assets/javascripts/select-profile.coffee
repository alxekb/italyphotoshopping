$(document).on 'ready turbolinks:load', ->
  $('select#deal_profile_id').select2
    placeholder: 'Выберите профиль'
    allowClear: true
return
