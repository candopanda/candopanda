import fluxer from "src/fluxer"
import SurveyActions from "actions/survey"

class SurveyStore {
  constructor() {
    this.sourceCode = "";
    this.buildStatus = null;
    this.buildResult = null;

    this.bindListeners({
      handleShow: SurveyActions.SHOW,
      handleUpdate: SurveyActions.UPDATE,
      handleUpdateSourceCode: SurveyActions.UPDATE_SOURCE_CODE
    });
  }

  handleShow(response) {
    const survey = JSON.parse(response.response)
    this.sourceCode = survey.source_code || ""
  }

  handleUpdate(response) {
    const survey = JSON.parse(response.response)
    this.sourceCode = survey.source_code || ""
    this.buildStatus = survey.build_status
    this.buildResult = survey.build_result
  }

  handleUpdateSourceCode(sourceCode) {
    this.sourceCode = sourceCode
  }
}

export default fluxer.createStore(SurveyStore, "SurveyStore");
