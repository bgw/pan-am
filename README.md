Pan Am: *Simple CSS for Pandoc*
===============================

![](http://b.enjam.info/panam/screenshot.png)

Pandoc outputs HTML without any styling. That's boring and ugly. This is some
simple CSS for stand-alone Pandoc documents that serves as a good default.
Regardless of how your compose your document, we'll make it look good.

This should work with markdown, reStructuredText, textile, LaTeX, MediaWiki
markup, or any other format Pandoc supports. It should even work for your
semantically structured HTML5 documents, if they're written well enough.

Simple to Use
-------------

    curl -O http://b.enjam.info/panam/styling.css
    pandoc --css=styling.css -V lang=en -V highlighting-css= --mathjax \
           --smart --to=html5 input.md -o output.html

or, if you don't need all the fancy bells-and-whistles,

    pandoc --css=styling.css --to=html5 input.md -o output.html

Easy to Develop
---------------

    gem install sass
    make

Trivial to Test
---------------

    python -m SimpleHTTPServer &
    firefox http://localhost:8000 &
    chromium http://localhost:8000 &
    ...

Modern Standards
----------------

We focus on modern web standards, and target Pandoc's `html5` output target.

Typography
----------

We use *Libre Baskerville*, a screen-optimized font based on Baskerville, and
Adobe's free *Source Code Pro* for all our text. Webfonts are loaded through
Google's Webfonts service, so you don't have to worry about hosting a dozen
`woff`, `otf`, `svg`, and `eot` variants.

In case the user's browser doesn't support CSS3's `@font-face` directive, we
fall back to sane defaults.

To improve readability, wide responsive margins are used with justified text.
[Experimental CSS4 hyphenation][] is used on browsers that support it, reducing
the effects of rivers.

  [Experimental CSS4 hyphenation]: http://generatedcontent.org/post/44751461516/

Sectioning
----------

Clean horizontal rules are used to section off top-level headers. Styling is
provided for `h1`, `h2`, and `h3` tags, as well as Pandoc's title extension for
markdown.

CSS' sibling selectors are used to collapse duplicate horizontal rules to ensure
clean transitions between trouble elements, such as `h1` and `table`.

Readable Tables
---------------

Pandoc's markdown supports multiple syntaxes for tables. Vertical lines destroy
table readability. Our tables use only horizontal rules and alternating shading
between even and odd rows, improving comprehension.

Test Cases
----------

There's all sorts of possible edge-cases, so we have a collection of example
documents that we automatically build and then review by hand before each
release. Upgrading shouldn't break semantic documents.
