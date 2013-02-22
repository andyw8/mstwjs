class AutocompleteSelector
  constructor: (options) ->
    @domParent = options.parentSelector
    @initialValue = options.initialValue
    @field = options.field
    @universe = options.dataUniverse
    $(@domParent)
      .append(@hiddenField())
      .append(@textInput())
      .append(@addButton())

  determineId: (suffix) ->
    id = @field.replace("][", "_").replace("[", "").replace("]", "")
    id = id + "_" + suffix if suffix
    id

  hiddenField: ->
    $("<input type='hidden'/>")
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

$ ->
  window.AutocompleteSelector = AutocompleteSelector
