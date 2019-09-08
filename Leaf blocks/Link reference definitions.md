### Link reference definitions

A [link reference definition](https://github.github.com/gfm/#link-reference-definition) consists of a [link label](https://github.github.com/gfm/#link-label), indented up to three spaces, followed by a colon (`:`), optional [whitespace](https://github.github.com/gfm/#whitespace) (including up to one [line ending](https://github.github.com/gfm/#line-ending)), a [link destination](https://github.github.com/gfm/#link-destination), optional [whitespace](https://github.github.com/gfm/#whitespace) (including up to one [line ending](https://github.github.com/gfm/#line-ending)), and an optional [link title](https://github.github.com/gfm/#link-title), which if it is present must be separated from the [link destination](https://github.github.com/gfm/#link-destination)by [whitespace](https://github.github.com/gfm/#whitespace). No further [non-whitespace characters](https://github.github.com/gfm/#non-whitespace-character) may occur on the line.  

A [link reference definition](https://github.github.com/gfm/#link-reference-definition) does not correspond to a structural element of a document. Instead, it defines a label which can be used in [reference links](https://github.github.com/gfm/#reference-link) and reference-style [images](https://github.github.com/gfm/#images) elsewhere in the document. [Link reference definitions](https://github.github.com/gfm/#link-reference-definition) can come either before or after the links that use them.  
[Example 159](https://github.github.com/gfm/#example-159)  

    [foo]: /url "title"
    
    [foo]

   

    <p><a href="/url" title="title">foo</a></p>

[Example 160](https://github.github.com/gfm/#example-160)  

       [foo]: 
          /url  
               'the title'  
    
    [foo]

   

    <p><a href="/url" title="the title">foo</a></p>

[Example 161](https://github.github.com/gfm/#example-161)  

    [Foo*bar\]]:my_(url) 'title (with parens)'
    
    [Foo*bar\]]

   

    <p><a href="my_(url)" title="title (with parens)">Foo*bar]</a></p>

[Example 162](https://github.github.com/gfm/#example-162)  

    [Foo bar]:
    <my url>
    'title'
    
    [Foo bar]

   

    <p><a href="my%20url" title="title">Foo bar</a></p>

The title may extend over multiple lines:  
[Example 163](https://github.github.com/gfm/#example-163)  

    [foo]: /url '
    title
    line1
    line2
    '
    
    [foo]

   

    <p><a href="/url" title="
    title
    line1
    line2
    ">foo</a></p>

However, it may not contain a [blank line](https://github.github.com/gfm/#blank-line):  
[Example 164](https://github.github.com/gfm/#example-164)  

    [foo]: /url 'title
    
    with blank line'
    
    [foo]

   

    <p>[foo]: /url 'title</p>
    <p>with blank line'</p>
    <p>[foo]</p>

The title may be omitted:  
[Example 165](https://github.github.com/gfm/#example-165)  

    [foo]:
    /url
    
    [foo]

   

    <p><a href="/url">foo</a></p>

The link destination may not be omitted:  
[Example 166](https://github.github.com/gfm/#example-166)  

    [foo]:
    
    [foo]

   

    <p>[foo]:</p>
    <p>[foo]</p>

However, an empty link destination may be specified using angle brackets:    

Example 166.5    
```md
[foo]: <>

[foo]
```

```html
<p><a href="">foo</a></p>
```

The title must be separated from the link destination by whitespace:

Example 166.75

```md
[foo]: <bar>(baz)

[foo]
```

```html
<p>[foo]: <bar>(baz)</p>
<p>[foo]</p>
```

Both title and destination can contain backslash escapes and literal backslashes:  
[Example 167](https://github.github.com/gfm/#example-167)  

    [foo]: /url\bar\*baz "foo\"bar\baz"
    
    [foo]

   

    <p><a href="/url%5Cbar*baz" title="foo&quot;bar\baz">foo</a></p>

A link can come before its corresponding definition:  
[Example 168](https://github.github.com/gfm/#example-168)  

    [foo]
    
    [foo]: url

   

    <p><a href="url">foo</a></p>

If there are several matching definitions, the first one takes precedence:  
[Example 169](https://github.github.com/gfm/#example-169)  

    [foo]
    
    [foo]: first
    [foo]: second

   

    <p><a href="first">foo</a></p>

As noted in the section on [Links](https://github.github.com/gfm/#links), matching of labels is case-insensitive (see [matches](https://github.github.com/gfm/#matches)).  
[Example 170](https://github.github.com/gfm/#example-170)  

    [FOO]: /url
    
    [Foo]

   

    <p><a href="/url">Foo</a></p>

[Example 171](https://github.github.com/gfm/#example-171)  

    [ΑΓΩ]: /φου
    
    [αγω]

   

    <p><a href="/%CF%86%CE%BF%CF%85">αγω</a></p>

Here is a link reference definition with no corresponding link. It contributes nothing to the document.  
[Example 172](https://github.github.com/gfm/#example-172)  

    [foo]: /url

   

Here is another one:  
[Example 173](https://github.github.com/gfm/#example-173)  

    [
    foo
    ]: /url
    bar

   

    <p>bar</p>

This is not a link reference definition, because there are [non-whitespace characters](https://github.github.com/gfm/#non-whitespace-character) after the title:  
[Example 174](https://github.github.com/gfm/#example-174)  

    [foo]: /url "title" ok

   

    <p>[foo]: /url &quot;title&quot; ok</p>

This is a link reference definition, but it has no title:  
[Example 175](https://github.github.com/gfm/#example-175)  

    [foo]: /url
    "title" ok

   

    <p>&quot;title&quot; ok</p>

This is not a link reference definition, because it is indented four spaces:  
[Example 176](https://github.github.com/gfm/#example-176)  

        [foo]: /url "title"
    
    [foo]

   

    <pre><code>[foo]: /url &quot;title&quot;
    </code></pre>
    <p>[foo]</p>

This is not a link reference definition, because it occurs inside a code block:  
[Example 177](https://github.github.com/gfm/#example-177)  

    ```
    [foo]: /url
    ```
    
    [foo]

   

    <pre><code>[foo]: /url
    </code></pre>
    <p>[foo]</p>

A [link reference definition](https://github.github.com/gfm/#link-reference-definition) cannot interrupt a paragraph.  
[Example 178](https://github.github.com/gfm/#example-178)  

    Foo
    [bar]: /baz
    
    [bar]

   

    <p>Foo
    [bar]: /baz</p>
    <p>[bar]</p>

However, it can directly follow other block elements, such as headings and thematic breaks, and it need not be followed by a blank line.  
[Example 179](https://github.github.com/gfm/#example-179)  

    # [Foo]
    [foo]: /url
    > bar

   

    <h1><a href="/url">Foo</a></h1>
    <blockquote>
    <p>bar</p>
    </blockquote>

Example 179.5   
```md
[foo]: /url
bar
===
[foo]
```

```html
<h1>bar</h1>
<p><a href="/url">foo</a></p>
```

Example 179.75   
```md
[foo]: /url
===
[foo]
```

```html
<p>===
<a href="/url">foo</a></p>
```

Several [link reference definitions](https://github.github.com/gfm/#link-reference-definition) can occur one after another, without intervening blank lines.  
[Example 180](https://github.github.com/gfm/#example-180)  

    [foo]: /foo-url "foo"
    [bar]: /bar-url
      "bar"
    [baz]: /baz-url
    
    [foo],
    [bar],
    [baz]

   

    <p><a href="/foo-url" title="foo">foo</a>,
    <a href="/bar-url" title="bar">bar</a>,
    <a href="/baz-url">baz</a></p>

[Link reference definitions](https://github.github.com/gfm/#link-reference-definition) can occur inside block containers, like lists and block quotations. They affect the entire document, not just the container in which they are defined:  
[Example 181](https://github.github.com/gfm/#example-181)  

    [foo]
    
    > [foo]: /url

   

    <p><a href="/url">foo</a></p>
    <blockquote>
    </blockquote>

Whether something is a [link reference definition] is independent of whether the link reference it defines is used in the document.  Thus, for example, the following document contains just a link reference definition, and no visible content:

```````````````````````````````` md
[foo]: /url
````````````````````````````````