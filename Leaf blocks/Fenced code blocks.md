### Fenced code blocks

A [code fence](https://github.github.com/gfm/#code-fence) is a sequence of at least three consecutive backtick characters (`` ` ``) or tildes (`~`). (Tildes and backticks cannot be mixed.) A [fenced code block](https://github.github.com/gfm/#fenced-code-block) begins with a code fence, indented no more than three spaces.  

The line with the opening code fence may optionally contain some text following the code fence; this is trimmed of leading and trailing whitespace and called the [info string](https://github.github.com/gfm/#info-string). The [info string](https://github.github.com/gfm/#info-string) may not contain any backtick characters. (The reason for this restriction is that otherwise some inline code would be incorrectly interpreted as the beginning of a fenced code block.) 
 
The content of the code block consists of all subsequent lines, until a closing [code fence](https://github.github.com/gfm/#code-fence) of the same type as the code block began with (backticks or tildes), and with at least as many backticks or tildes as the opening code fence. If the leading code fence is indented N spaces, then up to N spaces of indentation are removed from each line of the content (if present). (If a content line is not indented, it is preserved unchanged. If it is indented less than N spaces, all of the indentation is removed.)  

The closing code fence may be indented up to three spaces, and may be followed only by spaces, which are ignored. If the end of the containing block (or document) is reached and no closing code fence has been found, the code block contains all of the lines after the opening code fence until the end of the containing block (or document). (An alternative spec would require backtracking in the event that a closing code fence is not found. But this makes parsing much less efficient, and there seems to be no real down side to the behavior described here.)  

A fenced code block may interrupt a paragraph, and does not require a blank line either before or after.  

The content of a code fence is treated as literal text, not parsed as inlines. The first word of the [info string](https://github.github.com/gfm/#info-string) is typically used to specify the language of the code sample, and rendered in the `class` attribute of the `code`tag. However, this spec does not mandate any particular treatment of the [info string](https://github.github.com/gfm/#info-string).  

Here is a simple example with backticks:  
[Example 88](https://github.github.com/gfm/#example-88)  

    ```
    <
     >
    ```

   

    <pre><code>&lt;
     &gt;
    </code></pre>

With tildes:  
[Example 89](https://github.github.com/gfm/#example-89)  

    ~~~
    <
     >
    ~~~

   

    <pre><code>&lt;
     &gt;
    </code></pre>

Fewer than three backticks is not enough:  
[Example 90](https://github.github.com/gfm/#example-90)  

    ``
    foo
    ``

   

    <p><code>foo</code></p>

The closing code fence must use the same character as the opening fence:  
[Example 91](https://github.github.com/gfm/#example-91)  

    ```
    aaa
    ~~~
    ```

   

    <pre><code>aaa
    ~~~
    </code></pre>

[Example 92](https://github.github.com/gfm/#example-92)  

    ~~~
    aaa
    ```
    ~~~

   

    <pre><code>aaa
    ```
    </code></pre>

The closing code fence must be at least as long as the opening fence:  
[Example 93](https://github.github.com/gfm/#example-93)  

    ````
    aaa
    ```
    ``````

   

    <pre><code>aaa
    ```
    </code></pre>

[Example 94](https://github.github.com/gfm/#example-94)  

    ~~~~
    aaa
    ~~~
    ~~~~

   

    <pre><code>aaa
    ~~~
    </code></pre>

Unclosed code blocks are closed by the end of the document (or the enclosing [block quote](https://github.github.com/gfm/#block-quotes) or [list item](https://github.github.com/gfm/#list-items)):  
[Example 95](https://github.github.com/gfm/#example-95)  

    ```

   

    <pre><code></code></pre>

[Example 96](https://github.github.com/gfm/#example-96)  

    `````
    
    ```
    aaa

   

    <pre><code>
    ```
    aaa
    </code></pre>

[Example 97](https://github.github.com/gfm/#example-97)  

    > ```
    > aaa
    
    bbb

   

    <blockquote>
    <pre><code>aaa
    </code></pre>
    </blockquote>
    <p>bbb</p>

A code block can have all empty lines as its content:  
[Example 98](https://github.github.com/gfm/#example-98)  

    ```
    
      
    ```

   

    <pre><code>
      
    </code></pre>

A code block can be empty:  
[Example 99](https://github.github.com/gfm/#example-99)  

    ```
    ```

   

    <pre><code></code></pre>

Fences can be indented. If the opening fence is indented, content lines will have equivalent opening indentation removed, if present:  
[Example 100](https://github.github.com/gfm/#example-100)  

     ```
     aaa
    aaa
    ```

   

    <pre><code>aaa
    aaa
    </code></pre>

[Example 101](https://github.github.com/gfm/#example-101)  

      ```
    aaa
      aaa
    aaa
      ```

   

    <pre><code>aaa
    aaa
    aaa
    </code></pre>

[Example 102](https://github.github.com/gfm/#example-102)  

       ```
       aaa
        aaa
      aaa
       ```

   

    <pre><code>aaa
     aaa
    aaa
    </code></pre>

Four spaces indentation produces an indented code block:  
[Example 103](https://github.github.com/gfm/#example-103)  

        ```
        aaa
        ```

   

    <pre><code>```
    aaa
    ```
    </code></pre>

Closing fences may be indented by 0-3 spaces, and their indentation need not match that of the opening fence:  
[Example 104](https://github.github.com/gfm/#example-104)  

    ```
    aaa
      ```

   

    <pre><code>aaa
    </code></pre>

[Example 105](https://github.github.com/gfm/#example-105)  

       ```
    aaa
      ```

   

    <pre><code>aaa
    </code></pre>

This is not a closing fence, because it is indented 4 spaces:  
[Example 106](https://github.github.com/gfm/#example-106)  

    ```
    aaa
        ```

   

    <pre><code>aaa
        ```
    </code></pre>

Code fences (opening and closing) cannot contain internal spaces:  
[Example 107](https://github.github.com/gfm/#example-107)  

    ``` ```
    aaa

   

    <p><code></code>
    aaa</p>

[Example 108](https://github.github.com/gfm/#example-108)  

    ~~~~~~
    aaa
    ~~~ ~~

   

    <pre><code>aaa
    ~~~ ~~
    </code></pre>

Fenced code blocks can interrupt paragraphs, and can be followed directly by paragraphs, without a blank line between:  
[Example 109](https://github.github.com/gfm/#example-109)  

    foo
    ```
    bar
    ```
    baz

   

    <p>foo</p>
    <pre><code>bar
    </code></pre>
    <p>baz</p>

Other blocks can also occur before and after fenced code blocks without an intervening blank line:  
[Example 110](https://github.github.com/gfm/#example-110)  

    foo
    ---
    ~~~
    bar
    ~~~
    # baz

   

    <h2>foo</h2>
    <pre><code>bar
    </code></pre>
    <h1>baz</h1>

An [info string](https://github.github.com/gfm/#info-string) can be provided after the opening code fence. Opening and closing spaces will be stripped, and the first word, prefixed with `language-`, is used as the value for the `class` attribute of the `code`element within the enclosing `pre` element.  
[Example 111](https://github.github.com/gfm/#example-111)  

    ```ruby
    def foo(x)
      return 3
    end
    ```

   

    <pre><code class="language-ruby">def foo(x)
      return 3
    end
    </code></pre>

[Example 112](https://github.github.com/gfm/#example-112)  

    ~~~~    ruby startline=3 $%@#$
    def foo(x)
      return 3
    end
    ~~~~~~~

   

    <pre><code class="language-ruby">def foo(x)
      return 3
    end
    </code></pre>

[Example 113](https://github.github.com/gfm/#example-113)  

    ````;
    ````

   

    <pre><code class="language-;"></code></pre>

[Info strings](https://github.github.com/gfm/#info-string) for backtick code blocks cannot contain backticks:  
[Example 114](https://github.github.com/gfm/#example-114)  

    ``` aa ```
    foo

   

    <p><code>aa</code>
    foo</p>

Closing code fences cannot have [info strings](https://github.github.com/gfm/#info-string):  
[Example 115](https://github.github.com/gfm/#example-115)  

    ```
    ``` aaa
    ```

   

    <pre><code>``` aaa
    </code></pre>
