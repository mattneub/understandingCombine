def finalFilter(adrPageTable)
  # adrPageTable[:renderedtext] = process(adrPageTable[:renderedtext])
  # example:
  # smartypants support
  if adrPageTable[:markdown] || adrPageTable[:smartypants]
    IO.popen(%{"#{ENV['TM_SUPPORT_PATH']}/bin/SmartyPants.pl"}, "r+") do |io|
      io.write adrPageTable[:renderedtext]
      io.close_write
      adrPageTable[:renderedtext] = io.read
    end
  end
  # this is also a good place for final cleanup
  # for example, I like to remove any self-links that may have been accidentally generated
  # remove self-links
  adrPageTable[:renderedtext] = adrPageTable[:renderedtext].gsub(/<a href="">(.*?)<\/a>/, "\\1")
end
