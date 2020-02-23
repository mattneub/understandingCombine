def cssFilter(adrPageTable)
  # support for SASS
  if (adrPageTable[:sheetName] == "s2") # this is our only SASS stylesheet; of course you could use some other means of identification
    adrPageTable[:csstext] = Sass::Engine.new(adrPageTable[:csstext], :syntax => :scss, :style => :expanded).render
  end
end