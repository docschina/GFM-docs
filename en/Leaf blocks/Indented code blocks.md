### Indented code blocks

An [indented code block](https://github.github.com/gfm/#indented-code-block) is composed of one or more [indented chunks](https://github.github.com/gfm/#indented-chunk) separated by blank lines. An [indented chunk](https://github.github.com/gfm/#indented-chunk) is a sequence of non-blank lines, each indented four or more spaces. The contents of the code block are the literal contents of the lines, including trailing [line endings](https://github.github.com/gfm/#line-ending), minus four spaces of indentation. An indented code block has no [info string](https://github.github.com/gfm/#info-string).  
An indented code block cannot interrupt a paragraph, so there must be a blank line between a paragraph and a following indented code block. (A blank line is not needed, however, between a code block and a following paragraph.)  
[Example 76](https://github.github.com/gfm/#example-76)  

        a simple
          indented code block

   

    <pre><code>a simple
      indented code block
    </code></pre>

If there is any ambiguity between an interpretation of indentation as a code block and as indicating that material belongs to a [list item](https://github.github.com/gfm/#list-items), the list item interpretation takes precedence:  
[Example 77](https://github.github.com/gfm/#example-77)  

      - foo
    
        bar

   

    <ul>
    <li>
    <p>foo</p>
    <p>bar</p>
    </li>
    </ul>

[Example 78](https://github.github.com/gfm/#example-78)  

    1.  foo
    
        - bar

   

    <ol>
    <li>
    <p>foo</p>
    <ul>
    <li>bar</li>
    </ul>
    </li>
    </ol>

The contents of a code block are literal text, and do not get parsed as Markdown:  
[Example 79](https://github.github.com/gfm/#example-79)  

        <a/>
        *hi*
    
        - one

   

    <pre><code>&lt;a/&gt;
    *hi*
    
    - one
    </code></pre>

Here we have three chunks separated by blank lines:  
[Example 80](https://github.github.com/gfm/#example-80)  

        chunk1
    
        chunk2
      
     
     
        chunk3

   

    <pre><code>chunk1
    
    chunk2
    
    
    
    chunk3
    </code></pre>

Any initial spaces beyond four will be included in the content, even in interior blank lines:  
[Example 81](https://github.github.com/gfm/#example-81)  

        chunk1
          
          chunk2

   

    <pre><code>chunk1
      
      chunk2
    </code></pre>

An indented code block cannot interrupt a paragraph. (This allows hanging indents and the like.)  
[Example 82](https://github.github.com/gfm/#example-82)  

    Foo
        bar

   

    <p>Foo
    bar</p>

However, any non-blank line with fewer than four leading spaces ends the code block immediately. So a paragraph may occur immediately after indented code:  
[Example 83](https://github.github.com/gfm/#example-83)  

        foo
    bar

   

    <pre><code>foo
    </code></pre>
    <p>bar</p>

And indented code can occur immediately before and after other kinds of blocks:  
[Example 84](https://github.github.com/gfm/#example-84)  

    # Heading
        foo
    Heading
    ------
        foo
    ----

   

    <h1>Heading</h1>
    <pre><code>foo
    </code></pre>
    <h2>Heading</h2>
    <pre><code>foo
    </code></pre>
    <hr />

The first line can be indented more than four spaces:  
[Example 85](https://github.github.com/gfm/#example-85)  

            foo
        bar

   

    <pre><code>    foo
    bar
    </code></pre>

Blank lines preceding or following an indented code block are not included in it:  
[Example 86](https://github.github.com/gfm/#example-86)  

    
        
        foo

   

    <pre><code>foo
    </code></pre>

Trailing spaces are included in the code block’s content:  
[Example 87](https://github.github.com/gfm/#example-87)  

        foo

   

    <pre><code>foo  
    </code></pre>
