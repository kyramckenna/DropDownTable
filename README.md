DropDownTable
=============

This framework creates a drop down table view which you can use on a touch event. The example app uses the framework to display a dropdown list from a TextField and TextView. But you could call it on any iOS event. It could also be a center screen pop up.



How to install
-------

Drag the framework bundle into the project



* [.markdown, .mdown, .mkdn, .md](http://daringfireball.net/projects/markdown/) -- `gem install redcarpet` (https://github.com/vmg/redcarpet)
* [.textile](http://www.textism.com/tools/textile/) -- `gem install RedCloth`
* [.rdoc](http://rdoc.sourceforge.net/) -- `gem install rdoc -v 3.6.1`
* [.org](http://orgmode.org/) -- `gem install org-ruby`
* [.creole](http://wikicreole.org/) -- `gem install creole`
* [.mediawiki, .wiki](http://www.mediawiki.org/wiki/Help:Formatting) -- `gem install wikicloth`
* [.rst](http://docutils.sourceforge.net/rst.html) -- `easy_install docutils`
* [.asciidoc, .adoc, .asc](http://asciidoc.org/) -- `gem install asciidoctor` (http://asciidoctor.org)
* [.pod](http://search.cpan.org/dist/perl/pod/perlpod.pod) -- `Pod::Simple::HTML`
  comes with Perl >= 5.10. Lower versions should install [Pod::Simple](http://search.cpan.org/~dwheeler/Pod-Simple-3.28/lib/Pod/Simple.pod) from CPAN.

Installation
-----------

```
gem install github-markup
```

Usage
-----

```ruby
require 'github/markup'
GitHub::Markup.render('README.markdown', "* One\n* Two")
```

Or, more realistically:

```ruby
require 'github/markup'
