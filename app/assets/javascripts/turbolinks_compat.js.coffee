#
# Resolves compatibility between Turbolinks and 3p libs & plugins
#

# Twitter Bootstrap components
turboBootstrap = ->
  $('[data-spy=scroll]').each ->
    $(this).scrollspy({ target: $(this).attr('data-target') })
    console.log('init scroll')

  $('[data-spy=affix]').each ->
    $(this).affix
      offset:
        top: $(this).attr('data-offset-top')
        bottom: $(this).attr('data-offset-bottom')

ready = ->
  $('.datepicker').datepicker({format: 'yyyy-mm-dd'})
  turboBootstrap()

$(document).on 'ready page:load page:change', ready