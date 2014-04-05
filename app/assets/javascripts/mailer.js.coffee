$(document).ready ->
  mailerMenu = $("#cbp-spmenu")
  mailerList = $("#mailer-list")
  mailerButton = $("#showRight")
  mailToClass = $("mailto")

  $(document).on "click", ("#showRight"), (event) ->
    mailerMenu.toggleClass("cbp-spmenu-open")

  $(document).mouseup (event) ->
    if not mailerMenu.is(event.target) and mailerMenu.has(event.target).length is 0 and not mailerButton.is(event.target) and not mailToClass.is(event.target)
      mailerMenu.removeClass("cbp-spmenu-open") # Only slide back when doesn't click on the side bar or the mailto button

  $(document).on "click", (".mailto"), (event) ->
    email = $(this).data("email")
    emailList = sessionStorage.getItem("emailList")
    if emailList is null
      emailList = []
      mailerAddToList(email, emailList)
    else
      emailList = JSON.parse(emailList)
      if $.inArray(email, emailList) != -1
        mailerAlert(email)
      else
        mailerAddToList(email, emailList)

  mailerAddToList = (email, emailList) ->
    emailList.push(email)
    sessionStorage.setItem("emailList", JSON.stringify(emailList))
    mailerList.append("<a href=\"#\">#{email}</a>")
    mailerAlert(email)

  mailerAlert = (email) ->
    mailerMenu.addClass("cbp-spmenu-open")
    debugger

