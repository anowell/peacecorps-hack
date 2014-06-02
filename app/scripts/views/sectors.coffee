'use strict';

class Peacecorps.Views.Sectors extends Backbone.View

  template: JST['app/scripts/templates/sectors.ejs']

  el: '#sectors-pane'
  tagName: 'div'
  id: ''
  className: ''

  events:
    'click .tile': 'toggleSector'
    'click .next': 'next'

  initialize: () ->
    @listenTo @collection, 'sync', @render

  next: () ->
    $('html, body').animate({
        scrollTop: $("#opps-pane").offset().top-50
    }, 1000);


  render: () ->
    @$el.html @template
      sectors: @collection.sectors

  toggleSector: (evt)->
    $(evt.currentTarget).toggleClass('selected')
    @trigger('selectionChange')
