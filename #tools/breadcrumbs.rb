def breadcrumbs()
  nextprevs = @adrPageTable['nextprevs'].read
  doc = Opml.textToOpml(nextprevs)
  # first question is: where am I
  me = adrObject.simplename
  toc = (me.to_s == "toc")
  thisnode = doc.search("//outline[@text='#{me}']").first # nil for toc, it's not in the nextprevs!
  # start at the top
  top = doc.root
  body = top.first_element_child
  # do children
  s = "<div class='breadcrumbs'>"
  s = "<div class='toc'>" if toc
  s << doOneLevel(body, thisnode, toc)
  s << "</div>"
  s << "<div style='clear:both'></div>"
  s
end
def doOneLevel(node, thisnode, toc)
  s = ""
  node.children.each do |line|
    name = line["text"]
    title, path, adr = html.getTitleAndPaths(name)
    link = html.getLink(title, name)
    if line == thisnode
      s << "<p><b>" + title + "</b>"
    else
      s << "<p>" + link
    end
    if toc
      subtitle = html.getOneDirective("subtitle", adr)
      if !subtitle.nil?
        s << "<br /><span class=\"subtitle\">" + subtitle + "</span>"
      end
    end
    s << "</p>\n"
    if line.children.count > 0 && (thisnode.nil? || thisnode == line || thisnode.ancestors.include?(line))
      s << "<div class='toc_level'>\n"
      s << doOneLevel(line, thisnode, toc)
      s << "</div>\n"
    end
  end
  s
end
