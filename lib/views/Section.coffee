{View} = require 'atom-space-pen-views'
Item = require './Item'

module.exports =
class Section extends View
  @content: ->
    @div =>
      @tag 'section', class: 'text-subtle', 'file path here'
      @subview 'item', new Item()
