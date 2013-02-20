initializeAutoCompleteSelector = (options) ->
  $parent = $(options.parentSelector)
  field = options.field
  id = field.replace("][", "_").replace("[", "").replace("]", "")
  input = $("<input type='hidden'/>)")
    .attr({"id": id, "name": field})
    .val(options.initialValue)
  $parent.append(input)

window.initializeAutoCompleteSelector = initializeAutoCompleteSelector