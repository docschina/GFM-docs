### Lists

A [list](https://github.github.com/gfm/#list) is a sequence of one or more list items [of the same type](https://github.github.com/gfm/#of-the-same-type). The list items may be separated by any number of blank lines.  
Two list items are [of the same type](https://github.github.com/gfm/#of-the-same-type) if they begin with a [list marker](https://github.github.com/gfm/#list-marker) of the same type. Two list markers are of the same type if (a) they are bullet list markers using the same character (`-`, `+`, or `*`) or (b) they are ordered list numbers with the same delimiter (either `.` or `)`).  
A list is an [ordered list](https://github.github.com/gfm/#ordered-list) if its constituent list items begin with [ordered list markers](https://github.github.com/gfm/#ordered-list-marker), and a [bullet list](https://github.github.com/gfm/#bullet-list) if its constituent list items begin with [bullet list markers](https://github.github.com/gfm/#bullet-list-marker).  
The [start number](https://github.github.com/gfm/#start-number) of an [ordered list](https://github.github.com/gfm/#ordered-list) is determined by the list number of its initial list item. The numbers of subsequent list items are disregarded.  
A list is [loose](https://github.github.com/gfm/#loose) if any of its constituent list items are separated by blank lines, or if any of its constituent list items directly contain two block-level elements with a blank line between them. Otherwise a list is [tight](https://github.github.com/gfm/#tight). (The difference in HTML output is that paragraphs in a loose list are wrapped in `<p>` tags, while paragraphs in a tight list are not.)  
Changing the bullet or ordered list delimiter starts a new list:  
[Example 274](https://github.github.com/gfm/#example-274)  

    - foo
    - bar
    + baz

   

    <ul>
    <li>foo</li>
    <li>bar</li>
    </ul>
    <ul>
    <li>baz</li>
    </ul>

[Example 275](https://github.github.com/gfm/#example-275)  

    1. foo
    2. bar
    3) baz

   

    <ol>
    <li>foo</li>
    <li>bar</li>
    </ol>
    <ol start="3">
    <li>baz</li>
    </ol>

In CommonMark, a list can interrupt a paragraph. That is, no blank line is needed to separate a paragraph from a following list:  
[Example 276](https://github.github.com/gfm/#example-276)  

    Foo
    - bar
    - baz

   

    <p>Foo</p>
    <ul>
    <li>bar</li>
    <li>baz</li>
    </ul>

`Markdown.pl` does not allow this, through fear of triggering a list via a numeral in a hard-wrapped line:  

    The number of windows in my house is
    14.  The number of doors is 6.

Oddly, though, `Markdown.pl` _does_ allow a blockquote to interrupt a paragraph, even though the same considerations might apply.  
In CommonMark, we do allow lists to interrupt paragraphs, for two reasons. First, it is natural and not uncommon for people to start lists without blank lines:  

    I need to buy
    - new shoes
    - a coat
    - a plane ticket

Second, we are attracted to a  

> [principle of uniformity](https://github.github.com/gfm/#principle-of-uniformity): if a chunk of text has a certain meaning, it will continue to have the same meaning when put into a container block (such as a list item or blockquote).

(Indeed, the spec for [list items](https://github.github.com/gfm/#list-items) and [block quotes](https://github.github.com/gfm/#block-quotes) presupposes this principle.) This principle implies that if  

      * I need to buy
        - new shoes
        - a coat
        - a plane ticket

is a list item containing a paragraph followed by a nested sublist, as all Markdown implementations agree it is (though the paragraph may be rendered without `<p>` tags, since the list is “tight”), then  

    I need to buy
    - new shoes
    - a coat
    - a plane ticket

by itself should be a paragraph followed by a nested sublist.  
Since it is well established Markdown practice to allow lists to interrupt paragraphs inside list items, the [principle of uniformity](https://github.github.com/gfm/#principle-of-uniformity) requires us to allow this outside list items as well. ([reStructuredText](http://docutils.sourceforge.net/rst.html) takes a different approach, requiring blank lines before lists even inside other list items.)  
In order to solve of unwanted lists in paragraphs with hard-wrapped numerals, we allow only lists starting with `1` to interrupt paragraphs. Thus,  
[Example 277](https://github.github.com/gfm/#example-277)  

    The number of windows in my house is
    14.  The number of doors is 6.

   

    <p>The number of windows in my house is
    14.  The number of doors is 6.</p>

We may still get an unintended result in cases like  
[Example 278](https://github.github.com/gfm/#example-278)  

    The number of windows in my house is
    1.  The number of doors is 6.

   

    <p>The number of windows in my house is</p>
    <ol>
    <li>The number of doors is 6.</li>
    </ol>

but this rule should prevent most spurious list captures.  
There can be any number of blank lines between items:  
[Example 279](https://github.github.com/gfm/#example-279)  

    - foo
    
    - bar
    
    
    - baz

   

    <ul>
    <li>
    <p>foo</p>
    </li>
    <li>
    <p>bar</p>
    </li>
    <li>
    <p>baz</p>
    </li>
    </ul>

[Example 280](https://github.github.com/gfm/#example-280)  

    - foo
      - bar
        - baz
    
    
          bim

   

    <ul>
    <li>foo
    <ul>
    <li>bar
    <ul>
    <li>
    <p>baz</p>
    <p>bim</p>
    </li>
    </ul>
    </li>
    </ul>
    </li>
    </ul>

To separate consecutive lists of the same type, or to separate a list from an indented code block that would otherwise be parsed as a subparagraph of the final list item, you can insert a blank HTML comment:  
[Example 281](https://github.github.com/gfm/#example-281)  

    - foo
    - bar
    
    <!-- -->
    
    - baz
    - bim

   

    <ul>
    <li>foo</li>
    <li>bar</li>
    </ul>
    <!-- -->
    <ul>
    <li>baz</li>
    <li>bim</li>
    </ul>

[Example 282](https://github.github.com/gfm/#example-282)  

    -   foo
    
        notcode
    
    -   foo
    
    <!-- -->
    
        code

   

    <ul>
    <li>
    <p>foo</p>
    <p>notcode</p>
    </li>
    <li>
    <p>foo</p>
    </li>
    </ul>
    <!-- -->
    <pre><code>code
    </code></pre>

List items need not be indented to the same level. The following list items will be treated as items at the same list level, since none is indented enough to belong to the previous list item:  
[Example 283](https://github.github.com/gfm/#example-283)  

    - a
     - b
      - c
       - d
      - e
     - f
    - g

   

    <ul>
    <li>a</li>
    <li>b</li>
    <li>c</li>
    <li>d</li>
    <li>e</li>
    <li>f</li>
    <li>g</li>
    </ul>

[Example 284](https://github.github.com/gfm/#example-284)  

    1. a
    
      2. b
    
       3. c

   

    <ol>
    <li>
    <p>a</p>
    </li>
    <li>
    <p>b</p>
    </li>
    <li>
    <p>c</p>
    </li>
    </ol>

Note, however, that list items may not be indented more than three spaces. Here `- e` is treated as a paragraph continuation line, because it is indented more than three spaces:  
[Example 285](https://github.github.com/gfm/#example-285)  

    - a
     - b
      - c
       - d
        - e

   

    <ul>
    <li>a</li>
    <li>b</li>
    <li>c</li>
    <li>d
    - e</li>
    </ul>

And here, `3. c` is treated as in indented code block, because it is indented four spaces and preceded by a blank line.  
[Example 286](https://github.github.com/gfm/#example-286)  

    1. a
    
      2. b
    
        3. c

   

    <ol>
    <li>
    <p>a</p>
    </li>
    <li>
    <p>b</p>
    </li>
    </ol>
    <pre><code>3. c
    </code></pre>

This is a loose list, because there is a blank line between two of the list items:  
[Example 287](https://github.github.com/gfm/#example-287)  

    - a
    - b
    
    - c

   

    <ul>
    <li>
    <p>a</p>
    </li>
    <li>
    <p>b</p>
    </li>
    <li>
    <p>c</p>
    </li>
    </ul>

So is this, with a empty second item:  
[Example 288](https://github.github.com/gfm/#example-288)  

    * a
    *
    
    * c

   

    <ul>
    <li>
    <p>a</p>
    </li>
    <li></li>
    <li>
    <p>c</p>
    </li>
    </ul>

These are loose lists, even though there is no space between the items, because one of the items directly contains two block-level elements with a blank line between them:  
[Example 289](https://github.github.com/gfm/#example-289)  

    - a
    - b
    
      c
    - d

   

    <ul>
    <li>
    <p>a</p>
    </li>
    <li>
    <p>b</p>
    <p>c</p>
    </li>
    <li>
    <p>d</p>
    </li>
    </ul>

[Example 290](https://github.github.com/gfm/#example-290)  

    - a
    - b
    
      [ref]: /url
    - d

   

    <ul>
    <li>
    <p>a</p>
    </li>
    <li>
    <p>b</p>
    </li>
    <li>
    <p>d</p>
    </li>
    </ul>

This is a tight list, because the blank lines are in a code block:  
[Example 291](https://github.github.com/gfm/#example-291)  

    - a
    - ```
      b
    
    
      ```
    - c

   

    <ul>
    <li>a</li>
    <li>
    <pre><code>b
    
    
    </code></pre>
    </li>
    <li>c</li>
    </ul>

This is a tight list, because the blank line is between two paragraphs of a sublist. So the sublist is loose while the outer list is tight:  
[Example 292](https://github.github.com/gfm/#example-292)  

    - a
      - b
    
        c
    - d

   

    <ul>
    <li>a
    <ul>
    <li>
    <p>b</p>
    <p>c</p>
    </li>
    </ul>
    </li>
    <li>d</li>
    </ul>

This is a tight list, because the blank line is inside the block quote:  
[Example 293](https://github.github.com/gfm/#example-293)  

    * a
      > b
      >
    * c

   

    <ul>
    <li>a
    <blockquote>
    <p>b</p>
    </blockquote>
    </li>
    <li>c</li>
    </ul>

This list is tight, because the consecutive block elements are not separated by blank lines:  
[Example 294](https://github.github.com/gfm/#example-294)  

    - a
      > b
      ```
      c
      ```
    - d

   

    <ul>
    <li>a
    <blockquote>
    <p>b</p>
    </blockquote>
    <pre><code>c
    </code></pre>
    </li>
    <li>d</li>
    </ul>

A single-paragraph list is tight:  
[Example 295](https://github.github.com/gfm/#example-295)  

    - a

   

    <ul>
    <li>a</li>
    </ul>

[Example 296](https://github.github.com/gfm/#example-296)  

    - a
      - b

   

    <ul>
    <li>a
    <ul>
    <li>b</li>
    </ul>
    </li>
    </ul>

This list is loose, because of the blank line between the two block elements in the list item:  
[Example 297](https://github.github.com/gfm/#example-297)  

    1. ```
       foo
       ```
    
       bar

   

    <ol>
    <li>
    <pre><code>foo
    </code></pre>
    <p>bar</p>
    </li>
    </ol>

Here the outer list is loose, the inner list tight:  
[Example 298](https://github.github.com/gfm/#example-298)  

    * foo
      * bar
    
      baz

   

    <ul>
    <li>
    <p>foo</p>
    <ul>
    <li>bar</li>
    </ul>
    <p>baz</p>
    </li>
    </ul>

[Example 299](https://github.github.com/gfm/#example-299)  

    - a
      - b
      - c
    
    - d
      - e
      - f

   

    <ul>
    <li>
    <p>a</p>
    <ul>
    <li>b</li>
    <li>c</li>
    </ul>
    </li>
    <li>
    <p>d</p>
    <ul>
    <li>e</li>
    <li>f</li>
    </ul>
    </li>
    </ul>
