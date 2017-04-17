module.exports =
class StatusBarManager
  constructor: ->
    @span = document.createElement("span")

    @element = document.createElement("div")
    @element.id = 'status-bar-quick-highlight'
    @element.className = 'block'
    @element.appendChild @span

    @container = document.createElement("div")
    @container.className = "inline-block"
    @container.appendChild @element

  initialize: (@statusBar) ->

  update: (count) ->
    if @tile
      @span.className = atom.config.get('quick-highlight.countDisplayStyles')
      @span.textContent = count
      @element.style.display = 'inline-block'
    else
      @tile = @attach() if @statusBar

  clear: ->
    @element.style.display = 'none'

  attach: ->
    displayPosition = atom.config.get('quick-highlight.countDisplayPosition')
    displayPriority = atom.config.get('quick-highlight.countDisplayPriority')

    return @statusBar["add#{displayPosition}Tile"](item: @container, priority: displayPriority)

  detach: ->
    @tile?.destroy()
