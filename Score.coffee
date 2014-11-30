Voice = require './Voice'
React = require 'react'
_ = require 'lodash'

{a, div, input, pre, span} = React.DOM

ScoreClass = React.createClass
  onVoiceUpdate: (voiceName, beatIndex, value) ->
    score = @props.score
    unless score[voiceName]?[beatIndex]
      score[voiceName][beatIndex] = {}
    score[voiceName][beatIndex][@props.propertyList[@props.currentProperty]] = value
    @props.onScoreUpdate score

  render: ->
    console.log 'score.currentProperty', @props.propertyList[@props.currentProperty]
    div {className: 'score'}, _.map @props.score, (voice, voiceName) =>
      Voice
        key: voiceName
        voiceName: voiceName
        beats: voice
        onVoiceUpdate: @onVoiceUpdate
        property: @props.propertyList[@props.currentProperty]

Score = React.createFactory ScoreClass

module.exports = Score