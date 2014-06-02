# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Country Collection', ->
  beforeEach ->
    @CountryCollection = new Peacecorps.Collections.Country()
