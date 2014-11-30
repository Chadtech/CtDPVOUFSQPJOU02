Note = require './Note'
React = require 'react'
_ = require 'lodash'

{a, div, input, pre, span} = React.DOM

VoiceClass = React.createClass
  onNoteUpdate: (beatIndex, value) ->
    @props.onVoiceUpdate @props.voiceName, beatIndex, value

  render: ->
    div {},
      div {}, @props.voiceName
      div {className: 'voice'}, _.map @props.beats, (properties, beatIndex) =>
        Note
          key: @props.voiceName + beatIndex + @props.property
          beatIndex: beatIndex
          property: properties?[@props.property] ? 'x'
          onNoteUpdate: @onNoteUpdate
      
Voice = React.createFactory VoiceClass

module.exports = Voice