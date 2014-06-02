'use strict';

class Peacecorps.Collections.Opp extends Backbone.Collection
  model: Peacecorps.Models.Opp
  url: 'pc.json'

  initialize: ->
    @locations = []
    @locationIds = []
    @sectors = []
    this.on('sync', ()-> @locations = @getLocations())
    this.on('sync', ()-> @locationIds = @getLocationIds())
    this.on('sync', ()-> @sectors = @getSectors())

  getLocations: () ->
    _.reject(_.uniq(@pluck('location')).sort(), (val) ->
      val == null or val == ''
    )

  getLocationIds: () ->
    _.pluck(Peacecorps.countries.forNames(@locations), 'id')

  getSectors: () ->
    _.reject(_.uniq(@pluck('sector')).sort(), (val) ->
      val == null or val == ''
    )
