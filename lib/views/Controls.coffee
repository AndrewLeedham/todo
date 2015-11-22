{$, View} = require 'atom-space-pen-views'

module.exports =
class Controls extends View
  constructor: (options) ->
    this.onRefresh = options.onRefresh
    super()

  @content: ->
    @tag 'controls', class: 'block', =>
      @button class: 'btn', click: 'onRefresh', 'refresh'
