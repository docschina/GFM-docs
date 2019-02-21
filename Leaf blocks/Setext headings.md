### Setext headings

A [setext heading](https://github.github.com/gfm/#setext-heading) consists of one or more lines of text, each containing at least one [non-whitespace character](https://github.github.com/gfm/#non-whitespace-character), with no more than 3 spaces indentation, followed by a [setext heading underline](https://github.github.com/gfm/#setext-heading-underline). The lines of text must be such that, were they not followed by the setext heading underline, they would be interpreted as a paragraph: they cannot be interpretable as a [code fence](https://github.github.com/gfm/#code-fence), [ATX heading](https://github.github.com/gfm/#atx-headings), [block quote](https://github.github.com/gfm/#block-quotes), [thematic break](https://github.github.com/gfm/#thematic-breaks), [list item](https://github.github.com/gfm/#list-items), or [HTML block](https://github.github.com/gfm/#html-blocks).  

A [setext heading underline](https://github.github.com/gfm/#setext-heading-underline) is a sequence of `=` characters or a sequence of `-` characters, with no more than 3 spaces indentation and any number of trailing spaces. If a line containing a single `-` can be interpreted as an empty [list items](https://github.github.com/gfm/#list-items), it should be interpreted this way and not as a [setext heading underline](https://github.github.com/gfm/#setext-heading-underline).  

The heading is a level 1 heading if `=` characters are used in the [setext heading underline](https://github.github.com/gfm/#setext-heading-underline), and a level 2 heading if `-` characters are used. The contents of the heading are the result of parsing the preceding lines of text as CommonMark inline content.  

In general, a setext heading need not be preceded or followed by a blank line. However, it cannot interrupt a paragraph, so when a setext heading comes after a paragraph, a blank line is needed between them.  

Simple examples:  
[Example 50](https://github.github.com/gfm/#example-50)  

    Foo *bar*
    =========
    
    Foo *bar*
    ---------

   

    <h1>Foo <em>bar</em></h1>
    <h2>Foo <em>bar</em></h2>

The content of the header may span more than one line:  
[Example 51](https://github.github.com/gfm/#example-51)  

    Foo *bar
    baz*
    ====

   

    <h1>Foo <em>bar
    baz</em></h1>

The underlining can be any length:  
[Example 52](https://github.github.com/gfm/#example-52)  

    Foo
    -------------------------
    
    Foo
    =

   

    <h2>Foo</h2>
    <h1>Foo</h1>

The heading content can be indented up to three spaces, and need not line up with the underlining:  
[Example 53](https://github.github.com/gfm/#example-53)  

       Foo
    ---
    
      Foo
    -----
    
      Foo
      ===

   

    <h2>Foo</h2>
    <h2>Foo</h2>
    <h1>Foo</h1>

Four spaces indent is too much:  
[Example 54](https://github.github.com/gfm/#example-54)  

        Foo
        ---
    
        Foo
    ---

   

    <pre><code>Foo
    ---
    
    Foo
    </code></pre>
    <hr />

The setext heading underline can be indented up to three spaces, and may have trailing spaces:  
[Example 55](https://github.github.com/gfm/#example-55)  

    Foo
       ----

   

    <h2>Foo</h2>

Four spaces is too much:  
[Example 56](https://github.github.com/gfm/#example-56)  

    Foo
        ---

   

    <p>Foo
    ---</p>

The setext heading underline cannot contain internal spaces:  
[Example 57](https://github.github.com/gfm/#example-57)  

    Foo
    = =
    
    Foo
    --- -

   

    <p>Foo
    = =</p>
    <p>Foo</p>
    <hr />

Trailing spaces in the content line do not cause a line break:  
[Example 58](https://github.github.com/gfm/#example-58)  

    Foo  
    -----

   

    <h2>Foo</h2>

Nor does a backslash at the end:  
[Example 59](https://github.github.com/gfm/#example-59)  

    Foo\
    ----

   

    <h2>Foo\</h2>

Since indicators of block structure take precedence over indicators of inline structure, the following are setext headings:  
[Example 60](https://github.github.com/gfm/#example-60)  

    `Foo
    ----
    `
    
    <a title="a lot
    ---
    of dashes"/>

   

    <h2>`Foo</h2>
    <p>`</p>
    <h2>&lt;a title=&quot;a lot</h2>
    <p>of dashes&quot;/&gt;</p>

The setext heading underline cannot be a [lazy continuation line](https://github.github.com/gfm/#lazy-continuation-line) in a list item or block quote:  
[Example 61](https://github.github.com/gfm/#example-61)  

    > Foo
    ---

   

    <blockquote>
    <p>Foo</p>
    </blockquote>
    <hr />

[Example 62](https://github.github.com/gfm/#example-62)  

    > foo
    bar
    ===

   

    <blockquote>
    <p>foo
    bar
    ===</p>
    </blockquote>

[Example 63](https://github.github.com/gfm/#example-63)  

    - Foo
    ---

   

    <ul>
    <li>Foo</li>
    </ul>
    <hr />

A blank line is needed between a paragraph and a following setext heading, since otherwise the paragraph becomes part of the heading’s content:  
[Example 64](https://github.github.com/gfm/#example-64)  

    Foo
    Bar
    ---

   

    <h2>Foo
    Bar</h2>

But in general a blank line is not required before or after setext headings:  
[Example 65](https://github.github.com/gfm/#example-65)  

    ---
    Foo
    ---
    Bar
    ---
    Baz

   

    <hr />
    <h2>Foo</h2>
    <h2>Bar</h2>
    <p>Baz</p>

Setext headings cannot be empty:  
[Example 66](https://github.github.com/gfm/#example-66)  

    
    ====

   

    <p>====</p>

Setext heading text lines must not be interpretable as block constructs other than paragraphs. So, the line of dashes in these examples gets interpreted as a thematic break:  
[Example 67](https://github.github.com/gfm/#example-67)  

    ---
    ---

   

    <hr />
    <hr />

[Example 68](https://github.github.com/gfm/#example-68)  

    - foo
    -----

   

    <ul>
    <li>foo</li>
    </ul>
    <hr />

[Example 69](https://github.github.com/gfm/#example-69)  

        foo
    ---

   

    <pre><code>foo
    </code></pre>
    <hr />

[Example 70](https://github.github.com/gfm/#example-70)  

    > foo
    -----

   

    <blockquote>
    <p>foo</p>
    </blockquote>
    <hr />

If you want a heading with `> foo` as its literal text, you can use backslash escapes:  
[Example 71](https://github.github.com/gfm/#example-71)  

    \> foo
    ------

   

    <h2>&gt; foo</h2>

**Compatibility note:** Most existing Markdown implementations do not allow the text of setext headings to span multiple lines. But there is no consensus about how to interpret  

    Foo
    bar
    ---
    baz

One can find four different interpretations:  

1.  paragraph “Foo”, heading “bar”, paragraph “baz”
2.  paragraph “Foo bar”, thematic break, paragraph “baz”
3.  paragraph “Foo bar — baz”
4.  heading “Foo bar”, paragraph “baz”

We find interpretation 4 most natural, and interpretation 4 increases the expressive power of CommonMark, by allowing multiline headings. Authors who want interpretation 1 can put a blank line after the first paragraph:  
[Example 72](https://github.github.com/gfm/#example-72)  

    Foo
    
    bar
    ---
    baz

   

    <p>Foo</p>
    <h2>bar</h2>
    <p>baz</p>

Authors who want interpretation 2 can put blank lines around the thematic break,  
[Example 73](https://github.github.com/gfm/#example-73)  

    Foo
    bar
    
    ---
    
    baz

   

    <p>Foo
    bar</p>
    <hr />
    <p>baz</p>

or use a thematic break that cannot count as a [setext heading underline](https://github.github.com/gfm/#setext-heading-underline), such as  
[Example 74](https://github.github.com/gfm/#example-74)  

    Foo
    bar
    * * *
    baz

   

    <p>Foo
    bar</p>
    <hr />
    <p>baz</p>

Authors who want interpretation 3 can use backslash escapes:  
[Example 75](https://github.github.com/gfm/#example-75)  

    Foo
    bar
    \---
    baz

   

    <p>Foo
    bar
    ---
    baz</p>

