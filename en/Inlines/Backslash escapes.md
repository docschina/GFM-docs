### Backslash escapes

Any ASCII punctuation character may be backslash-escaped:  
[Example 301](https://github.github.com/gfm/#example-301)  

    \!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~

   

    <p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</p>

Backslashes before other characters are treated as literal backslashes:  
[Example 302](https://github.github.com/gfm/#example-302)  

    \→\A\a\ \3\φ\«

   

    <p>\→\A\a\ \3\φ\«</p>

Escaped characters are treated as regular characters and do not have their usual Markdown meanings:  
[Example 303](https://github.github.com/gfm/#example-303)  

    \*not emphasized*
    \<br/> not a tag
    \[not a link](/foo)
    \`not code`
    1\. not a list
    \* not a list
    \# not a heading
    \[foo]: /url "not a reference"

   

    <p>*not emphasized*
    &lt;br/&gt; not a tag
    [not a link](/foo)
    `not code`
    1. not a list
    * not a list
    # not a heading
    [foo]: /url &quot;not a reference&quot;</p>

If a backslash is itself escaped, the following character is not:  
[Example 304](https://github.github.com/gfm/#example-304)  

    \\*emphasis*

   

    <p>\<em>emphasis</em></p>

A backslash at the end of the line is a [hard line break](https://github.github.com/gfm/#hard-line-break):  
[Example 305](https://github.github.com/gfm/#example-305)  

    foo\
    bar

   

    <p>foo<br />
    bar</p>

Backslash escapes do not work in code blocks, code spans, autolinks, or raw HTML:  
[Example 306](https://github.github.com/gfm/#example-306)  

    `` \[\` ``

   

    <p><code>\[\`</code></p>

[Example 307](https://github.github.com/gfm/#example-307)  

        \[\]

   

    <pre><code>\[\]
    </code></pre>

[Example 308](https://github.github.com/gfm/#example-308)  

    ~~~
    \[\]
    ~~~

   

    <pre><code>\[\]
    </code></pre>

[Example 309](https://github.github.com/gfm/#example-309)  

    <http://example.com?find=\*>

   

    <p><a href="http://example.com?find=%5C*">http://example.com?find=\*</a></p>

[Example 310](https://github.github.com/gfm/#example-310)  

    <a href="/bar\/)">

   

    <a href="/bar\/)">

But they work in all other contexts, including URLs and link titles, link references, and [info strings](https://github.github.com/gfm/#info-string) in [fenced code blocks](https://github.github.com/gfm/#fenced-code-blocks):  
[Example 311](https://github.github.com/gfm/#example-311)  

    [foo](/bar\* "ti\*tle")

   

    <p><a href="/bar*" title="ti*tle">foo</a></p>

[Example 312](https://github.github.com/gfm/#example-312)  

    [foo]
    
    [foo]: /bar\* "ti\*tle"

   

    <p><a href="/bar*" title="ti*tle">foo</a></p>

[Example 313](https://github.github.com/gfm/#example-313)  

    ``` foo\+bar
    foo
    ```

   

    <pre><code class="language-foo+bar">foo
    </code></pre>
