def cssFilter(adrPageTable)
  # support for SASS
  adrPageTable[:csstext] = Sass::Engine.new(adrPageTable[:csstext], :syntax => :scss, :style => :expanded).render
end