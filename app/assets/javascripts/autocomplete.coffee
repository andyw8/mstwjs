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
    $("#" + @determineId("add_button")).click(this.addEventHandler)

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

  textInput: ->
    $("<input type='text'/>")
      .attr("id", @determineId("autocomplete"))
      .attr("name", @field + "[autocomplete]")

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

$ ->
  window.AutocompleteSelector = AutocompleteSelector
