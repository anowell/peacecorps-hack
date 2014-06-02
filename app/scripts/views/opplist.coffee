'use strict';

class Peacecorps.Views.OppList extends Backbone.View

  template: JST['app/scripts/templates/opplist.ejs']

  el: '#opps-pane'
  tagName: 'div'
  id: ''
  className: ''

  events:
    'click .tile': 'view'

  initialize: (options) ->
    @mapView = options.mapView
    @sectorsView = options.sectorsView

    @listenTo @mapView, 'selectionChange', @render
    @listenTo @sectorsView, 'selectionChange', @render
    @listenTo @collection, 'sync', @render

  view: () ->
    console.log 'what is up'
    alert('TODO: show all details about specific opportunities')

  render: () ->
    console.log 'Rendering opportunities'
    selectedLocations = _.map(Peacecorps.countries.forIds(@mapView.selected), (loc) ->
      loc.get('name')
    )
    console.log 'Filtering on locations: ' + selectedLocations.join(', ')

    selectedSectors = $('#sectors-pane .tile.selected h3').map( ()-> @textContent).get()
    console.log 'Filtering on sectors: ' + selectedSectors.join(', ')


    opps = @collection.filter (opp)=>
      _.contains(selectedLocations, opp.get('location')) and
      _.contains(selectedSectors, opp.get('sector'))

    @$el.html @template
      locations: selectedLocations
      sectors: selectedSectors
      opps: _.map(opps, (opp) -> opp.toJSON())
