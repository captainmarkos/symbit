class HighlighterController < ApplicationController
  protect_from_forgery with: :null_session

  def index

  end

  def rouge
    text = rouge_params[:text]
    language = rouge_params[:language]
    Resque.enqueue(CodeStore, language, text)

    result = { highlighted_text: SourceCode.rougify(language, text) }
    render json: result
  end

  private

  def rouge_params
    params.permit(:language, :text)
  end
end
