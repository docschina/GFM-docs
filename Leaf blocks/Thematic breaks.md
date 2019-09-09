### Thematic breaks

A line consisting of 0-3 spaces of indentation, followed by a sequence of three or more matching `-`, `_`, or `*`characters, each followed optionally by any number of spaces or tabs, forms a [thematic break](https://github.github.com/gfm/#thematic-break).  

[Example 13](https://github.github.com/gfm/#example-13)  

    ***
    ---
    ___

   

    <hr />
    <hr />
    <hr />

Wrong characters:  
[Example 14](https://github.github.com/gfm/#example-14)  

    +++

   

    <p>+++</p>

[Example 15](https://github.github.com/gfm/#example-15)  

    ===

   

    <p>===</p>

Not enough characters:  
[Example 16](https://github.github.com/gfm/#example-16)  

    --
    **
    __

   

    <p>--
    **
    __</p>

One to three spaces indent are allowed:  
[Example 17](https://github.github.com/gfm/#example-17)  

     ***
      ***
       ***

   

    <hr />
    <hr />
    <hr />

Four spaces is too many:  
[Example 18](https://github.github.com/gfm/#example-18)  

        ***

   

    <pre><code>***
    </code></pre>

[Example 19](https://github.github.com/gfm/#example-19)  

    Foo
        ***

   

    <p>Foo
    ***</p>

More than three characters may be used:  
[Example 20](https://github.github.com/gfm/#example-20)  

    _____________________________________

   

    <hr />

Spaces are allowed between the characters:  
[Example 21](https://github.github.com/gfm/#example-21)  

     - - -

   

    <hr />

[Example 22](https://github.github.com/gfm/#example-22)  

     **  * ** * ** * **

   

    <hr />

[Example 23](https://github.github.com/gfm/#example-23)  

    -     -      -      -

   

    <hr />

Spaces are allowed at the end:  
[Example 24](https://github.github.com/gfm/#example-24)  

    - - - -

   

    <hr />

However, no other characters may occur in the line:  
[Example 25](https://github.github.com/gfm/#example-25)  

    _ _ _ _ a
    
    a------
    
    ---a---

   

    <p>_ _ _ _ a</p>
    <p>a------</p>
    <p>---a---</p>

It is required that all of the [non-whitespace characters](https://github.github.com/gfm/#non-whitespace-character) be the same. So, this is not a thematic break:  
[Example 26](https://github.github.com/gfm/#example-26)  

     *-*

   

    <p><em>-</em></p>

Thematic breaks do not need blank lines before or after:  
[Example 27](https://github.github.com/gfm/#example-27)  

    - foo
    ***
    - bar

   

    <ul>
    <li>foo</li>
    </ul>
    <hr />
    <ul>
    <li>bar</li>
    </ul>

Thematic breaks can interrupt a paragraph:  
[Example 28](https://github.github.com/gfm/#example-28)  

    Foo
    ***
    bar

   

    <p>Foo</p>
    <hr />
    <p>bar</p>

If a line of dashes that meets the above conditions for being a thematic break could also be interpreted as the underline of a [setext heading](https://github.github.com/gfm/#setext-heading), the interpretation as a [setext heading](https://github.github.com/gfm/#setext-heading) takes precedence. Thus, for example, this is a setext heading, not a paragraph followed by a thematic break:      

[Example 29](https://github.github.com/gfm/#example-29)  

    Foo
    ---
    bar

   

    <h2>Foo</h2>
    <p>bar</p>

When both a thematic break and a list item are possible interpretations of a line, the thematic break takes precedence:  
[Example 30](https://github.github.com/gfm/#example-30)  

    * Foo
    * * *
    * Bar

   

    <ul>
    <li>Foo</li>
    </ul>
    <hr />
    <ul>
    <li>Bar</li>
    </ul>

If you want a thematic break in a list item, use a different bullet:  
[Example 31](https://github.github.com/gfm/#example-31)  

    - Foo
    - * * *

   

    <ul>
    <li>Foo</li>
    <li>
    <hr />
    </li>
    </ul>

