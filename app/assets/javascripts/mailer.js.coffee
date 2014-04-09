$(document).ready ->
  # TODO - Clean/Refactor this script (use a hash and a time for the id instead of the array and email name)
  # FIX NAMES!!!! AND ADD MORE COMMENTS
  mailerMenu = $("#cbp-spmenu")
  mailerList = $("#mailer-list")
  mailToPrefixId = "mailer-index-"

  mailListKey = "emailList"
  mailDataId = "email"

  mailerButton = "#showRight"
  mailToClass = ".mailto"
  mailRemove = "mailto-remove"
  mailComposeButton = "compose-email-link"
  mailComposeModal = "composeEmailModal"
  mailComposeForm = "composeEmailForm"
  openSideBar = "cbp-spmenu-open"

  removeButtonHtml = "<i class=\"fa fa-times #{mailRemove}\"></i>"

  # Mailer Actions/Events for sideBar

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
    mailerRemoveFromList($(this).parent().data(mailDataId))

  # Email Modal Composition js
  # TODO - Move to another js file for better organization + better UI design needed

  # Init Modal - User must click on the x or cancel to close the modal
  $(document).on "click", "##{mailComposeButton}", (event) ->
    mailerMenu.removeClass("#{openSideBar}")
    $("##{mailComposeModal}").modal(
        backdrop: 'static',
        keyboard: false)

  # On show add the emails from the email list to the to field and handle
  $("##{mailComposeModal}").on 'show.bs.modal', (event) ->
    emails = getEmails()
    if emails != null and emails.length
      $(this).find("#email_to").val(emails)

  #delete all input data on close, cancel
  $("##{mailComposeModal}").on 'hidden.bs.modal', (event) ->
    $("##{mailComposeForm}").trigger("reset")

  # On submit hide modal, clear mail list, remove sessionStore, close sidebar
  # and clear modal inputs
  $("##{mailComposeForm}").on 'submit', (event) ->
    sessionStorage.removeItem(mailListKey)
    mailerMenu.removeClass("#{openSideBar}")
    mailerList.empty()
    $("##{mailComposeModal}").modal('hide')

  # Functions for mailer

  mailerAddToList = (email) ->
    emails = getEmails()
    emails = [] if emails == null
    emails.push(email)
    sessionStorage.setItem(mailListKey, JSON.stringify(emails))
    id = email.replace(/[^a-zA-Z0-9]+/g,'') # Make an ID out of the email excluding special chars
    mailerList.append("<li id=\"#{id}\" data-#{mailDataId}=\"#{email}\">#{email}#{removeButtonHtml}</li>")
    mailerAlert(email)

  mailerAlert = (email) ->
    mailerMenu.addClass("#{openSideBar}")
    id = email.replace(/[^a-zA-Z0-9]+/g,'')
    emailItem = mailerList.find("##{id}")
    # TODO finish the animation

  mailerRemoveFromList = (email) ->
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
        id = email.replace(/[^a-zA-Z0-9]+/g,'')
        mailerList.append("<li id=\"#{id}\" data-#{mailDataId}=\"#{email}\">#{email}#{removeButtonHtml}</li>")
      mailerMenu.addClass("#{openSideBar}")

  getEmails = ->
    JSON.parse(sessionStorage.getItem(mailListKey))

