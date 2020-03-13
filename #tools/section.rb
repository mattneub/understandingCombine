def section(s)
  xref = "SEC" + s.dropNonAlphas.downcase
  makexref(xref, :sectitle => s)
  %{<h2 id="#{xref}">#{s}</h2>}
end
