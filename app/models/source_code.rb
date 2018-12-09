class SourceCode < ApplicationRecord
  validates :language, presence: true

  def self.rougify(language, text) # class method
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight-github')
    lexer = Rouge::Lexer.find(language)
    formatter.format(lexer.lex(text))
  end
end
