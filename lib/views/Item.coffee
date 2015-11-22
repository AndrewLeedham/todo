{View} = require 'atom-space-pen-views'

module.exports =
class Item extends View
  @content: ->
    @tag 'item', =>
      @div 'todo text here'
