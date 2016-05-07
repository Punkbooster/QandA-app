$(document).on 'page:change', ->
  $('#description-link').click ->
    $('#description').fadeToggle()
    # $('#question_content').focus()
