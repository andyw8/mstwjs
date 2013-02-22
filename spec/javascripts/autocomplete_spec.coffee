describe "Autocomplete widget", ->
  beforeEach ->
    affix "form div#autodiv"
    autocompleteSelector = new AutocompleteSelector
      parentSelector: "#autodiv"
      field: "[user][activity_ids]"
      universe:
        1: "Alpha"
        2: "Beta"
        3: "Gamma"
        4: "Delta"
      initialValue: "1,3"

  describe "sets up expected hidden element", ->
    beforeEach ->
      @hiddenField = $("#autodiv #user_activity_ids")

    it "gives the hidden field the correct type", ->
      expect(@hiddenField).toHaveAttr "type", "hidden"

    it "gives the hidden field the correct name", ->
      expect(@hiddenField).toHaveAttr "name", "[user][activity_ids]"

    it "gives the hidden field the correct value", ->
      expect(@hiddenField).toHaveAttr "value", "1,3"

    it "gives the input element an add button", ->
      addButton = $('#autodiv a#user_activity_ids_add_button')
      expect(addButton).toHaveClass('selector_add_button')
