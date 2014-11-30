React = require 'react'
_ = require 'lodash'

{a, div, input, pre, span} = React.DOM

NoteClass = React.createClass
  getInitialState: ->
    noteValue: @props.property

  setNoteValue: (event) ->
    @setState noteValue: event.target.value
    @props.onNoteUpdate @props.beatIndex, event.target.value

  render: ->
    span {},
      span {}, @props.beatIndex
      input 
        value: @state.noteValue
        onChange: @setNoteValue

Note = React.createFactory NoteClass

module.exports = Note