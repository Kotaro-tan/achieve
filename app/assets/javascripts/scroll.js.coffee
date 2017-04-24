window.archive = window.archive || {};

# module.exportsに変更したい
class window.archive.Scroll
    constructor: (el) ->
        @$el = $(el)
        @$btn = @$el.find('.js-scroll')
        @removeEvent()
        @addEvent()
        
    isVisible: ->
        @$el.is(':visible')
        
    show: ->
        @$el.fadeIn('fast')
      
    hide: ->
        @$el.fadeOut('fast')
        
    onPageTop: (e) =>
        e.preventDefault();
        $target = $(e.target)
        href = $target.attr('href')
        $scrollTarget = $(if href == '#' or href == '' then 'html, body' else href)
        $scrollTarget.velocity 'scroll', { duration: 200, easing: 'ease' }
        
    addEvent: ->
        @$btn.on 'click', @onPageTop
        
    removeEvent: ->
        @$btn.off 'click'
