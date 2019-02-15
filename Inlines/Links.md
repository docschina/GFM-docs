### Links

A link contains [link text](https://github.github.com/gfm/#link-text) (the visible text), a [link destination](https://github.github.com/gfm/#link-destination) (the URI that is the link destination), and optionally a [link title](https://github.github.com/gfm/#link-title). There are two basic kinds of links in Markdown. In [inline links](https://github.github.com/gfm/#inline-link) the destination and title are given immediately after the link text. In [reference links](https://github.github.com/gfm/#reference-link) the destination and title are defined elsewhere in the document.  
A [link text](https://github.github.com/gfm/#link-text) consists of a sequence of zero or more inline elements enclosed by square brackets (`[` and `]`). The following rules apply:  

*   Links may not contain other links, at any level of nesting. If multiple otherwise valid link definitions appear nested inside each other, the inner-most definition is used.
*   Brackets are allowed in the [link text](https://github.github.com/gfm/#link-text) only if (a) they are backslash-escaped or (b) they appear as a matched pair of brackets, with an open bracket `[`, a sequence of zero or more inlines, and a close bracket `]`.
*   Backtick [code spans](https://github.github.com/gfm/#code-spans), [autolinks](https://github.github.com/gfm/#autolinks), and raw [HTML tags](https://github.github.com/gfm/#html-tag) bind more tightly than the brackets in link text. Thus, for example, ``[foo`]` `` could not be a link text, since the second `]` is part of a code span.
*   The brackets in link text bind more tightly than markers for [emphasis and strong emphasis](https://github.github.com/gfm/#emphasis-and-strong-emphasis). Thus, for example, `*[foo*](url)` is a link.

A [link destination](https://github.github.com/gfm/#link-destination) consists of either  

*   a sequence of zero or more characters between an opening `<` and a closing `>` that contains no line breaks or unescaped `<` or `>` characters, or
*   a nonempty sequence of characters that does not include ASCII space or control characters, and includes parentheses only if (a) they are backslash-escaped or (b) they are part of a balanced pair of unescaped parentheses. (Implementations may impose limits on parentheses nesting to avoid performance issues, but at least three levels of nesting should be supported.)

A [link title](https://github.github.com/gfm/#link-title) consists of either  

*   a sequence of zero or more characters between straight double-quote characters (`"`), including a `"`character only if it is backslash-escaped, or
*   a sequence of zero or more characters between straight single-quote characters (`'`), including a `'`character only if it is backslash-escaped, or
*   a sequence of zero or more characters between matching parentheses (`(...)`), including a `)`character only if it is backslash-escaped.

Although [link titles](https://github.github.com/gfm/#link-title) may span multiple lines, they may not contain a [blank line](https://github.github.com/gfm/#blank-line).  
An [inline link](https://github.github.com/gfm/#inline-link) consists of a [link text](https://github.github.com/gfm/#link-text) followed immediately by a left parenthesis `(`, optional [whitespace](https://github.github.com/gfm/#whitespace), an optional [link destination](https://github.github.com/gfm/#link-destination), an optional [link title](https://github.github.com/gfm/#link-title) separated from the link destination by [whitespace](https://github.github.com/gfm/#whitespace), optional [whitespace](https://github.github.com/gfm/#whitespace), and a right parenthesis `)`. The link’s text consists of the inlines contained in the [link text](https://github.github.com/gfm/#link-text)(excluding the enclosing square brackets). The link’s URI consists of the link destination, excluding enclosing `<...>` if present, with backslash-escapes in effect as described above. The link’s title consists of the link title, excluding its enclosing delimiters, with backslash-escapes in effect as described above.  
Here is a simple inline link:  
[Example 474](https://github.github.com/gfm/#example-474)  

    [link](/uri "title")

   

    <p><a href="/uri" title="title">link</a></p>

The title may be omitted:  
[Example 475](https://github.github.com/gfm/#example-475)  

    [link](/uri)

   

    <p><a href="/uri">link</a></p>

Both the title and the destination may be omitted:  
[Example 476](https://github.github.com/gfm/#example-476)  

    [link]()

   

    <p><a href="">link</a></p>

[Example 477](https://github.github.com/gfm/#example-477)  

    [link](<>)

   

    <p><a href="">link</a></p>

The destination can only contain spaces if it is enclosed in pointy brackets:  
[Example 478](https://github.github.com/gfm/#example-478)  

    [link](/my uri)

   

    <p>[link](/my uri)</p>

[Example 479](https://github.github.com/gfm/#example-479)  

    [link](</my uri>)

   

    <p><a href="/my%20uri">link</a></p>

The destination cannot contain line breaks, even if enclosed in pointy brackets:  
[Example 480](https://github.github.com/gfm/#example-480)  

    [link](foo
    bar)

   

    <p>[link](foo
    bar)</p>

[Example 481](https://github.github.com/gfm/#example-481)  

    [link](<foo
    bar>)

   

    <p>[link](<foo
    bar>)</p>

Parentheses inside the link destination may be escaped:  
[Example 482](https://github.github.com/gfm/#example-482)  

    [link](\(foo\))

   

    <p><a href="(foo)">link</a></p>

Any number of parentheses are allowed without escaping, as long as they are balanced:  
[Example 483](https://github.github.com/gfm/#example-483)  

    [link](foo(and(bar)))

   

    <p><a href="foo(and(bar))">link</a></p>

However, if you have unbalanced parentheses, you need to escape or use the `<...>` form:  
[Example 484](https://github.github.com/gfm/#example-484)  

    [link](foo\(and\(bar\))

   

    <p><a href="foo(and(bar)">link</a></p>

[Example 485](https://github.github.com/gfm/#example-485)  

    [link](<foo(and(bar)>)

   

    <p><a href="foo(and(bar)">link</a></p>

Parentheses and other symbols can also be escaped, as usual in Markdown:  
[Example 486](https://github.github.com/gfm/#example-486)  

    [link](foo\)\:)

   

    <p><a href="foo):">link</a></p>

A link can contain fragment identifiers and queries:  
[Example 487](https://github.github.com/gfm/#example-487)  

    [link](#fragment)
    
    [link](http://example.com#fragment)
    
    [link](http://example.com?foo=3#frag)

   

    <p><a href="#fragment">link</a></p>
    <p><a href="http://example.com#fragment">link</a></p>
    <p><a href="http://example.com?foo=3#frag">link</a></p>

Note that a backslash before a non-escapable character is just a backslash:  
[Example 488](https://github.github.com/gfm/#example-488)  

    [link](foo\bar)

   

    <p><a href="foo%5Cbar">link</a></p>

URL-escaping should be left alone inside the destination, as all URL-escaped characters are also valid URL characters. Entity and numerical character references in the destination will be parsed into the corresponding Unicode code points, as usual. These may be optionally URL-escaped when written as HTML, but this spec does not enforce any particular policy for rendering URLs in HTML or other formats. Renderers may make different decisions about how to escape or normalize URLs in the output.  
[Example 489](https://github.github.com/gfm/#example-489)  

    [link](foo%20b&auml;)

   

    <p><a href="foo%20b%C3%A4">link</a></p>

Note that, because titles can often be parsed as destinations, if you try to omit the destination and keep the title, you’ll get unexpected results:  
[Example 490](https://github.github.com/gfm/#example-490)  

    [link]("title")

   

    <p><a href="%22title%22">link</a></p>

Titles may be in single quotes, double quotes, or parentheses:  
[Example 491](https://github.github.com/gfm/#example-491)  

    [link](/url "title")
    [link](/url 'title')
    [link](/url (title))

   

    <p><a href="/url" title="title">link</a>
    <a href="/url" title="title">link</a>
    <a href="/url" title="title">link</a></p>

Backslash escapes and entity and numeric character references may be used in titles:  
[Example 492](https://github.github.com/gfm/#example-492)  

    [link](/url "title \"&quot;")

   

    <p><a href="/url" title="title &quot;&quot;">link</a></p>

Titles must be separated from the link using a [whitespace](https://github.github.com/gfm/#whitespace). Other [Unicode whitespace](https://github.github.com/gfm/#unicode-whitespace) like non-breaking space doesn’t work.  
[Example 493](https://github.github.com/gfm/#example-493)  

    [link](/url "title")

   

    <p><a href="/url%C2%A0%22title%22">link</a></p>

Nested balanced quotes are not allowed without escaping:  
[Example 494](https://github.github.com/gfm/#example-494)  

    [link](/url "title "and" title")

   

    <p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>

But it is easy to work around this by using a different quote type:  
[Example 495](https://github.github.com/gfm/#example-495)  

    [link](/url 'title "and" title')

   

    <p><a href="/url" title="title &quot;and&quot; title">link</a></p>

(Note: `Markdown.pl` did allow double quotes inside a double-quoted title, and its test suite included a test demonstrating this. But it is hard to see a good rationale for the extra complexity this brings, since there are already many ways—backslash escaping, entity and numeric character references, or using a different quote type for the enclosing title—to write titles containing double quotes. `Markdown.pl`’s handling of titles has a number of other strange features. For example, it allows single-quoted titles in inline links, but not reference links. And, in reference links but not inline links, it allows a title to begin with `"` and end with `)`.`Markdown.pl` 1.0.1 even allows titles with no closing quotation mark, though 1.0.2b8 does not. It seems preferable to adopt a simple, rational rule that works the same way in inline links and link reference definitions.)  
[Whitespace](https://github.github.com/gfm/#whitespace) is allowed around the destination and title:  
[Example 496](https://github.github.com/gfm/#example-496)  

    [link](   /uri
      "title"  )

   

    <p><a href="/uri" title="title">link</a></p>

But it is not allowed between the link text and the following parenthesis:  
[Example 497](https://github.github.com/gfm/#example-497)  

    [link] (/uri)

   

    <p>[link] (/uri)</p>

The link text may contain balanced brackets, but not unbalanced ones, unless they are escaped:  
[Example 498](https://github.github.com/gfm/#example-498)  

    [link [foo [bar]]](/uri)

   

    <p><a href="/uri">link [foo [bar]]</a></p>

[Example 499](https://github.github.com/gfm/#example-499)  

    [link] bar](/uri)

   

    <p>[link] bar](/uri)</p>

[Example 500](https://github.github.com/gfm/#example-500)  

    [link [bar](/uri)

   

    <p>[link <a href="/uri">bar</a></p>

[Example 501](https://github.github.com/gfm/#example-501)  

    [link \[bar](/uri)

   

    <p><a href="/uri">link [bar</a></p>

The link text may contain inline content:  
[Example 502](https://github.github.com/gfm/#example-502)  

    [link *foo **bar** `#`*](/uri)

   

    <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>

[Example 503](https://github.github.com/gfm/#example-503)  

    [![moon](moon.jpg)](/uri)

   

    <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>

However, links may not contain other links, at any level of nesting.  
[Example 504](https://github.github.com/gfm/#example-504)  

    [foo [bar](/uri)](/uri)

   

    <p>[foo <a href="/uri">bar</a>](/uri)</p>

[Example 505](https://github.github.com/gfm/#example-505)  

    [foo *[bar [baz](/uri)](/uri)*](/uri)

   

    <p>[foo <em>[bar <a href="/uri">baz</a>](/uri)</em>](/uri)</p>

[Example 506](https://github.github.com/gfm/#example-506)  

    ![[[foo](uri1)](uri2)](uri3)

   

    <p><img src="uri3" alt="[foo](uri2)" /></p>

These cases illustrate the precedence of link text grouping over emphasis grouping:  
[Example 507](https://github.github.com/gfm/#example-507)  

    *[foo*](/uri)

   

    <p>*<a href="/uri">foo*</a></p>

[Example 508](https://github.github.com/gfm/#example-508)  

    [foo *bar](baz*)

   

    <p><a href="baz*">foo *bar</a></p>

Note that brackets that _aren’t_ part of links do not take precedence:  
[Example 509](https://github.github.com/gfm/#example-509)  

    *foo [bar* baz]

   

    <p><em>foo [bar</em> baz]</p>

These cases illustrate the precedence of HTML tags, code spans, and autolinks over link grouping:  
[Example 510](https://github.github.com/gfm/#example-510)  

    [foo <bar attr="](baz)">

   

    <p>[foo <bar attr="](baz)"></p>

[Example 511](https://github.github.com/gfm/#example-511)  

    [foo`](/uri)`

   

    <p>[foo<code>](/uri)</code></p>

[Example 512](https://github.github.com/gfm/#example-512)  

    [foo<http://example.com/?search=](uri)>

   

    <p>[foo<a href="http://example.com/?search=%5D(uri)">http://example.com/?search=](uri)</a></p>

There are three kinds of [reference link](https://github.github.com/gfm/#reference-link)s: [full](https://github.github.com/gfm/#full-reference-link), [collapsed](https://github.github.com/gfm/#collapsed-reference-link), and [shortcut](https://github.github.com/gfm/#shortcut-reference-link).  
A [full reference link](https://github.github.com/gfm/#full-reference-link) consists of a [link text](https://github.github.com/gfm/#link-text) immediately followed by a [link label](https://github.github.com/gfm/#link-label) that [matches](https://github.github.com/gfm/#matches) a [link reference definition](https://github.github.com/gfm/#link-reference-definition) elsewhere in the document.  
A [link label](https://github.github.com/gfm/#link-label) begins with a left bracket (`[`) and ends with the first right bracket (`]`) that is not backslash-escaped. Between these brackets there must be at least one [non-whitespace character](https://github.github.com/gfm/#non-whitespace-character). Unescaped square bracket characters are not allowed inside the opening and closing square brackets of [link labels](https://github.github.com/gfm/#link-label). A link label can have at most 999 characters inside the square brackets.  
One label [matches](https://github.github.com/gfm/#matches) another just in case their normalized forms are equal. To normalize a label, strip off the opening and closing brackets, perform the _Unicode case fold_, strip leading and trailing [whitespace](https://github.github.com/gfm/#whitespace) and collapse consecutive internal [whitespace](https://github.github.com/gfm/#whitespace) to a single space. If there are multiple matching reference link definitions, the one that comes first in the document is used. (It is desirable in such cases to emit a warning.)  
The contents of the first link label are parsed as inlines, which are used as the link’s text. The link’s URI and title are provided by the matching [link reference definition](https://github.github.com/gfm/#link-reference-definition).  
Here is a simple example:  
[Example 513](https://github.github.com/gfm/#example-513)  

    [foo][bar]
    
    [bar]: /url "title"

   

    <p><a href="/url" title="title">foo</a></p>

The rules for the [link text](https://github.github.com/gfm/#link-text) are the same as with [inline links](https://github.github.com/gfm/#inline-link). Thus:  
The link text may contain balanced brackets, but not unbalanced ones, unless they are escaped:  
[Example 514](https://github.github.com/gfm/#example-514)  

    [link [foo [bar]]][ref]
    
    [ref]: /uri

   

    <p><a href="/uri">link [foo [bar]]</a></p>

[Example 515](https://github.github.com/gfm/#example-515)  

    [link \[bar][ref]
    
    [ref]: /uri

   

    <p><a href="/uri">link [bar</a></p>

The link text may contain inline content:  
[Example 516](https://github.github.com/gfm/#example-516)  

    [link *foo **bar** `#`*][ref]
    
    [ref]: /uri

   

    <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>

[Example 517](https://github.github.com/gfm/#example-517)  

    [![moon](moon.jpg)][ref]
    
    [ref]: /uri

   

    <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>

However, links may not contain other links, at any level of nesting.  
[Example 518](https://github.github.com/gfm/#example-518)  

    [foo [bar](/uri)][ref]
    
    [ref]: /uri

   

    <p>[foo <a href="/uri">bar</a>]<a href="/uri">ref</a></p>

[Example 519](https://github.github.com/gfm/#example-519)  

    [foo *bar [baz][ref]*][ref]
    
    [ref]: /uri

   

    <p>[foo <em>bar <a href="/uri">baz</a></em>]<a href="/uri">ref</a></p>

(In the examples above, we have two [shortcut reference links](https://github.github.com/gfm/#shortcut-reference-link) instead of one [full reference link](https://github.github.com/gfm/#full-reference-link).)  
The following cases illustrate the precedence of link text grouping over emphasis grouping:  
[Example 520](https://github.github.com/gfm/#example-520)  

    *[foo*][ref]
    
    [ref]: /uri

   

    <p>*<a href="/uri">foo*</a></p>

[Example 521](https://github.github.com/gfm/#example-521)  

    [foo *bar][ref]
    
    [ref]: /uri

   

    <p><a href="/uri">foo *bar</a></p>

These cases illustrate the precedence of HTML tags, code spans, and autolinks over link grouping:  
[Example 522](https://github.github.com/gfm/#example-522)  

    [foo <bar attr="][ref]">
    
    [ref]: /uri

   

    <p>[foo <bar attr="][ref]"></p>

[Example 523](https://github.github.com/gfm/#example-523)  

    [foo`][ref]`
    
    [ref]: /uri

   

    <p>[foo<code>][ref]</code></p>

[Example 524](https://github.github.com/gfm/#example-524)  

    [foo<http://example.com/?search=][ref]>
    
    [ref]: /uri

   

    <p>[foo<a href="http://example.com/?search=%5D%5Bref%5D">http://example.com/?search=][ref]</a></p>

Matching is case-insensitive:  
[Example 525](https://github.github.com/gfm/#example-525)  

    [foo][BaR]
    
    [bar]: /url "title"

   

    <p><a href="/url" title="title">foo</a></p>

Unicode case fold is used:  
[Example 526](https://github.github.com/gfm/#example-526)  

    [Толпой][Толпой] is a Russian word.
    
    [ТОЛПОЙ]: /url

   

    <p><a href="/url">Толпой</a> is a Russian word.</p>

Consecutive internal [whitespace](https://github.github.com/gfm/#whitespace) is treated as one space for purposes of determining matching:  
[Example 527](https://github.github.com/gfm/#example-527)  

    [Foo
      bar]: /url
    
    [Baz][Foo bar]

   

    <p><a href="/url">Baz</a></p>

No [whitespace](https://github.github.com/gfm/#whitespace) is allowed between the [link text](https://github.github.com/gfm/#link-text) and the [link label](https://github.github.com/gfm/#link-label):  
[Example 528](https://github.github.com/gfm/#example-528)  

    [foo] [bar]
    
    [bar]: /url "title"

   

    <p>[foo] <a href="/url" title="title">bar</a></p>

[Example 529](https://github.github.com/gfm/#example-529)  

    [foo]
    [bar]
    
    [bar]: /url "title"

   

    <p>[foo]
    <a href="/url" title="title">bar</a></p>

This is a departure from John Gruber’s original Markdown syntax description, which explicitly allows whitespace between the link text and the link label. It brings reference links in line with [inline links](https://github.github.com/gfm/#inline-link), which (according to both original Markdown and this spec) cannot have whitespace after the link text. More importantly, it prevents inadvertent capture of consecutive [shortcut reference links](https://github.github.com/gfm/#shortcut-reference-link). If whitespace is allowed between the link text and the link label, then in the following we will have a single reference link, not two shortcut reference links, as intended:  

    [foo]
    [bar]
    
    [foo]: /url1
    [bar]: /url2

(Note that [shortcut reference links](https://github.github.com/gfm/#shortcut-reference-link) were introduced by Gruber himself in a beta version of `Markdown.pl`, but never included in the official syntax description. Without shortcut reference links, it is harmless to allow space between the link text and link label; but once shortcut references are introduced, it is too dangerous to allow this, as it frequently leads to unintended results.)  
When there are multiple matching [link reference definitions](https://github.github.com/gfm/#link-reference-definition), the first is used:  
[Example 530](https://github.github.com/gfm/#example-530)  

    [foo]: /url1
    
    [foo]: /url2
    
    [bar][foo]

   

    <p><a href="/url1">bar</a></p>

Note that matching is performed on normalized strings, not parsed inline content. So the following does not match, even though the labels define equivalent inline content:  
[Example 531](https://github.github.com/gfm/#example-531)  

    [bar][foo\!]
    
    [foo!]: /url

   

    <p>[bar][foo!]</p>

[Link labels](https://github.github.com/gfm/#link-label) cannot contain brackets, unless they are backslash-escaped:  
[Example 532](https://github.github.com/gfm/#example-532)  

    [foo][ref[]
    
    [ref[]: /uri

   

    <p>[foo][ref[]</p>
    <p>[ref[]: /uri</p>

[Example 533](https://github.github.com/gfm/#example-533)  

    [foo][ref[bar]]
    
    [ref[bar]]: /uri

   

    <p>[foo][ref[bar]]</p>
    <p>[ref[bar]]: /uri</p>

[Example 534](https://github.github.com/gfm/#example-534)  

    [[[foo]]]
    
    [[[foo]]]: /url

   

    <p>[[[foo]]]</p>
    <p>[[[foo]]]: /url</p>

[Example 535](https://github.github.com/gfm/#example-535)  

    [foo][ref\[]
    
    [ref\[]: /uri

   

    <p><a href="/uri">foo</a></p>

Note that in this example `]` is not backslash-escaped:  
[Example 536](https://github.github.com/gfm/#example-536)  

    [bar\\]: /uri
    
    [bar\\]

   

    <p><a href="/uri">bar\</a></p>

A [link label](https://github.github.com/gfm/#link-label) must contain at least one [non-whitespace character](https://github.github.com/gfm/#non-whitespace-character):  
[Example 537](https://github.github.com/gfm/#example-537)  

    []
    
    []: /uri

   

    <p>[]</p>
    <p>[]: /uri</p>

[Example 538](https://github.github.com/gfm/#example-538)  

    [
     ]
    
    [
     ]: /uri

   

    <p>[
    ]</p>
    <p>[
    ]: /uri</p>

A [collapsed reference link](https://github.github.com/gfm/#collapsed-reference-link) consists of a [link label](https://github.github.com/gfm/#link-label) that [matches](https://github.github.com/gfm/#matches) a [link reference definition](https://github.github.com/gfm/#link-reference-definition) elsewhere in the document, followed by the string `[]`. The contents of the first link label are parsed as inlines, which are used as the link’s text. The link’s URI and title are provided by the matching reference link definition. Thus, `[foo][]` is equivalent to `[foo][foo]`.  
[Example 539](https://github.github.com/gfm/#example-539)  

    [foo][]
    
    [foo]: /url "title"

   

    <p><a href="/url" title="title">foo</a></p>

[Example 540](https://github.github.com/gfm/#example-540)  

    [*foo* bar][]
    
    [*foo* bar]: /url "title"

   

    <p><a href="/url" title="title"><em>foo</em> bar</a></p>

The link labels are case-insensitive:  
[Example 541](https://github.github.com/gfm/#example-541)  

    [Foo][]
    
    [foo]: /url "title"

   

    <p><a href="/url" title="title">Foo</a></p>

As with full reference links, [whitespace](https://github.github.com/gfm/#whitespace) is not allowed between the two sets of brackets:  
[Example 542](https://github.github.com/gfm/#example-542)  

    [foo] 
    []
    
    [foo]: /url "title"

   

    <p><a href="/url" title="title">foo</a>
    []</p>

A [shortcut reference link](https://github.github.com/gfm/#shortcut-reference-link) consists of a [link label](https://github.github.com/gfm/#link-label) that [matches](https://github.github.com/gfm/#matches) a [link reference definition](https://github.github.com/gfm/#link-reference-definition) elsewhere in the document and is not followed by `[]` or a link label. The contents of the first link label are parsed as inlines, which are used as the link’s text. The link’s URI and title are provided by the matching link reference definition. Thus, `[foo]` is equivalent to `[foo][]`.  
[Example 543](https://github.github.com/gfm/#example-543)  

    [foo]
    
    [foo]: /url "title"

   

    <p><a href="/url" title="title">foo</a></p>

[Example 544](https://github.github.com/gfm/#example-544)  

    [*foo* bar]
    
    [*foo* bar]: /url "title"

   

    <p><a href="/url" title="title"><em>foo</em> bar</a></p>

[Example 545](https://github.github.com/gfm/#example-545)  

    [[*foo* bar]]
    
    [*foo* bar]: /url "title"

   

    <p>[<a href="/url" title="title"><em>foo</em> bar</a>]</p>

[Example 546](https://github.github.com/gfm/#example-546)  

    [[bar [foo]
    
    [foo]: /url

   

    <p>[[bar <a href="/url">foo</a></p>

The link labels are case-insensitive:  
[Example 547](https://github.github.com/gfm/#example-547)  

    [Foo]
    
    [foo]: /url "title"

   

    <p><a href="/url" title="title">Foo</a></p>

A space after the link text should be preserved:  
[Example 548](https://github.github.com/gfm/#example-548)  

    [foo] bar
    
    [foo]: /url

   

    <p><a href="/url">foo</a> bar</p>

If you just want bracketed text, you can backslash-escape the opening bracket to avoid links:  
[Example 549](https://github.github.com/gfm/#example-549)  

    \[foo]
    
    [foo]: /url "title"

   

    <p>[foo]</p>

Note that this is a link, because a link label ends with the first following closing bracket:  
[Example 550](https://github.github.com/gfm/#example-550)  

    [foo*]: /url
    
    *[foo*]

   

    <p>*<a href="/url">foo*</a></p>

Full and compact references take precedence over shortcut references:  
[Example 551](https://github.github.com/gfm/#example-551)  

    [foo][bar]
    
    [foo]: /url1
    [bar]: /url2

   

    <p><a href="/url2">foo</a></p>

[Example 552](https://github.github.com/gfm/#example-552)  

    [foo][]
    
    [foo]: /url1

   

    <p><a href="/url1">foo</a></p>

Inline links also take precedence:  
[Example 553](https://github.github.com/gfm/#example-553)  

    [foo]()
    
    [foo]: /url1

   

    <p><a href="">foo</a></p>

[Example 554](https://github.github.com/gfm/#example-554)  

    [foo](not a link)
    
    [foo]: /url1

   

    <p><a href="/url1">foo</a>(not a link)</p>

In the following case `[bar][baz]` is parsed as a reference, `[foo]` as normal text:  
[Example 555](https://github.github.com/gfm/#example-555)  

    [foo][bar][baz]
    
    [baz]: /url

   

    <p>[foo]<a href="/url">bar</a></p>

Here, though, `[foo][bar]` is parsed as a reference, since `[bar]` is defined:  
[Example 556](https://github.github.com/gfm/#example-556)  

    [foo][bar][baz]
    
    [baz]: /url1
    [bar]: /url2

   

    <p><a href="/url2">foo</a><a href="/url1">baz</a></p>

Here `[foo]` is not parsed as a shortcut reference, because it is followed by a link label (even though `[bar]`is not defined):  
[Example 557](https://github.github.com/gfm/#example-557)  

    [foo][bar][baz]
    
    [baz]: /url1
    [foo]: /url2

   

    <p>[foo]<a href="/url1">bar</a></p>
