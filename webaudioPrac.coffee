React = require 'react'
_ = require 'lodash'
Score = require './Score'

{a, div, input, pre, span} = React.DOM

TempClass = React.createClass
  render: ->
    pre {}, (JSON.stringify @props.score, null, 2)

Temp = React.createFactory TempClass

score =
  voice1: [
    {amplitude: 0, tone: 400}
    {amplitude: 0.5, tone: 400}
    {amplitude: 1, tone: 400}
  ]
  voice2: [
    {amplitude: 1, tone: 600}
    {amplitude: 0.5, tone: 600}
    {amplitude: 0, tone: 600}
  ]

AppClass = React.createClass
  getInitialState: ->
    score: @props.score
    currentProperty: 0
    
  onScoreUpdate: (score) ->
    @setState score: score

  setCurrentProperty: (event) ->
    event.preventDefault()
    @setState
      currentProperty: parseInt event.target.getAttribute 'data-id'

  render: ->
    div {},
      div {}, _.map @props.propertyList, (property, id) =>
        a
          key: property
          onClick: @setCurrentProperty
          'data-id': id
          href: '#'
        , " #{property} "
      Score
        score: @state.score
        currentProperty: @state.currentProperty
        propertyList: @props.propertyList
        onScoreUpdate: @onScoreUpdate
      Temp score: @state.score
      
App = React.createFactory AppClass

testComponent = new App
  score: score
  propertyList: ['tone', 'amplitude']
element = document.getElementById 'react'
React.render testComponent, element
