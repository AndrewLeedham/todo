EasyView = require 'easy-view'
$ = require 'jquery'
Item = require './Item'

module.exports =
class Todo extends EasyView
  constructor: (serializedState) ->
    @element = document.createElement 'todo'
    super(@element)

  template: './templates/todo.html'

  onRefreshClick: () ->
    atom.emitter.emit 'todo:refresh'

  onCloseClick: (element) ->
    console.log 'Uhh...?'
    atom.emitter.emit 'todo:toggle'

  renderItems: (items) =>
    @emptyItems()
    @addItem item for item in items

  emptyItems: () ->
    $('item-container', @element).empty()

  addItem: (item) ->
    itemView = new Item(item)
    container = $('item-container', @element).get(0)
    itemView.render(container)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
