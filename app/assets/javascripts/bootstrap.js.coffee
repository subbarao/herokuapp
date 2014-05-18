jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $('#tabs a').click (e) ->
    e.preventDefault()
    $(this).tab('show')

  $('.dropdown-toggle').dropdown()
  $("#tabs li:eq(1) a").tab('show')
