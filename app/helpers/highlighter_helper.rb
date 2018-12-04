module HighlighterHelper
  def options_for_language(selected_lang)
    selected = selected_lang.blank? ? '' : selected_lang
    #options = ['', 'ruby', 'java', 'php', 'perl', 'python']
    options = Rouge::Lexer.all.map(&:tag).sort
    options_for_select(options, selected)
  end

  def rouge(text, language)
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight-github')
    lexer = Rouge::Lexer.find(language)
    formatter.format(lexer.lex(text))
  end
end
