### Block quotes

一个[块引用标记](https://github.github.com/gfm/#block-quote-marker) 块引用标记由0-3个初始缩进空格组成，另外加上（a）字符>与一个空格，或（b）单个字符>后面没有空格。
[引用块](https://github.github.com/gfm/#block-quotes)由以下原则定义:  

1.  **一般原则** 如果许多行(Ls)构成块(Bs)的序列，那么将[块引用标记](https://github.github.com/gfm/#block-quote-marker)添加到Ls中每行的开头，会是一个包含Bs的[块引用](https://github.github.com/gfm/#block-quotes)
2.  **懒惰原则** 如果许多行(Ls)构成一个含有内容的[引用块](https://github.github.com/gfm/#block-quotes) (Bs)，那么将一行或多行[块引用标记](https://github.github.com/gfm/#block-quote-marker)紧邻[非空字符](https://github.github.com/gfm/#non-whitespace-character)为[段落延续文本](https://github.github.com/gfm/#paragraph-continuation-text)的行中的初始[块引用标记](https://github.github.com/gfm/#block-quote-marker)删除的结果是一个将Bs作为其内容的[引用块](https://github.github.com/gfm/#block-quotes)。[段落延续文本](https://github.github.com/gfm/#paragraph-continuation-text)被解析为段落的部分内容，但并不会出现在段落的开头
3.  **持续性** 文档中不能在同一行中出现两个[引用块](https://github.github.com/gfm/#block-quotes)，除非二者中间有一行[空行](https://github.github.com/gfm/#blank-line)

Nothing else counts as a [block quote](https://github.github.com/gfm/#block-quotes).  
Here is a simple example:  
[Example 199](https://github.github.com/gfm/#example-199)  

    > # Foo
    > bar
    > baz

   

    <blockquote>
    <h1>Foo</h1>
    <p>bar
    baz</p>
    </blockquote>

The spaces after the `>` characters can be omitted:  
[Example 200](https://github.github.com/gfm/#example-200)  

    ># Foo
    >bar
    > baz

   

    <blockquote>
    <h1>Foo</h1>
    <p>bar
    baz</p>
    </blockquote>

The `>` characters can be indented 1-3 spaces:  
[Example 201](https://github.github.com/gfm/#example-201)  

       > # Foo
       > bar
     > baz

   

    <blockquote>
    <h1>Foo</h1>
    <p>bar
    baz</p>
    </blockquote>

Four spaces gives us a code block:  
[Example 202](https://github.github.com/gfm/#example-202)  

        > # Foo
        > bar
        > baz

   

    <pre><code>&gt; # Foo
    &gt; bar
    &gt; baz
    </code></pre>

The Laziness clause allows us to omit the `>` before [paragraph continuation text](https://github.github.com/gfm/#paragraph-continuation-text):  
[Example 203](https://github.github.com/gfm/#example-203)  

    > # Foo
    > bar
    baz

   

    <blockquote>
    <h1>Foo</h1>
    <p>bar
    baz</p>
    </blockquote>

A block quote can contain some lazy and some non-lazy continuation lines:  
[Example 204](https://github.github.com/gfm/#example-204)  

    > bar
    baz
    > foo

   

    <blockquote>
    <p>bar
    baz
    foo</p>
    </blockquote>

Laziness only applies to lines that would have been continuations of paragraphs had they been prepended with [block quote markers](https://github.github.com/gfm/#block-quote-marker). For example, the `>` cannot be omitted in the second line of  

    > foo
    > ---

without changing the meaning:  
[Example 205](https://github.github.com/gfm/#example-205)  

    > foo
    ---

   

    <blockquote>
    <p>foo</p>
    </blockquote>
    <hr />

Similarly, if we omit the `>` in the second line of  

    > - foo
    > - bar

then the block quote ends after the first line:  
[Example 206](https://github.github.com/gfm/#example-206)  

    > - foo
    - bar

   

    <blockquote>
    <ul>
    <li>foo</li>
    </ul>
    </blockquote>
    <ul>
    <li>bar</li>
    </ul>

For the same reason, we can’t omit the `>` in front of subsequent lines of an indented or fenced code block:  
[Example 207](https://github.github.com/gfm/#example-207)  

    >     foo
        bar

   

    <blockquote>
    <pre><code>foo
    </code></pre>
    </blockquote>
    <pre><code>bar
    </code></pre>

[Example 208](https://github.github.com/gfm/#example-208)  

    > ```
    foo
    ```

   

    <blockquote>
    <pre><code></code></pre>
    </blockquote>
    <p>foo</p>
    <pre><code></code></pre>

Note that in the following case, we have a [lazy continuation line](https://github.github.com/gfm/#lazy-continuation-line):  
[Example 209](https://github.github.com/gfm/#example-209)  

    > foo
        - bar

   

    <blockquote>
    <p>foo
    - bar</p>
    </blockquote>

To see why, note that in  

    > foo
    >     - bar

the `- bar` is indented too far to start a list, and can’t be an indented code block because indented code blocks cannot interrupt paragraphs, so it is [paragraph continuation text](https://github.github.com/gfm/#paragraph-continuation-text).  
A block quote can be empty:  
[Example 210](https://github.github.com/gfm/#example-210)  

    >

   

    <blockquote>
    </blockquote>

[Example 211](https://github.github.com/gfm/#example-211)  

    >
    >  
    >

   

    <blockquote>
    </blockquote>

A block quote can have initial or final blank lines:  
[Example 212](https://github.github.com/gfm/#example-212)  

    >
    > foo
    >

   

    <blockquote>
    <p>foo</p>
    </blockquote>

A blank line always separates block quotes:  
[Example 213](https://github.github.com/gfm/#example-213)  

    > foo
    
    > bar

   

    <blockquote>
    <p>foo</p>
    </blockquote>
    <blockquote>
    <p>bar</p>
    </blockquote>

(Most current Markdown implementations, including John Gruber’s original `Markdown.pl`, will parse this example as a single block quote with two paragraphs. But it seems better to allow the author to decide whether two block quotes or one are wanted.)  
Consecutiveness means that if we put these block quotes together, we get a single block quote:  
[Example 214](https://github.github.com/gfm/#example-214)  

    > foo
    > bar

   

    <blockquote>
    <p>foo
    bar</p>
    </blockquote>

To get a block quote with two paragraphs, use:  
[Example 215](https://github.github.com/gfm/#example-215)  

    > foo
    >
    > bar

   

    <blockquote>
    <p>foo</p>
    <p>bar</p>
    </blockquote>

Block quotes can interrupt paragraphs:  
[Example 216](https://github.github.com/gfm/#example-216)  

    foo
    > bar

   

    <p>foo</p>
    <blockquote>
    <p>bar</p>
    </blockquote>

In general, blank lines are not needed before or after block quotes:  
[Example 217](https://github.github.com/gfm/#example-217)  

    > aaa
    ***
    > bbb

   

    <blockquote>
    <p>aaa</p>
    </blockquote>
    <hr />
    <blockquote>
    <p>bbb</p>
    </blockquote>

However, because of laziness, a blank line is needed between a block quote and a following paragraph:  
[Example 218](https://github.github.com/gfm/#example-218)  

    > bar
    baz

   

    <blockquote>
    <p>bar
    baz</p>
    </blockquote>

[Example 219](https://github.github.com/gfm/#example-219)  

    > bar
    
    baz

   

    <blockquote>
    <p>bar</p>
    </blockquote>
    <p>baz</p>

[Example 220](https://github.github.com/gfm/#example-220)  

    > bar
    >
    baz

   

    <blockquote>
    <p>bar</p>
    </blockquote>
    <p>baz</p>

It is a consequence of the Laziness rule that any number of initial `>`s may be omitted on a continuation line of a nested block quote:  
[Example 221](https://github.github.com/gfm/#example-221)  

    > > > foo
    bar

   

    <blockquote>
    <blockquote>
    <blockquote>
    <p>foo
    bar</p>
    </blockquote>
    </blockquote>
    </blockquote>

[Example 222](https://github.github.com/gfm/#example-222)  

    >>> foo
    > bar
    >>baz

   

    <blockquote>
    <blockquote>
    <blockquote>
    <p>foo
    bar
    baz</p>
    </blockquote>
    </blockquote>
    </blockquote>

When including an indented code block in a block quote, remember that the [block quote marker](https://github.github.com/gfm/#block-quote-marker) includes both the `>` and a following space. So _five spaces_ are needed after the `>`:  
[Example 223](https://github.github.com/gfm/#example-223)  

    >     code
    
    >    not code

   

    <blockquote>
    <pre><code>code
    </code></pre>
    </blockquote>
    <blockquote>
    <p>not code</p>
    </blockquote>
