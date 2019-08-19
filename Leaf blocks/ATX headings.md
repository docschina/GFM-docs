### ATX headings

An [ATX heading](https://github.github.com/gfm/#atx-heading) consists of a string of characters, parsed as inline content, between an opening sequence of 1–6 unescaped `#` characters and an optional closing sequence of any number of unescaped `#` characters. The opening sequence of `#` characters must be followed by a [space](https://github.github.com/gfm/#space) or by the end of line. The optional closing sequence of `#`s must be preceded by a [space](https://github.github.com/gfm/#space) and may be followed by spaces only. The opening `#`character may be indented 0-3 spaces. The raw contents of the heading are stripped of leading and trailing spaces before being parsed as inline content. The heading level is equal to the number of `#` characters in the opening sequence.  
Simple headings:  
[Example 32](https://github.github.com/gfm/#example-32)  

    # foo
    ## foo
    ### foo
    #### foo
    ##### foo
    ###### foo

   

    <h1>foo</h1>
    <h2>foo</h2>
    <h3>foo</h3>
    <h4>foo</h4>
    <h5>foo</h5>
    <h6>foo</h6>

More than six `#` characters is not a heading:  
[Example 33](https://github.github.com/gfm/#example-33)  

    ####### foo

   

    <p>####### foo</p>

At least one space is required between the `#` characters and the heading’s contents, unless the heading is empty. Note that many implementations currently do not require the space. However, the space was required by the [original ATX implementation](http://www.aaronsw.com/2002/atx/atx.py), and it helps prevent things like the following from being parsed as headings:  
[Example 34](https://github.github.com/gfm/#example-34)  

    #5 bolt
    
    #hashtag

   

    <p>#5 bolt</p>
    <p>#hashtag</p>

This is not a heading, because the first `#` is escaped:  
[Example 35](https://github.github.com/gfm/#example-35)  

    \## foo

   

    <p>## foo</p>

Contents are parsed as inlines:  
[Example 36](https://github.github.com/gfm/#example-36)  

    # foo *bar* \*baz\*

   

    <h1>foo <em>bar</em> *baz*</h1>

Leading and trailing whitespace is ignored in parsing inline content:    
[Example 37](https://github.github.com/gfm/#example-37)  

    #                  foo

   

    <h1>foo</h1>

One to three spaces indentation are allowed:  
[Example 38](https://github.github.com/gfm/#example-38)  

     ### foo
      ## foo
       # foo

   

    <h3>foo</h3>
    <h2>foo</h2>
    <h1>foo</h1>

Four spaces are too much:  
[Example 39](https://github.github.com/gfm/#example-39)  

        # foo

   

    <pre><code># foo
    </code></pre>

[Example 40](https://github.github.com/gfm/#example-40)  

    foo
        # bar

   

    <p>foo
    # bar</p>

A closing sequence of `#` characters is optional:  
[Example 41](https://github.github.com/gfm/#example-41)  

    ## foo ##
      ###   bar    ###

   

    <h2>foo</h2>
    <h3>bar</h3>

It need not be the same length as the opening sequence:  
[Example 42](https://github.github.com/gfm/#example-42)  

    # foo ##################################
    ##### foo ##

   

    <h1>foo</h1>
    <h5>foo</h5>

Spaces are allowed after the closing sequence:  
[Example 43](https://github.github.com/gfm/#example-43)  

    ### foo ###

   

    <h3>foo</h3>

A sequence of `#` characters with anything but [spaces](https://github.github.com/gfm/#space) following it is not a closing sequence, but counts as part of the contents of the heading:  
[Example 44](https://github.github.com/gfm/#example-44)  

    ### foo ### b

   

    <h3>foo ### b</h3>

The closing sequence must be preceded by a space:  
[Example 45](https://github.github.com/gfm/#example-45)  

    # foo#

   

    <h1>foo#</h1>

Backslash-escaped `#` characters do not count as part of the closing sequence:  
[Example 46](https://github.github.com/gfm/#example-46)  

    ### foo \###
    ## foo #\##
    # foo \#

   

    <h3>foo ###</h3>
    <h2>foo ###</h2>
    <h1>foo #</h1>

ATX headings need not be separated from surrounding content by blank lines, and they can interrupt paragraphs:  
[Example 47](https://github.github.com/gfm/#example-47)  

    ****
    ## foo
    ****

   

    <hr />
    <h2>foo</h2>
    <hr />

[Example 48](https://github.github.com/gfm/#example-48)  

    Foo bar
    # baz
    Bar foo

   

    <p>Foo bar</p>
    <h1>baz</h1>
    <p>Bar foo</p>

ATX headings can be empty:  
[Example 49](https://github.github.com/gfm/#example-49)  

    ## 
    #
    ### ###

   

    <h2></h2>
    <h1></h1>
    <h3></h3>

