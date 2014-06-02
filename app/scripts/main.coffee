window.Peacecorps =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    # Let's bootstrap some data async
    Peacecorps.opps = new Peacecorps.Collections.Opp
    Peacecorps.opps.fetch
     error: (collection, response, options) ->
      console.log("Error fetching #{collection.url}")
     success: (collection, response, options) ->
      console.log("Fetched #{collection.url}")

    # A bit ugly, but let's borrow country codes from Datamap
    Peacecorps.countries = new Peacecorps.Collections.Country(
      _.map(Datamap.prototype.worldTopo.objects.world.geometries, (c) ->
        id: c.id
        name: c.properties.name
      )
    )

    # Lets initialize a router
    Peacecorps.router = new Peacecorps.Routers.Opp
    Backbone.history.start();

$ ->
  'use strict'
  Peacecorps.init();
