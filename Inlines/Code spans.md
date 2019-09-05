### Code spans

A [backtick string](https://github.github.com/gfm/#backtick-string) is a string of one or more backtick characters (`` ` ``) that is neither preceded nor followed by a backtick.  
A code span(@) begins with a backtick string and ends with a backtick string of equal length.  The contents of the code span are the characters between the two backtick strings, normalized in the following ways:

- First, line endings are converted to spaces.
- If the resulting string both begins *and* ends with a space character, but does not consist entirely of space characters, a single space character is removed from the front and back.  This allows you to include code that begins or ends with backtick characters, which must be separated by whitespace from the opening or closing backtick strings.
This is a simple code span:  

[Example 326](https://github.github.com/gfm/#example-326)  

    `foo`
   

    <p><code>foo</code></p>

Here two backticks are used, because the code contains a backtick.
This example also illustrates stripping of a single leading and
trailing space:    
[Example 327](https://github.github.com/gfm/#example-327)  

    `` foo ` bar  ``

   

    <p><code>foo ` bar</code></p>

This example shows the motivation for stripping leading and trailing spaces:  
[Example 328](https://github.github.com/gfm/#example-328)  

    ` `` `

   

    <p><code>``</code></p>

Note that only *one* space is stripped:

````
`  ``  `
````

````
<p><code> `` </code></p>
````

Only [spaces], and not [unicode whitespace] in general, are stripped in this way:

````
` b `
````

````
<p><code> b </code></p>
````

No stripping occurs if the code span contains only spaces:

````
` `
`  `
````
````
<p><code> </code>
<code>  </code></p>
````

[Line endings](https://github.github.com/gfm/#line-ending) are treated like spaces:  

`````
``
foo
bar  
baz
``
`````

`````
<p><code>foo bar   baz</code></p>
`````

[Example 329](https://github.github.com/gfm/#example-329)  

    ``
    foo 
    ``

   

    <p><code>foo </code></p>

Interior spaces are not collapsed:    
[Example 330](https://github.github.com/gfm/#example-330)  

    `foo   bar 
      baz`

   

    <p><code>foo   bar  baz</code></p>

Note that browsers will typically collapse consecutive spaces when rendering `<code>` elements, so it is recommended that the following CSS be used:

    code{white-space: pre-wrap;}

Note that backslash escapes do not work in code spans. All backslashes are treated literally:  
[Example 333](https://github.github.com/gfm/#example-333)  

    `foo\`bar`

   

    <p><code>foo\</code>bar`</p>

Backslash escapes are never needed, because one can always choose a string of _n_ backtick characters as delimiters, where the code does not contain any strings of exactly _n_ backtick characters. 

````
``foo`bar``
````

````
<p><code>foo`bar</code></p>
````


````
` foo `` bar `
````

````
<p><code>foo `` bar</code></p>
````
 
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
