## Hard line breaks

A line break (not in a code span or HTML tag) that is preceded by two or more spaces and does not occur at the end of a block is parsed as a [hard line break](https://github.github.com/gfm/#hard-line-break) (rendered in HTML as a `<br />` tag):  
[Example 632](https://github.github.com/gfm/#example-632)  

    foo  
    baz

   

    <p>foo<br />
    baz</p>

For a more visible alternative, a backslash before the [line ending](https://github.github.com/gfm/#line-ending) may be used instead of two spaces:  
[Example 633](https://github.github.com/gfm/#example-633)  

    foo\
    baz

   

    <p>foo<br />
    baz</p>

More than two spaces can be used:  
[Example 634](https://github.github.com/gfm/#example-634)  

    foo       
    baz

   

    <p>foo<br />
    baz</p>

Leading spaces at the beginning of the next line are ignored:  
[Example 635](https://github.github.com/gfm/#example-635)  

    foo  
         bar

   

    <p>foo<br />
    bar</p>

[Example 636](https://github.github.com/gfm/#example-636)  

    foo\
         bar

   

    <p>foo<br />
    bar</p>

Line breaks can occur inside emphasis, links, and other constructs that allow inline content:  
[Example 637](https://github.github.com/gfm/#example-637)  

    *foo  
    bar*

   

    <p><em>foo<br />
    bar</em></p>

[Example 638](https://github.github.com/gfm/#example-638)  

    *foo\
    bar*

   

    <p><em>foo<br />
    bar</em></p>

Line breaks do not occur inside code spans  
[Example 639](https://github.github.com/gfm/#example-639)  

    `code  
    span`

   

    <p><code>code  span</code></p>

[Example 640](https://github.github.com/gfm/#example-640)  

    `code\
    span`

   

    <p><code>code\ span</code></p>

or HTML tags:  
[Example 641](https://github.github.com/gfm/#example-641)  

    <a href="foo  
    bar">

   

    <p><a href="foo  
    bar"></p>

[Example 642](https://github.github.com/gfm/#example-642)  

    <a href="foo\
    bar">

   

    <p><a href="foo\
    bar"></p>

Hard line breaks are for separating inline content within a block. Neither syntax for hard line breaks works at the end of a paragraph or other block element:  
[Example 643](https://github.github.com/gfm/#example-643)  

    foo\

   

    <p>foo\</p>

[Example 644](https://github.github.com/gfm/#example-644)  

    foo

   

    <p>foo</p>

[Example 645](https://github.github.com/gfm/#example-645)  

    ### foo\

   

    <h3>foo\</h3>

[Example 646](https://github.github.com/gfm/#example-646)  

    ### foo

   

    <h3>foo</h3>
