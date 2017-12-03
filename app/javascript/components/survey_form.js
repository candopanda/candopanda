import React, { Component } from "react";
import PropTypes from "prop-types"
import SurveyStore from "stores/survey"
import SurveyActions from "actions/survey"
import classNames from "classnames"

export default class Form extends Component {
  constructor() {
    super()
    this.state = SurveyStore.getState()
  }

  componentWillMount() {
    SurveyActions.show(this.props.match.params.id)
	}

  componentDidMount() {
    SurveyStore.listen(this.onChange.bind(this));
    this.textArea.focus();
  }

  componentWillUnmount() {
    SurveyStore.unlisten(this.onChange.bind(this));
  }

  onChange(state) {
    this.setState(state);
  }

  handleChange(event) {
    SurveyActions.updateSourceCode(event.target.value);
  }

  render() {
    const outputSuccessClassName = this.state.buildStatus ? "success" : "failure"

    return <div>
      <div className="survey-form-wrap">
        <textarea itemProp="description"
          ref={(textarea) => { this.textArea = textarea }}
          autoCorrect="off"
          autoComplete="off"
          autoCapitalize="off"
          spellCheck="false"
          wrap="off" value={ this.state.sourceCode } onChange={ this.handleChange }>
        </textarea>
      </div>
      <div className={ classNames("survey-form-output", outputSuccessClassName) }>
        <pre>
          { this.state.buildResult }
        </pre>
      </div>
    </div>
  }
}

Form.propTypes = {
  params: PropTypes.shape({
    id: PropTypes.string
  })
}
