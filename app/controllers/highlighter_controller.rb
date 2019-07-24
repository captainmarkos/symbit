class HighlighterController < ApplicationController
  protect_from_forgery with: :null_session

  def index; end

  def rouge
    text = rouge_params[:text]
    language = rouge_params[:language]

    # Use a background job and save to the database.
    Resque.enqueue(CodeStore, language, text)

    highlighted_code = SourceCode.rougify(language, text)

    #SourceCode.create(language: language,
    #                  source_code: text,
    #                  highlighted_source_code: highlighted_code)

    # Fun with a mailer, let someone know we did some work.
    # Disabled for now because in production google blocks it.
    # HighlighterMailer.syntax_highlighted.deliver_later

    result = { highlighted_text: SourceCode.rougify(language, text) }
    render json: result
  end

  private

  def rouge_params
    params.permit(:language, :text)
  end
end
