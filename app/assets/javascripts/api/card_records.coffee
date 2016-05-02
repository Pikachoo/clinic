# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


class window.Card_record
  constructor: () ->

  this.construct_card_record= (obj) ->
      keys = []
      vals = []
      for  key of obj
        if (obj.hasOwnProperty(key))
          keys.push(key)
          vals.push(obj[key])
      console.log(obj);
      return new this.card_record_struct(keys, vals);

  this.card_record_struct = (keys, vals) ->
    length = keys.length
    for value, index in keys
      switch value
        when 'name' then this.name = vals[index]
        when 'id' then this.id = vals[index]
        when 'add_date' then this.add_date = vals[index]
        when 'treatment' then this.treatment = vals[index]
        when 'symptoms' then this.symptoms = vals[index]
        when 'diagnosis' then this.diagnosis = vals[index]
        else  break
    console.log(this)
    return this;
