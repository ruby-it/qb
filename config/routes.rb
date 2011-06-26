ActionController::Routing::Routes.draw do |map|
  map.connect  '', :controller => 'home', :action=>  'index'
  map.rollback 'pages/:page_title/revisions/new/:revision_number', :controller => "revisions", :action => "new", :requirements => { :revision_number => /\d+/ }
  map.new      'pages/:page_title/revisions/new', :controller => "revisions", :action => "new"
  map.revision  'pages/:page_title/revisions/:revision_number', :controller => "revisions", :action => "show", :requirements => { :revision_number => /\d+/ }

  #FIXME: something is useless, cleanup
  # menu items, actually
  map.recent    'recent', :controller => "pages", :action => "recent"
  map.pages     'pages/index', :controller => "pages"
  map.home      'home', :controller => "home" 
  map.all_pages 'pages/all', :controller=>"pages", :action => "all"
  map.sitemap_top  'sitemap', :controller=>'pages', :action=>'sitemap'
  map.sitemap   'pages/sitemap', :controller=>'pages', :action=>'sitemap'
  map.page      'pages/:page_title', :controller => "pages", :action => "show"
  map.feed      'feed.rss', :controller => "pages", :action => "feed"
  map.connect   ':controller/:action/:id'
end
