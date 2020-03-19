def finalFilter(adrPageTable)
  # remove self-links
  adrPageTable[:renderedtext] = adrPageTable[:renderedtext].gsub(/<a href="">(.*?)<\/a>/, "\\1")
end
