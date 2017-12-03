import "src/application"
import React from "react"
import ReactDOM from "react-dom"
import SurveyControls from "components/survey_controls"
import SurveyForm from "components/survey_form"
import {
  BrowserRouter as Router,
  Route,
  Redirect
} from "react-router-dom"

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Router>
      <div>
        <div className="banner">
          <h2 className="banner-title">Codepanda</h2>
          <div className="banner-controls">
            <Route path="/surveys/:id" component={ SurveyControls } />
          </div>
        </div>

        <div className="container">
          <Route path="/surveys/:id" component={ SurveyForm } />
        </div>
      </div>
    </Router>,
    document.getElementById('app')
  )
})
