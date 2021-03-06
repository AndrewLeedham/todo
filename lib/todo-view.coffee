module.exports =
class TodoView
  constructor: (serializedState) ->
    @element = document.createElement 'todo'

    header = document.createElement 'h1'
    header.textContent = 'TODO'

    @itemContainer = document.createElement 'item-container'

    @element.appendChild header
    @element.appendChild this.createControls()
    @element.appendChild @itemContainer

  createControls: () ->
    controls = document.createElement 'controls'
    controls.classList.add 'block'

    refresh = document.createElement 'button'
    refresh.textContent = 'refresh'
    refresh.classList.add 'btn'

    refresh.addEventListener 'click', () ->
      atom.emitter.emit 'todo:refresh'

    controls.appendChild refresh

    return controls

  emptyItems: () ->
    while child = @itemContainer.lastChild
      @itemContainer.removeChild child

  renderItems: (items) =>
    @emptyItems()
    @addItem item for item in items

  addItem: (item) ->
    todoItem = document.createElement 'todo-item'
    todoItem.appendChild @createSection item
    todoItem.appendChild @addTodoText(todoMatch, item) for todoMatch in item.matches

    @itemContainer.appendChild todoItem

  clipText: (text) ->
    max = atom.config.get('todo.d_maxLength')
    if text.length > max
      return text.substring(0, max-3) + "..."
    else
      return text

  createSection: (item) ->
    todoSection = document.createElement 'todo-section'
    # TODO: make this less rigid, so it can work on single files
    text = item.filePath.match new RegExp(atom.config.get('todo.e_sectionTitlePattern'))
    if text != null
      todoSection.textContent = @clipText(text)
    else
      todoSection.textContent = @clipText(item.filePath)
    todoSection.setAttribute 'title', item.filePath
    todoSection.classList.add 'text-subtle'
    return todoSection

  addTodoText: (todoMatch, item) ->
    me = this
    todoText = document.createElement 'todo-text'
    todoText.textContent = @clipText(todoMatch.matchText)
    todoText.setAttribute 'title', todoMatch.matchText
    todoText.addEventListener 'click', () ->
      me.onItemClick todoMatch, item

    return todoText

  onItemClick: (item, section) ->
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
