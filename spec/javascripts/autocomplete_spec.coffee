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

  describe "sets up a list of known values", ->
    beforeEach ->
      @ul = $("#autodiv #user_activity_ids_list")

    it "sets up expected elements", ->
      expect(@ul.find("#user_activity_ids_element_1")).toHaveText "Alpha Delete"
      expect(@ul.find("#user_activity_ids_element_1 .delete-button")).toExist()
      expect(@ul.find("#user_activity_ids_element_3")).toHaveText "Gamma Delete"
      expect(@ul.find("#user_activity_ids_element_3 .delete-button")).toExist()

    it "does not set up missing elements", ->
      expect(@ul.find("#user_activity_ids_element_2")).not.toExist()

  describe "adds an element when clicked", ->
    beforeEach ->
      @inputElement = $("#autodiv #user_activity_ids_autocomplete")
      @addButton = $("#autodiv a#user_activity_ids_add_button")
      @inputElement.val 'Beta'
      @addButton.click()
      @ul = $("#autodiv #user_activity_ids_list")

    it "increases the size of the list", ->
      expect($("#autodiv ul li").size()).toEqual 3

    it "gives the new element the expected text", ->
      expect(this.ul.find("#user_activity_ids_element_2")).toHaveText "Beta Delete"

    it "gives the new element a delete button", ->
      expect(this.ul.find("#user_activity_ids_element_2 .delete-button")).toExist()

    it "updates the value of the hidden field", ->
      hiddenField = $("#autodiv #user_activity_ids")
      expect(hiddenField).toHaveAttr "value", "1,3,2"

