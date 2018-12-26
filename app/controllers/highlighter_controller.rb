class HighlighterController < ApplicationController
  protect_from_forgery with: :null_session

  def index; end

  def rouge
    text = rouge_params[:text]
    language = rouge_params[:language]

    # For now, let's not use a background job and just save to the database.
    # If and when we get redis setup on google cloud then we can enable this.
    # Resque.enqueue(CodeStore, language, text)

    highlighted_code = SourceCode.rougify(language, text)
    SourceCode.create(language: language,
                      source_code: text,
                      highlighted_source_code: highlighted_code)

    result = { highlighted_text: SourceCode.rougify(language, text) }
    render json: result
  end

  private

  def rouge_params
    params.permit(:language, :text)
  end
end
