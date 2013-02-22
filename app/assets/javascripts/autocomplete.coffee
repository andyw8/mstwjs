initializeTextInput = (options) ->
  $parent = $(options.parentSelector)
  field = options.field
  id = field.replace("][", "_").replace("[", "").replace("]", "")
  input = $("<input type='text'/>")
    .attr({"id": id + "_autocomplete", "name": field + "[autocomplete]"})
  $parent.append input
  add_button = $("<a href='#'>")
      .attr("id", id + "_add_button")
      .html("Add")
      .addClass('selector_add_button')
  $parent.append add_button

initializeHiddenField = (options) ->
  $parent = $(options.parentSelector)
  field = options.field
  id = field.replace("][", "_").replace("[", "").replace("]", "")
  # we avoid using the attr method to set the type as it doesn't work in all IE versions
  input = $("<input type='hidden'/>)")
    .attr({"id": id, "name": field})
    .val(options.initialValue)
  $parent.append input

initializeAutocompleteSelector = (options) ->
  initializeHiddenField options
  initializeTextInput options

window.initializeAutocompleteSelector = initializeAutocompleteSelector
