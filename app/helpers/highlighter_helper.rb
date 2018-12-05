module HighlighterHelper
  def options_for_language(selected_lang)
    selected = selected_lang.blank? ? '' : selected_lang
    options = Rouge::Lexer.all.map(&:tag).sort
    options_for_select(options, selected)
  end
end
