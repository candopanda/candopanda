import fluxer from "src/fluxer";
import qwest from "qwest";

class SurveyActions {
  show(id) {
    return (dispatch) => {
      qwest.get(`/surveys/${id}.json`).then(dispatch)
    }
  }

  updateSourceCode(sourceCode) {
    return sourceCode
  }

  update(id, sourceCode) {
    return (dispatch) => {
      qwest.put(`/surveys/${id}.json`, { survey: { source_code: sourceCode } }).then(dispatch)
    }
  }
}

export default fluxer.createActions(SurveyActions)
