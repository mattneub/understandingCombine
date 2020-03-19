def nextprevlinks()
  f = @adrPageTable[:adrsiteroottable]
  p, n = html.pagesInFolder(f).nextprev(adrObject.simplename.to_s)
  ntitle, npath = html.getTitleAndPaths(n) if n
  ptitle, ppath = html.getTitleAndPaths(p) if p
  prev = ""
  prev = "Prev: " + html.getLink(ptitle,p) if p
  nxt = ""
  nxt = "Next: " + html.getLink(ntitle, n) if n
  <<-DONE
  <p class='prevlink'>#{prev}</p>
  <p class='nextlink'>#{nxt}</p>
  <div style='clear:both' />
  DONE
end
