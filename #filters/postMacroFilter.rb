def postMacroFilter(adrPageTable)
  # adrPageTable[:postmacrotext] = process(adrPageTable[:postmacrotext])
  # example:
  # support for writing page as kramdown
  if adrPageTable[:kramdown]
    adrPageTable[:postmacrotext] = Kramdown::Document.new(
      adrPageTable[:postmacrotext], :auto_ids => false, :entity_output => :numeric
    ).to_html.gsub("&quot;", '"')
  end
end