ready = ->
  $('.datepicker').datepicker({format: 'yyyy-mm-dd'})

$(document).ready ready
$(document).on 'page:load', ready
