def section(s)
  xref = "SEC" + s.dropNonAlphas.downcase # not a proper slug but I just don't feel like it
  makexref(xref, :sectitle => s)
  %{<h2 id="#{xref}">#{s}</h2>}
end
