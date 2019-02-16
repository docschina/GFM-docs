### Paragraphs

A sequence of non-blank lines that cannot be interpreted as other kinds of blocks forms a [paragraph](https://github.github.com/gfm/#paragraph). The contents of the paragraph are the result of parsing the paragraph’s raw content as inlines. The paragraph’s raw content is formed by concatenating the lines and removing initial and final [whitespace](https://github.github.com/gfm/#whitespace).  
A simple example with two paragraphs:  
[Example 182](https://github.github.com/gfm/#example-182)  

    aaa
    
    bbb

   

    <p>aaa</p>
    <p>bbb</p>

Paragraphs can contain multiple lines, but no blank lines:  
[Example 183](https://github.github.com/gfm/#example-183)  

    aaa
    bbb
    
    ccc
    ddd

   

    <p>aaa
    bbb</p>
    <p>ccc
    ddd</p>

Multiple blank lines between paragraph have no effect:  
[Example 184](https://github.github.com/gfm/#example-184)  

    aaa
    
    
    bbb

   

    <p>aaa</p>
    <p>bbb</p>

Leading spaces are skipped:  
[Example 185](https://github.github.com/gfm/#example-185)  

      aaa
     bbb

   

    <p>aaa
    bbb</p>

Lines after the first may be indented any amount, since indented code blocks cannot interrupt paragraphs.  
[Example 186](https://github.github.com/gfm/#example-186)  

    aaa
                 bbb
                                           ccc

   

    <p>aaa
    bbb
    ccc</p>

However, the first line may be indented at most three spaces, or an indented code block will be triggered:  
[Example 187](https://github.github.com/gfm/#example-187)  

       aaa
    bbb

   

    <p>aaa
    bbb</p>

[Example 188](https://github.github.com/gfm/#example-188)  

        aaa
    bbb

   

    <pre><code>aaa
    </code></pre>
    <p>bbb</p>

Final spaces are stripped before inline parsing, so a paragraph that ends with two or more spaces will not end with a [hard line break](https://github.github.com/gfm/#hard-line-break):  
[Example 189](https://github.github.com/gfm/#example-189)  

    aaa     
    bbb

   

    <p>aaa<br />
    bbb</p>