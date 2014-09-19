ready = ->
  $('.datepicker').['datepicker']({format: 'yyyy-mm-dd'})

  $('[data-spy=scroll]').each ->
    $(this)['scrollspy']({ target: $(this).attr('data-target') })

  $('[data-spy=affix]').each ->
    $(this)['affix'](
      offset:
        top: $(this).attr('data-offset-top')
        bottom: $(this).attr('data-offset-bottom')
  )

# initializer
$(document)['ready'](ready)

# deal with turbolinks
$(document)['on']( 'page:load', ready )
