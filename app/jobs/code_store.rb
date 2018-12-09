class CodeStore
  @queue = :code_store_queue

  def self.perform(language, text)
    highlighted_code = SourceCode.rougify(language, text)

    SourceCode.create(language: language,
                      source_code: text,
                      highlighted_source_code: highlighted_code)
  end
end
