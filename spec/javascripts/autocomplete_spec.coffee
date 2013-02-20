describe "Autocomplete widget", ->
  beforeEach ->
    affix "form div#autodiv"
    autocompleteData =
      1: "Alpha"
      2: "Beta"
      3: "Gamma"
      4: "Delta"
    initializeAutoCompleteSelector
      parentSelector: "#autodiv"
      field: "[user][activity_ids]"
      initialValue: "1,3"
      dataUniverse: autocompleteData


  describe "sets up expected hidden element", ->
    beforeEach ->
      @hiddenField = $("#autodiv #user_activity_ids")

    it "gives the hidden field the correct type", ->
      expect(@hiddenField).toHaveAttr "type", "hidden"

    it "gives the hidden field the correct name", ->
      expect(@hiddenField).toHaveAttr "name", "[user][activity_ids]"

    it "gives the hidden field the correct value", ->
      expect(@hiddenField).toHaveAttr "value", "1,3"
