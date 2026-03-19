def pageFilter(adrPageTable, caller)
  
  # support for template being written as Haml
  if adrPageTable[:hamltemplate] and (t = adrPageTable.fetch2(:template))
    adrPageTable[:directTemplate] = Haml::Template.new(t).render(caller) # file
  end
  
  #support for embedded Haml in the page itself
  if adrPageTable[:embeddedhaml]
    adrPageTable[:bodytext] = adrPageTable[:bodytext].gsub(/^<%%%(.*?)%%%>/m) do |s|
      Haml::Template.new{$1}.render(caller) # block returning string
    end
  end
end

