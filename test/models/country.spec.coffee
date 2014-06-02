# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Country Model', ->
  beforeEach ->
    @CountryModel = new Peacecorps.Models.Country();
