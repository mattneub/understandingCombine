def nextprevlinks()
  f = @adrPageTable[:adrsiteroottable]
  p, n = html.pagesInFolder(f).nextprev(adrObject.simplename.to_s)
  ntitle, npath = html.getTitleAndPaths(n) if n
  ptitle, ppath = html.getTitleAndPaths(p) if p
  prev = ""
  prev = "Prev: " + html.getLink(ptitle,p) if p
  nxt = ""
  nxt = "Next: " + html.getLink(ntitle, n) if n
  "<p style='float:left; width:45%'>#{prev}</p><p style='float:right; text-align:right; width:45%'>#{nxt}</p>\n<div style='clear:both' />\n"
end
