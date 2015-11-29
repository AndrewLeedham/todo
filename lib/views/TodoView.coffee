EasyView = require './EasyView'
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

  emptyItems: () ->
    $('item-container', @element).empty()

  renderItems: (items) =>
    @emptyItems()
    @addItem item for item in items

  addItem: (item) ->
    itemView = new Item($('item-container', @element).get(0))

  addTodoText: (todoMatch, item) ->
    me = this
    todoText = document.createElement 'todo-text'
    todoText.textContent = todoMatch.matchText
    # todoText.addEventListener 'click', () ->
    #   me.onItemClick todoMatch, item

    return todoText

  onItemClick: (item, section) ->
    console.log 'onItemClick'
    atom.workspace.open section.filePath, {
      initialLine: item.range[0][0]
      initialColumn: item.range[0][1]
    }

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
