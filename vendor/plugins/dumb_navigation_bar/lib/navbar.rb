#FIXME: documentation is completely wrong
module Dumb #:nodoc:
  module NavigationBar
    # Creates a list item containing either a single <a> tag or a 
    # the content passed as the first argument. 
    # The behaviour is determined by the second argument, which is an optional url,
    # so that 
    #   navitem "<p>foo</p>"
    # generates a list containing a single paragraph, while
    #   navitem "Administration", admin_url
    # will generate a link to +admin_url+ with content +"Administration"+
    # In case the url is present it will be marked as a link only if 
    # the current request page does not match
    def navitem(opts)
      name= opts[:name]
      title = opts[:title] || name
      url = opts[:url]
      list_css_opts={}
      link_css_opts={:title=>title}
      if url
        matcher=opts[:rgx] || /#{Regexp.quote(url)}$/i
      #  p matcher, @request.protocol+@request.host_with_port+@request.path

        if matcher.match(@request.protocol+@request.host_with_port+@request.path)
          list_css_opts[:id]="active"
          link_css_opts[:id]="current"
        end
        content=link_to(name,url,link_css_opts)
      else
        content=name
      end
      content_tag "li",
          content,
          list_css_opts
    end
    
    # Creates a list (<ul>) filling it with list items, each containing a link.
    # Each arguments must be an +Array+ like this:
    #   ["Item content", "optional url", "optional regex"]
    # See +navitem+ documentation for further details. 
    def navbar(*ary)
      content_tag "ul",
        ary.map {|opts| 
          #p 'nr: '+rgx.to_s
          navitem(opts)
        }.join("\n"),
        {:id=>"navlist"}
    end
  end
end
  
