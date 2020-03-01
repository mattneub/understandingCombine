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
  s << doOneLevel(body, thisnode)
  s << "</div>"
  s << "<div style='clear:both'></div>"
  s
end
def doOneLevel(node, thisnode)
  s = ""
  node.children.each do |line|
    name = line["text"]
    title, path = html.getTitleAndPaths(name)
    link = html.getLink(title, path)
    if line == thisnode
      s << "<p><b>" + link + "</b></p>\n"
    else
      s << "<p>" + link + "</p>\n"
    end
    if line.children.count > 0 && (thisnode.nil? || thisnode == line || thisnode.ancestors.include?(line))
      s << "<div class='toc_level'>\n"
      s << doOneLevel(line, thisnode)
      s << "</div>\n"
    end
  end
  s
end
