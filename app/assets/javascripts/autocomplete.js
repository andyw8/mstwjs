var initializeAutoCompleteSelector = function (options) {
  var $parent = $(options.parentSelector);
  var field = options.field;
  var id = field.replace("][", "_").replace("[", "").replace("]", "");
  var input = $("<input type='hidden'/>)")
    .attr({"id": id, "name": field})
    .val(options.initialValue);
  $parent.append(input);
};

// as a quick hacky way of getting the tests running, I'm trying to make the above method
// available globally so that the spec can see it. but why is this failing?
window.initializeAutocompleteSelector = initializeAutocompleteSelector;
