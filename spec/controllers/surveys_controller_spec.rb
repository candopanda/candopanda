require "rails_helper"

RSpec.describe SurveysController do
  describe "#update" do
    subject(:update) { patch :update, params: params.merge(id: survey.id) }

    let(:params) { { survey: { source_code: "Any arbitrary source code" } } }
    let(:survey) { create(:survey, completed_at: nil) }
    let(:result) { Codepanda::ExecutedResult.new(result: "Hello!", success: true) }

    before do
      allow(CODE_RUNNER).to receive(:execute).and_return(result)
    end

    it "updates source code for a survey" do
      expect { update }.to(change { survey.reload.source_code })
    end

    it "runs a code runner with a source code" do
      update
      expect(CODE_RUNNER).to have_received(:execute).with("Any arbitrary source code")
    end

    context "when code successfully compiled and executed" do
      it "sets complited at" do
        expect { update }.to(change { survey.reload.completed_at })
      end
    end

    context "when code compilation is failed" do
      let(:result) { Codepanda::ExecutedResult.new(result: "Error!", success: false) }

      it "doesn't set complited at" do
        expect { update }.not_to(change { survey.reload.completed_at })
      end
    end
  end
end
