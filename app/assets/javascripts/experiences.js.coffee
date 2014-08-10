
$('#skill_name_form').autocomplete
  source: (request, response) ->
    $.ajax
      url: '/experiences/search'
      dataType: 'jsonp'
      data:
        q: request.param

  minLength: 3

  success: (data) ->
    response(data)

  select: -> alert('select')