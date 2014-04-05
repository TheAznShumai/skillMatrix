$(document).ready ->
  mailerMenu = $("#cbp-spmenu")
  mailerList = $("#mailer-list")
  mailerButton = $("#showRight")
  mailToClass = $("mailto")
  mailToPrefixId = "mailer-index-"
  mailListKey = "emailList"
  mailDataId = "email"

  $ ->
    mailerSideBarInit()

  $(document).on "click", ("#showRight"), (event) ->
    mailerMenu.toggleClass("cbp-spmenu-open")

  $(document).mouseup (event) ->
    if not mailerMenu.is(event.target) and mailerMenu.has(event.target).length is 0 and not mailerButton.is(event.target) and not mailToClass.is(event.target)
      mailerMenu.removeClass("cbp-spmenu-open") # Only slide back when doesn't click on the side bar or the mailto button

  $(document).on "click", (".mailto"), (event) ->
    email = $(this).data(mailDataId)
    emails = getEmails()
    if emails is null
      emails= []
      mailerAddToList(email, emails, "#{mailToPrefixId}0") #Add initalizer in mailerAddToList
    else
      index = $.inArray(email, emails)
      if index != -1
        mailerAlert(email, "#{mailToPrefixId}index")
      else
        mailerAddToList(email, emails, "#{mailToPrefixId}index")

  mailerAddToList = (email, emails, selector) ->
    emails.push(email)
    sessionStorage.setItem(mailListKey, JSON.stringify(emails))
    mailerList.append("<a href=\"#\" id=\"#{selector}\">#{email}</a>")
    mailerAlert(email, selector)

  mailerAlert = (email, selector) ->
    mailerMenu.addClass("cbp-spmenu-open")
    # anchor animation in the component css select the id !!!!
    debugger

  mailerRemoveFromList = (email) ->
    index = $.inArray(email, getEmails())
    # TODO finish me

  # TODO init me on load - load the bar with the damn data
  mailerSideBarInit = ->
    debugger
    emails = getEmails()
    if emails != null
      for email, index in emails
        mailerList.append("<a href=\"#\" id=\"#{index}\">#{email}</a>")
      mailerMenu.addClass("cbp-spmenu-open")

  getEmails = ->
    JSON.parse(sessionStorage.getItem(mailListKey))

