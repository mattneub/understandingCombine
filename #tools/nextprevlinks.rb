def nextprevlinks()
  f = @adrPageTable[:adrsiteroottable]
  p, n = html.pagesInFolder(f).nextprev(adrObject.simplename.to_s)
  ntitle, npath = html.getTitleAndPaths(n) if n
  ptitle, ppath = html.getTitleAndPaths(p) if p
  prev = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
  prev = "Prev: " + html.getLink(ptitle,p) if p
  nxt = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
  nxt = "Next: " + html.getLink(ntitle, n) if n
  # Now written with the expectation that (1) Bulma is environment and (2) we want the toc link
  <<-DONE
  <nav class="bulma-level">

   <div class="bulma-level-left">
   <div class="bulma-level-item">
   <p>#{prev}</p>
   </div>
   </div>

   <div class="bulma-level-item bulma-has-text-centered">
   <p><a href="toc">Table of Contents</a></p>
   </div>

   <div class="bulma-level-right">
   <div class="bulma-level-item">
   <p>#{nxt}</p>
   </div>
   </div>

  </nav>
  DONE
end
