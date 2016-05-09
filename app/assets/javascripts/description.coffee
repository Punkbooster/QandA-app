$(document).on 'page:change', ->
  $('#description-link').click (event)->
    event.preventDefault()
    $('#description').fadeToggle()
    # $('#question_content').focus()
