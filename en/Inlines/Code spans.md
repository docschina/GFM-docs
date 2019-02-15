### Code spans

A [backtick string](https://github.github.com/gfm/#backtick-string) is a string of one or more backtick characters (`` ` ``) that is neither preceded nor followed by a backtick.  
A [code span](https://github.github.com/gfm/#code-span) begins with a backtick string and ends with a backtick string of equal length. The contents of the code span are the characters between the two backtick strings, with leading and trailing spaces and [line endings](https://github.github.com/gfm/#line-ending) removed, and [whitespace](https://github.github.com/gfm/#whitespace) collapsed to single spaces.  
This is a simple code span:  
[Example 326](https://github.github.com/gfm/#example-326)  

    `foo`

   

    <p><code>foo</code></p>

Here two backticks are used, because the code contains a backtick. This example also illustrates stripping of leading and trailing spaces:  
[Example 327](https://github.github.com/gfm/#example-327)  

    `` foo ` bar  ``

   

    <p><code>foo ` bar</code></p>

This example shows the motivation for stripping leading and trailing spaces:  
[Example 328](https://github.github.com/gfm/#example-328)  

    ` `` `

   

    <p><code>``</code></p>

[Line endings](https://github.github.com/gfm/#line-ending) are treated like spaces:  
[Example 329](https://github.github.com/gfm/#example-329)  

    ``
    foo
    ``

   

    <p><code>foo</code></p>

Interior spaces and [line endings](https://github.github.com/gfm/#line-ending) are collapsed into single spaces, just as they would be by a browser:  
[Example 330](https://github.github.com/gfm/#example-330)  

    `foo   bar
      baz`

   

    <p><code>foo bar baz</code></p>

Not all [Unicode whitespace](https://github.github.com/gfm/#unicode-whitespace) (for instance, non-breaking space) is collapsed, however:  
[Example 331](https://github.github.com/gfm/#example-331)  

    `a  b`

   

    <p><code>a  b</code></p>

Q: Why not just leave the spaces, since browsers will collapse them anyway? A: Because we might be targeting a non-HTML format, and we shouldn’t rely on HTML-specific rendering assumptions.  
(Existing implementations differ in their treatment of internal spaces and [line endings](https://github.github.com/gfm/#line-ending). Some, including `Markdown.pl` and `showdown`, convert an internal [line ending](https://github.github.com/gfm/#line-ending) into a `<br />` tag. But this makes things difficult for those who like to hard-wrap their paragraphs, since a line break in the midst of a code span will cause an unintended line break in the output. Others just leave internal spaces as they are, which is fine if only HTML is being targeted.)  
[Example 332](https://github.github.com/gfm/#example-332)  

    `foo `` bar`

   

    <p><code>foo `` bar</code></p>

Note that backslash escapes do not work in code spans. All backslashes are treated literally:  
[Example 333](https://github.github.com/gfm/#example-333)  

    `foo\`bar`

   

    <p><code>foo\</code>bar`</p>

Backslash escapes are never needed, because one can always choose a string of _n_ backtick characters as delimiters, where the code does not contain any strings of exactly _n_ backtick characters.  
Code span backticks have higher precedence than any other inline constructs except HTML tags and autolinks. Thus, for example, this is not parsed as emphasized text, since the second `*` is part of a code span:  
[Example 334](https://github.github.com/gfm/#example-334)  

    *foo`*`

   

    <p>*foo<code>*</code></p>

And this is not parsed as a link:  
[Example 335](https://github.github.com/gfm/#example-335)  

    [not a `link](/foo`)

   

    <p>[not a <code>link](/foo</code>)</p>

Code spans, HTML tags, and autolinks have the same precedence. Thus, this is code:  
[Example 336](https://github.github.com/gfm/#example-336)  

    `<a href="`">`

   

    <p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>

But this is an HTML tag:  
[Example 337](https://github.github.com/gfm/#example-337)  

    <a href="`">`

   

    <p><a href="`">`</p>

And this is code:  
[Example 338](https://github.github.com/gfm/#example-338)  

    `<http://foo.bar.`baz>`

   

    <p><code>&lt;http://foo.bar.</code>baz&gt;`</p>

But this is an autolink:  
[Example 339](https://github.github.com/gfm/#example-339)  

    <http://foo.bar.`baz>`

   

    <p><a href="http://foo.bar.%60baz">http://foo.bar.`baz</a>`</p>

When a backtick string is not closed by a matching backtick string, we just have literal backticks:  
[Example 340](https://github.github.com/gfm/#example-340)  

    ```foo``

   

    <p>```foo``</p>

[Example 341](https://github.github.com/gfm/#example-341)  

    `foo

   

    <p>`foo</p>

The following case also illustrates the need for opening and closing backtick strings to be equal in length:  
[Example 342](https://github.github.com/gfm/#example-342)  

    `foo``bar``

   

    <p>`foo<code>bar</code></p>
