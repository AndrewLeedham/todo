EasyView = require './EasyView'

module.exports =
class Item extends EasyView
  constructor: (item) ->
    # each item contains a section and a number of items
    # TODO: de-confuse these silly names

    console.log item.matches
    # todoItem.appendChild @addTodoText(todoMatch, item) for todoMatch in item.matches

    this.item = item
    # this.section = section

  template: './templates/item.html'

  addTodoText: (todoMatch, item) ->
    console.log todoMatch, item
    # me = this
    # todoText = document.createElement 'todo-text'
    # todoText.textContent = todoMatch.matchText
    # todoText.addEventListener 'click', () ->
    #   me.onItemClick todoMatch, item

  onItemClick: (element) ->

    console.log 'which item is this for?', element

    # atom.workspace.open section.filePath, {
    #   initialLine: item.range[0][0]
    #   initialColumn: item.range[0][1]
    # }
