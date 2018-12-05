class HighlighterController < ApplicationController
  protect_from_forgery with: :null_session

  def index

  end

  def rouge
    text = rouge_params[:text]
    language = rouge_params[:language]
    result = { highlighted_text: rougify(text, language) }
    render json: result
  end

  private

  def rouge_params
    params.permit(:language, :text)
  end

  def rougify(text, language)
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight-github')
    lexer = Rouge::Lexer.find(language)
    formatter.format(lexer.lex(text))
  end
end
