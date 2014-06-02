'use strict';

class Peacecorps.Routers.Opp extends Backbone.Router
  routes:
    '(/)': 'index'
    ':id': 'opportunity'

  index: ->
    mapView = new Peacecorps.Views.Map(
      collection: Peacecorps.opps
    )
    sectorsView = new Peacecorps.Views.Sectors(
      collection: Peacecorps.opps
    )
    mapView.render()
    sectorsView.render()


    oppListView = new Peacecorps.Views.OppList(
      collection: Peacecorps.opps
      mapView: mapView
      sectorsView: sectorsView
    )
    oppListView.render()

  opportunity: (id)->
    # oppView = new Peacecorps.Views.Opp(
    #   model: Peacecorps.opps.findWhere(id: id)
    # )