$(document).ready ->
  navmenu = $("#cbp-spmenu")
  navbutton = $("#showRight")

  $(document).on "click", ("#showRight"), (event) ->
    navmenu.toggleClass("cbp-spmenu-open")

  $(document).mouseup (event) ->
    if not navmenu.is(event.target) and navmenu.has(event.target).length is 0 and not navbutton.is(event.target)
      navmenu.removeClass("cbp-spmenu-open") # Only slide back when doesn't click on the side bar

