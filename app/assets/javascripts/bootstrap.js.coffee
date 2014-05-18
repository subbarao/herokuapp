jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $('#tabs a').click (e) ->
    e.preventDefault()
    $(this).tab('show')

  $('.dropdown-toggle').dropdown()
  $("#tabs a[href][data-toggle='tab']:first").tab('show')
