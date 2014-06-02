'use strict';

class Peacecorps.Collections.Country extends Backbone.Collection
  model: Peacecorps.Models.Country

  forNames: (names)->
    @filter (country)->
      _.contains(names, country.get('name'))

  forIds: (ids) ->
    @filter (country)->
      _.contains(ids, country.get('id'))
