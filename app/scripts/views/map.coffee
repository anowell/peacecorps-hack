'use strict';

class Peacecorps.Views.Map extends Backbone.View

  template: JST['app/scripts/templates/map.ejs']

  el: '#map-pane'
  tagName: 'div'
  id: ''
  className: ''

  events:
    'click h1': 'updateMap'
    'click .next': 'next'

  initialize: () ->
    @listenTo @collection, 'sync', @render

  next: () ->
    $('html, body').animate({
        scrollTop: $("#sectors-pane").offset().top-50
    }, 1000);


  render: () ->
    @$el.html @template
      count: @collection.length
      locations: @collection.locations

    fillData = { fillKey: 'hasOpportunity' }
    mapData = {}
    _.each(@collection.locations, (loc) ->
      country = Peacecorps.countries.findWhere({name: loc})
      if country
        mapData[country.get('id')] = fillData
      else
        console.log 'Unable to plot ' + loc + ' on the map.'
    )

    # Set map dimensions to a reasonable ratio
    w = @$el.find('#map').width()
    @$el.find('#map').height(w * 0.38)
    that = this
    @map = new Datamap
      element: document.getElementById("map")
      # projection: 'mercator'
      done: (datamap) ->
        datamap.svg.selectAll('.datamaps-subunit').on('click', (geography) ->
            console.log geography
            that.toggleCountry(geography.id, this)
        )
      fills:
        defaultFill: '#d3d3d3',
        hasOpportunity: '#2672ec'
        selected: '#00A600'
      data: mapData
      # geographyConfig:
      #   highlightOnHover: false
        # highlightFillColor: '#125acd'
        # highlightBorderColor: '#fff'
        # highlightBorderWidth: 1

  selected: []

  toggleCountry: (id, context) ->
    return unless _.contains(@collection.locationIds, id)

    # Hack Datamaps to not revert color after mouseout
    if context
      element = d3.select(context);
      element.attr('data-previousAttributes', '{}')

    # Now lets actually toggle country style
    fillData = {}
    if _.contains(@selected, id)
      @selected = _.without(@selected, id)
      fillData[id] = {fillKey: 'hasOpportunity'}
    else
      @selected.push(id)
      fillData[id] = {fillKey: 'selected'}

    @trigger('selectionChange')
    @map.updateChoropleth(fillData)