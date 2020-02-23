def section(s)
  xref = "SEC" + s.dropNonAlphas
  makexref(xref, :sectitle => s)
  %{<h2 id="#{xref}">#{s}</h2>}
end
