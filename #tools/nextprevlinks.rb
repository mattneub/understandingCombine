def nextprevlinks()
  p, n = html.getNextPrev(adrObject)
  ntitle, npath = html.getTitleAndPaths(n) if n
  ptitle, ppath = html.getTitleAndPaths(p) if p
  s = ""
  s << "Prev: " + html.getLink(ptitle, ptitle) if p
  s << " | " if p and n
  s << "Next: " + html.getLink(ntitle, ntitle) if n
  "<p>#{s}</p>\n"
end
