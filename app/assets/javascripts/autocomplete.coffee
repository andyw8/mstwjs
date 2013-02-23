class AutocompleteSelector
  constructor: (options) ->
    @domParent = options.parentSelector
    @initialValue = options.initialValue
    @field = options.field
    @universe = options.universe
    $(@domParent)
      .append(@hiddenField())
      .append(@textInput())
      .append(@addButton())
      .append(@valueList())
    $(".delete-button").click @deleteEventHandler
    $(@domParent).on "click", "#" + @determineId("add_button"), @addEventHandler
    $(@domParent).on "click", ".delete-button", @deleteEventHandler

  determineId: (suffix) ->
    id = @field
      .replace("][", "_")
      .replace("[", "")
      .replace("]", "")
    id = id + "_" + suffix if suffix
    id

  hiddenField: ->
    $("<input type='hidden'/>") # don't set IE using attr due to IE issues
      .attr("id", @determineId())
      .attr("name", @field)
      .val(@initialValue)

  addButton: ->
    $("<a href='#'>")
      .attr("id", @determineId("add_button"))
      .html("Add")
      .addClass('selector_add_button')

  listElement: (value) ->
    $li = $("<li>")
      .attr("id", @determineId("element_" + value))
      .text(@universe[value]);
    $a = $("<a href='#'>").addClass("delete-button")
      .attr("id", @determineId("delete_" + value))
    $a.text("Delete")
    $li.append $a
    $a.before " "
    $li

  valueList: ->
    $ul = $('<ul>').attr 'id', @determineId('list')
    $.each(@initialValue.split(","), (index, value) =>
      if value.length > 0
        $ul.append @listElement(value)
    )
    $ul

  idLookup: (needle) ->
    for id, itemName of @universe
      return id if itemName is needle
    null

  addEventHandler: (event) =>
    newItemName = $('#' + @determineId("autocomplete")).val()
    newItemId = @idLookup(newItemName)
    return if not newItemId
    hiddenField = $('#' + @determineId())
    hiddenField.val hiddenField.val() + "," + newItemId
    list = $("#" + @determineId("list"))
    list.append @listElement(newItemId)
    $autocomplete = $('#' + @determineId("autocomplete"))
    $autocomplete.val ""
    $autocomplete.focus()
    event.preventDefault()

  deleteEventHandler: (event) =>
    idToDelete = $(event.target).attr('id').split("_").pop()
    hiddenField = $('#' + @determineId())
    existingIds = hiddenField.val().split(",")
    indexToRemove = existingIds.indexOf idToDelete
    if indexToRemove != -1
      existingIds.splice(indexToRemove, 1)
      hiddenField.val(existingIds.join(","))
    $(event.target).closest("li").remove()
    event.preventDefault()

  universeValues: ->
    result = []
    result.push(property) for id, property of @universe
    result

  textInput: ->
    input = $("<input type='text'/>")
      .attr("id", @determineId("autocomplete"))
      .attr("name", @field + "[autocomplete]")
    # we aren't really testing this :(
    input.autocomplete({source: @universeValues()})
    input

$ ->
  window.AutocompleteSelector = AutocompleteSelector
