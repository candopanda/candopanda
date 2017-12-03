import React, { Component } from "react";
import PropTypes from "prop-types"
import SurveyStore from "stores/survey"
import SurveyActions from "actions/survey"


export default class Controls extends Component {
  constructor() {
    super()
    this.state = SurveyStore.getState()
  }

  componentDidMount() {
    SurveyStore.listen(this.onChange.bind(this));
  }

  componentWillUnmount() {
    SurveyStore.unlisten(this.onChange.bind(this));
  }

  onChange(state) {
    this.setState(state);
  }

  submitResult() {
    SurveyActions.update(this.props.match.params.id, this.state.sourceCode)
  }

  render() {
    return <input type="button"
      disabled={ this.state.sourceCode.length == 0 }
      onClick={ this.submitResult.bind(this) }
      value="Run" />
  }
}

Controls.propTypes = {
  params: PropTypes.shape({
    id: PropTypes.string
  })
}
