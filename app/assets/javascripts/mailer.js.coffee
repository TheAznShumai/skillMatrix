$(document).ready ->
  # TODO - Clean/Refacotor this script
  mailerMenu = $("#cbp-spmenu")
  mailerList = $("#mailer-list")
  mailToPrefixId = "mailer-index-"

  mailListKey = "emailList"
  mailDataId = "email"

  mailerButton = "#showRight"
  mailToClass = ".mailto"
  mailRemove = "mailto-remove"
  openSideBar = "cbp-spmenu-open"

  removeButtonHtml = "<i class=\"fa fa-times #{mailRemove}\"></i>"

  # Mailer Actions/Events

  $ ->
    mailerSideBarInit()

  $(document).on "click", mailerButton, (event) ->
    mailerMenu.toggleClass("#{openSideBar}")

  $(document).mouseup (event) ->
    if not mailerMenu.is(event.target) and mailerMenu.has(event.target).length is 0 and not $(mailerButton).is(event.target) and not $(mailToClass).is(event.target)
      mailerMenu.removeClass("#{openSideBar}")      # Only slide back when doesn't click on the side bar or the mailto link/button

  $(document).on "click", mailToClass, (event) ->
    email = $(this).data(mailDataId)
    emails = getEmails()
    if emails is null || emails.length == 0
      mailerAddToList(email)
    else
      index = $.inArray(email, emails)
      if index != -1
        mailerAlert(email)
      else
        mailerAddToList(email, emails)

  $(document).on "click", ".#{mailRemove}", (event) ->
    debugger
    mailerRemoveFromList($(this).parent().data(mailDataId))

  # Functions for mailer

  mailerAddToList = (email) ->
    emails = getEmails()
    emails = [] if emails == null
    emails.push(email)
    sessionStorage.setItem(mailListKey, JSON.stringify(emails))
    id = email.replace(/[^a-zA-Z0-9]+/g,'') # Make an Id out of the email excluding special chars
    mailerList.append("<li id=\"#{id}\" data-#{mailDataId}=\"#{email}\">#{email}#{removeButtonHtml}</li>")
    mailerAlert(email)

  mailerAlert = (email) ->
    mailerMenu.addClass("#{openSideBar}")
    id = email.replace(/[^a-zA-Z0-9]+/g,'')
    emailItem = mailerList.find("##{id}")
    # TODO finish the animation

  mailerRemoveFromList = (email) ->
    debugger
    emails = getEmails()
    index = $.inArray(email, emails)
    if index != -1
      emails.splice(index, 1)
      id = email.replace(/[^a-zA-Z0-9]+/g,'')
      emailItem = mailerList.find("##{id}")
      # TODO Animate removal - slide right then collaspe then kill
      emailItem.remove()
      sessionStorage.setItem(mailListKey, JSON.stringify(emails))

  mailerSideBarInit = ->
    emails = getEmails()
    if emails != null and emails.length > 0
      for email, index in emails
        id = email.replace(/[^a-zA-Z0-9]+/g,'') #Remove special characters for the ID
        mailerList.append("<li id=\"#{id}\" data-#{mailDataId}=\"#{email}\">#{email}#{removeButtonHtml}</li>")
      mailerMenu.addClass("#{openSideBar}")

  getEmails = ->
    JSON.parse(sessionStorage.getItem(mailListKey))

