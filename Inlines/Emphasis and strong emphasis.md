### Emphasis and strong emphasis

John Gruber’s original [Markdown syntax description](http://daringfireball.net/projects/markdown/syntax#em) says:  

> Markdown treats asterisks (`*`) and underscores (`_`) as indicators of emphasis. Text wrapped with one `*` or `_` will be wrapped with an HTML `<em>` tag; double `*`’s or `_`’s will be wrapped with an HTML `<strong>` tag.

This is enough for most users, but these rules leave much undecided, especially when it comes to nested emphasis. The original `Markdown.pl` test suite makes it clear that triple `***` and `___` delimiters can be used for strong emphasis, and most implementations have also allowed the following patterns:  

    ***strong emph***
    ***strong** in emph*
    ***emph* in strong**
    **in strong *emph***
    *in emph **strong***

The following patterns are less widely supported, but the intent is clear and they are useful (especially in contexts like bibliography entries):  

    *emph *with emph* in it*
    **strong **with strong** in it**

Many implementations have also restricted intraword emphasis to the `*` forms, to avoid unwanted emphasis in words containing internal underscores. (It is best practice to put these in code spans, but users often do not.)  

    internal emphasis: foo*bar*baz
    no emphasis: foo_bar_baz

The rules given below capture all of these patterns, while allowing for efficient parsing strategies that do not backtrack.  
First, some definitions. A [delimiter run](https://github.github.com/gfm/#delimiter-run) is either a sequence of one or more `*` characters that is not preceded or followed by a non-backslash-escaped `*` character, or a sequence of one or more `_` characters that is not preceded or followed by a non-backslash-escaped `_` character.  
A [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run) is a [delimiter run](https://github.github.com/gfm/#delimiter-run) that is (a) not followed by [Unicode whitespace](https://github.github.com/gfm/#unicode-whitespace), and (b) not followed by a [punctuation character](https://github.github.com/gfm/#punctuation-character), or preceded by [Unicode whitespace](https://github.github.com/gfm/#unicode-whitespace) or a [punctuation character](https://github.github.com/gfm/#punctuation-character). For purposes of this definition, the beginning and the end of the line count as Unicode whitespace.  
A [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run) is a [delimiter run](https://github.github.com/gfm/#delimiter-run) that is (a) not preceded by [Unicode whitespace](https://github.github.com/gfm/#unicode-whitespace), and (b) not preceded by a [punctuation character](https://github.github.com/gfm/#punctuation-character), or followed by [Unicode whitespace](https://github.github.com/gfm/#unicode-whitespace) or a [punctuation character](https://github.github.com/gfm/#punctuation-character). For purposes of this definition, the beginning and the end of the line count as Unicode whitespace.  
Here are some examples of delimiter runs.  

*   left-flanking but not right-flanking:  
    
        ***abc
          _abc
        **"abc"
         _"abc"
    
*   right-flanking but not left-flanking:  
    
         abc***
         abc_
        "abc"**
        "abc"_
    
*   Both left and right-flanking:  
    
         abc***def
        "abc"_"def"
    
*   Neither left nor right-flanking:  
    
        abc *** def
        a _ b
    

(The idea of distinguishing left-flanking and right-flanking delimiter runs based on the character before and the character after comes from Roopesh Chander’s [vfmd](http://www.vfmd.org/vfmd-spec/specification/#procedure-for-identifying-emphasis-tags). vfmd uses the terminology “emphasis indicator string” instead of “delimiter run,” and its rules for distinguishing left- and right-flanking runs are a bit more complex than the ones given here.)  
The following rules define emphasis and strong emphasis:  

1.  A single `*` character [can open emphasis](https://github.github.com/gfm/#can-open-emphasis) iff (if and only if) it is part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run).
2.  A single `_` character [can open emphasis](https://github.github.com/gfm/#can-open-emphasis) iff it is part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run) and either (a) not part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run) or (b) part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run) preceded by punctuation.
3.  A single `*` character [can close emphasis](https://github.github.com/gfm/#can-close-emphasis) iff it is part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run).
4.  A single `_` character [can close emphasis](https://github.github.com/gfm/#can-close-emphasis) iff it is part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run) and either (a) not part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run) or (b) part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run) followed by punctuation.
5.  A double `**` [can open strong emphasis](https://github.github.com/gfm/#can-open-strong-emphasis) iff it is part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run).
6.  A double `__` [can open strong emphasis](https://github.github.com/gfm/#can-open-strong-emphasis) iff it is part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run) and either (a) not part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run) or (b) part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run) preceded by punctuation.
7.  A double `**` [can close strong emphasis](https://github.github.com/gfm/#can-close-strong-emphasis) iff it is part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run).
8.  A double `__` [can close strong emphasis](https://github.github.com/gfm/#can-close-strong-emphasis) iff it is part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run) and either (a) not part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run) or (b) part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run) followed by punctuation.
9.  Emphasis begins with a delimiter that [can open emphasis](https://github.github.com/gfm/#can-open-emphasis) and ends with a delimiter that [can close emphasis](https://github.github.com/gfm/#can-close-emphasis), and that uses the same character (`_` or `*`) as the opening delimiter. The opening and closing delimiters must belong to separate [delimiter runs](https://github.github.com/gfm/#delimiter-run). If one of the delimiters can both open and close emphasis, then the sum of the lengths of the delimiter runs containing the opening and closing delimiters must not be a multiple of 3.
10.  Strong emphasis begins with a delimiter that [can open strong emphasis](https://github.github.com/gfm/#can-open-strong-emphasis) and ends with a delimiter that[can close strong emphasis](https://github.github.com/gfm/#can-close-strong-emphasis), and that uses the same character (`_` or `*`) as the opening delimiter. The opening and closing delimiters must belong to separate [delimiter runs](https://github.github.com/gfm/#delimiter-run). If one of the delimiters can both open and close strong emphasis, then the sum of the lengths of the delimiter runs containing the opening and closing delimiters must not be a multiple of 3.
11.  A literal `*` character cannot occur at the beginning or end of `*`\-delimited emphasis or `**`\-delimited strong emphasis, unless it is backslash-escaped.
12.  A literal `_` character cannot occur at the beginning or end of `_`\-delimited emphasis or `__`\-delimited strong emphasis, unless it is backslash-escaped.

Where rules 1–12 above are compatible with multiple parsings, the following principles resolve ambiguity:  

13.  The number of nestings should be minimized. Thus, for example, an interpretation `<strong>...</strong>` is always preferred to `<em><em>...</em></em>`.
14.  An interpretation `<em><strong>...</strong></em>` is always preferred to `<strong><em>...</em></strong>`.
15.  When two potential emphasis or strong emphasis spans overlap, so that the second begins before the first ends and ends after the first ends, the first takes precedence. Thus, for example, `*foo _bar* baz_` is parsed as `<em>foo _bar</em> baz_` rather than `*foo <em>bar* baz</em>`.
16.  When there are two potential emphasis or strong emphasis spans with the same closing delimiter, the shorter one (the one that opens later) takes precedence. Thus, for example, `**foo **bar baz**` is parsed as `**foo <strong>bar baz</strong>` rather than `<strong>foo **bar baz</strong>`.
17.  Inline code spans, links, images, and HTML tags group more tightly than emphasis. So, when there is a choice between an interpretation that contains one of these elements and one that does not, the former always wins. Thus, for example, `*[foo*](bar)` is parsed as `*<a href="bar">foo*</a>` rather than as `<em>[foo</em>](bar)`.

These rules can be illustrated through a series of examples.  
Rule 1:  
[Example 343](https://github.github.com/gfm/#example-343)  

    *foo bar*

   

    <p><em>foo bar</em></p>

This is not emphasis, because the opening `*` is followed by whitespace, and hence not part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run):  
[Example 344](https://github.github.com/gfm/#example-344)  

    a * foo bar*

   

    <p>a * foo bar*</p>

This is not emphasis, because the opening `*` is preceded by an alphanumeric and followed by punctuation, and hence not part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run):  
[Example 345](https://github.github.com/gfm/#example-345)  

    a*"foo"*

   

    <p>a*&quot;foo&quot;*</p>

Unicode nonbreaking spaces count as whitespace, too:  
[Example 346](https://github.github.com/gfm/#example-346)  

    * a *

   

    <p>* a *</p>

Intraword emphasis with `*` is permitted:  
[Example 347](https://github.github.com/gfm/#example-347)  

    foo*bar*

   

    <p>foo<em>bar</em></p>

[Example 348](https://github.github.com/gfm/#example-348)  

    5*6*78

   

    <p>5<em>6</em>78</p>

Rule 2:  
[Example 349](https://github.github.com/gfm/#example-349)  

    _foo bar_

   

    <p><em>foo bar</em></p>

This is not emphasis, because the opening `_` is followed by whitespace:  
[Example 350](https://github.github.com/gfm/#example-350)  

    _ foo bar_

   

    <p>_ foo bar_</p>

This is not emphasis, because the opening `_` is preceded by an alphanumeric and followed by punctuation:  
[Example 351](https://github.github.com/gfm/#example-351)  

    a_"foo"_

   

    <p>a_&quot;foo&quot;_</p>

Emphasis with `_` is not allowed inside words:  
[Example 352](https://github.github.com/gfm/#example-352)  

    foo_bar_

   

    <p>foo_bar_</p>

[Example 353](https://github.github.com/gfm/#example-353)  

    5_6_78

   

    <p>5_6_78</p>

[Example 354](https://github.github.com/gfm/#example-354)  

    пристаням_стремятся_

   

    <p>пристаням_стремятся_</p>

Here `_` does not generate emphasis, because the first delimiter run is right-flanking and the second left-flanking:  
[Example 355](https://github.github.com/gfm/#example-355)  

    aa_"bb"_cc

   

    <p>aa_&quot;bb&quot;_cc</p>

This is emphasis, even though the opening delimiter is both left- and right-flanking, because it is preceded by punctuation:  
[Example 356](https://github.github.com/gfm/#example-356)  

    foo-_(bar)_

   

    <p>foo-<em>(bar)</em></p>

Rule 3:  
This is not emphasis, because the closing delimiter does not match the opening delimiter:  
[Example 357](https://github.github.com/gfm/#example-357)  

    _foo*

   

    <p>_foo*</p>

This is not emphasis, because the closing `*` is preceded by whitespace:  
[Example 358](https://github.github.com/gfm/#example-358)  

    *foo bar *

   

    <p>*foo bar *</p>

A newline also counts as whitespace:  
[Example 359](https://github.github.com/gfm/#example-359)  

    *foo bar
    *

   

    <p>*foo bar
    *</p>

This is not emphasis, because the second `*` is preceded by punctuation and followed by an alphanumeric (hence it is not part of a [right-flanking delimiter run](https://github.github.com/gfm/#right-flanking-delimiter-run):  
[Example 360](https://github.github.com/gfm/#example-360)  

    *(*foo)

   

    <p>*(*foo)</p>

The point of this restriction is more easily appreciated with this example:  
[Example 361](https://github.github.com/gfm/#example-361)  

    *(*foo*)*

   

    <p><em>(<em>foo</em>)</em></p>

Intraword emphasis with `*` is allowed:  
[Example 362](https://github.github.com/gfm/#example-362)  

    *foo*bar

   

    <p><em>foo</em>bar</p>

Rule 4:  
This is not emphasis, because the closing `_` is preceded by whitespace:  
[Example 363](https://github.github.com/gfm/#example-363)  

    _foo bar _

   

    <p>_foo bar _</p>

This is not emphasis, because the second `_` is preceded by punctuation and followed by an alphanumeric:  
[Example 364](https://github.github.com/gfm/#example-364)  

    _(_foo)

   

    <p>_(_foo)</p>

This is emphasis within emphasis:  
[Example 365](https://github.github.com/gfm/#example-365)  

    _(_foo_)_

   

    <p><em>(<em>foo</em>)</em></p>

Intraword emphasis is disallowed for `_`:  
[Example 366](https://github.github.com/gfm/#example-366)  

    _foo_bar

   

    <p>_foo_bar</p>

[Example 367](https://github.github.com/gfm/#example-367)  

    _пристаням_стремятся

   

    <p>_пристаням_стремятся</p>

[Example 368](https://github.github.com/gfm/#example-368)  

    _foo_bar_baz_

   

    <p><em>foo_bar_baz</em></p>

This is emphasis, even though the closing delimiter is both left- and right-flanking, because it is followed by punctuation:  
[Example 369](https://github.github.com/gfm/#example-369)  

    _(bar)_.

   

    <p><em>(bar)</em>.</p>

Rule 5:  
[Example 370](https://github.github.com/gfm/#example-370)  

    **foo bar**

   

    <p><strong>foo bar</strong></p>

This is not strong emphasis, because the opening delimiter is followed by whitespace:  
[Example 371](https://github.github.com/gfm/#example-371)  

    ** foo bar**

   

    <p>** foo bar**</p>

This is not strong emphasis, because the opening `**` is preceded by an alphanumeric and followed by punctuation, and hence not part of a [left-flanking delimiter run](https://github.github.com/gfm/#left-flanking-delimiter-run):  
[Example 372](https://github.github.com/gfm/#example-372)  

    a**"foo"**

   

    <p>a**&quot;foo&quot;**</p>

Intraword strong emphasis with `**` is permitted:  
[Example 373](https://github.github.com/gfm/#example-373)  

    foo**bar**

   

    <p>foo<strong>bar</strong></p>

Rule 6:  
[Example 374](https://github.github.com/gfm/#example-374)  

    __foo bar__

   

    <p><strong>foo bar</strong></p>

This is not strong emphasis, because the opening delimiter is followed by whitespace:  
[Example 375](https://github.github.com/gfm/#example-375)  

    __ foo bar__

   

    <p>__ foo bar__</p>

A newline counts as whitespace:  
[Example 376](https://github.github.com/gfm/#example-376)  

    __
    foo bar__

   

    <p>__
    foo bar__</p>

This is not strong emphasis, because the opening `__` is preceded by an alphanumeric and followed by punctuation:  
[Example 377](https://github.github.com/gfm/#example-377)  

    a__"foo"__

   

    <p>a__&quot;foo&quot;__</p>

Intraword strong emphasis is forbidden with `__`:  
[Example 378](https://github.github.com/gfm/#example-378)  

    foo__bar__

   

    <p>foo__bar__</p>

[Example 379](https://github.github.com/gfm/#example-379)  

    5__6__78

   

    <p>5__6__78</p>

[Example 380](https://github.github.com/gfm/#example-380)  

    пристаням__стремятся__

   

    <p>пристаням__стремятся__</p>

[Example 381](https://github.github.com/gfm/#example-381)  

    __foo, __bar__, baz__

   

    <p><strong>foo, <strong>bar</strong>, baz</strong></p>

This is strong emphasis, even though the opening delimiter is both left- and right-flanking, because it is preceded by punctuation:  
[Example 382](https://github.github.com/gfm/#example-382)  

    foo-__(bar)__

   

    <p>foo-<strong>(bar)</strong></p>

Rule 7:  
This is not strong emphasis, because the closing delimiter is preceded by whitespace:  
[Example 383](https://github.github.com/gfm/#example-383)  

    **foo bar **

   

    <p>**foo bar **</p>

(Nor can it be interpreted as an emphasized `*foo bar *`, because of Rule 11.)  
This is not strong emphasis, because the second `**` is preceded by punctuation and followed by an alphanumeric:  
[Example 384](https://github.github.com/gfm/#example-384)  

    **(**foo)

   

    <p>**(**foo)</p>

The point of this restriction is more easily appreciated with these examples:  
[Example 385](https://github.github.com/gfm/#example-385)  

    *(**foo**)*

   

    <p><em>(<strong>foo</strong>)</em></p>

[Example 386](https://github.github.com/gfm/#example-386)  

    **Gomphocarpus (*Gomphocarpus physocarpus*, syn.
    *Asclepias physocarpa*)**

   

    <p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.
    <em>Asclepias physocarpa</em>)</strong></p>

[Example 387](https://github.github.com/gfm/#example-387)  

    **foo "*bar*" foo**

   

    <p><strong>foo &quot;<em>bar</em>&quot; foo</strong></p>

Intraword emphasis:  
[Example 388](https://github.github.com/gfm/#example-388)  

    **foo**bar

   

    <p><strong>foo</strong>bar</p>

Rule 8:  
This is not strong emphasis, because the closing delimiter is preceded by whitespace:  
[Example 389](https://github.github.com/gfm/#example-389)  

    __foo bar __

   

    <p>__foo bar __</p>

This is not strong emphasis, because the second `__` is preceded by punctuation and followed by an alphanumeric:  
[Example 390](https://github.github.com/gfm/#example-390)  

    __(__foo)

   

    <p>__(__foo)</p>

The point of this restriction is more easily appreciated with this example:  
[Example 391](https://github.github.com/gfm/#example-391)  

    _(__foo__)_

   

    <p><em>(<strong>foo</strong>)</em></p>

Intraword strong emphasis is forbidden with `__`:  
[Example 392](https://github.github.com/gfm/#example-392)  

    __foo__bar

   

    <p>__foo__bar</p>

[Example 393](https://github.github.com/gfm/#example-393)  

    __пристаням__стремятся

   

    <p>__пристаням__стремятся</p>

[Example 394](https://github.github.com/gfm/#example-394)  

    __foo__bar__baz__

   

    <p><strong>foo__bar__baz</strong></p>

This is strong emphasis, even though the closing delimiter is both left- and right-flanking, because it is followed by punctuation:  
[Example 395](https://github.github.com/gfm/#example-395)  

    __(bar)__.

   

    <p><strong>(bar)</strong>.</p>

Rule 9:  
Any nonempty sequence of inline elements can be the contents of an emphasized span.  
[Example 396](https://github.github.com/gfm/#example-396)  

    *foo [bar](/url)*

   

    <p><em>foo <a href="/url">bar</a></em></p>

[Example 397](https://github.github.com/gfm/#example-397)  

    *foo
    bar*

   

    <p><em>foo
    bar</em></p>

In particular, emphasis and strong emphasis can be nested inside emphasis:  
[Example 398](https://github.github.com/gfm/#example-398)  

    _foo __bar__ baz_

   

    <p><em>foo <strong>bar</strong> baz</em></p>

[Example 399](https://github.github.com/gfm/#example-399)  

    _foo _bar_ baz_

   

    <p><em>foo <em>bar</em> baz</em></p>

[Example 400](https://github.github.com/gfm/#example-400)  

    __foo_ bar_

   

    <p><em><em>foo</em> bar</em></p>

[Example 401](https://github.github.com/gfm/#example-401)  

    *foo *bar**

   

    <p><em>foo <em>bar</em></em></p>

[Example 402](https://github.github.com/gfm/#example-402)  

    *foo **bar** baz*

   

    <p><em>foo <strong>bar</strong> baz</em></p>

[Example 403](https://github.github.com/gfm/#example-403)  

    *foo**bar**baz*

   

    <p><em>foo<strong>bar</strong>baz</em></p>

Note that in the preceding case, the interpretation  

    <p><em>foo</em><em>bar<em></em>baz</em></p>

is precluded by the condition that a delimiter that can both open and close (like the `*` after `foo`) cannot form emphasis if the sum of the lengths of the delimiter runs containing the opening and closing delimiters is a multiple of 3.  
For the same reason, we don’t get two consecutive emphasis sections in this example:  
[Example 404](https://github.github.com/gfm/#example-404)  

    *foo**bar*

   

    <p><em>foo**bar</em></p>

The same condition ensures that the following cases are all strong emphasis nested inside emphasis, even when the interior spaces are omitted:  
[Example 405](https://github.github.com/gfm/#example-405)  

    ***foo** bar*

   

    <p><em><strong>foo</strong> bar</em></p>

[Example 406](https://github.github.com/gfm/#example-406)  

    *foo **bar***

   

    <p><em>foo <strong>bar</strong></em></p>

[Example 407](https://github.github.com/gfm/#example-407)  

    *foo**bar***

   

    <p><em>foo<strong>bar</strong></em></p>

Indefinite levels of nesting are possible:  
[Example 408](https://github.github.com/gfm/#example-408)  

    *foo **bar *baz* bim** bop*

   

    <p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>

[Example 409](https://github.github.com/gfm/#example-409)  

    *foo [*bar*](/url)*

   

    <p><em>foo <a href="/url"><em>bar</em></a></em></p>

There can be no empty emphasis or strong emphasis:  
[Example 410](https://github.github.com/gfm/#example-410)  

    ** is not an empty emphasis

   

    <p>** is not an empty emphasis</p>

[Example 411](https://github.github.com/gfm/#example-411)  

    **** is not an empty strong emphasis

   

    <p>**** is not an empty strong emphasis</p>

Rule 10:  
Any nonempty sequence of inline elements can be the contents of an strongly emphasized span.  
[Example 412](https://github.github.com/gfm/#example-412)  

    **foo [bar](/url)**

   

    <p><strong>foo <a href="/url">bar</a></strong></p>

[Example 413](https://github.github.com/gfm/#example-413)  

    **foo
    bar**

   

    <p><strong>foo
    bar</strong></p>

In particular, emphasis and strong emphasis can be nested inside strong emphasis:  
[Example 414](https://github.github.com/gfm/#example-414)  

    __foo _bar_ baz__

   

    <p><strong>foo <em>bar</em> baz</strong></p>

[Example 415](https://github.github.com/gfm/#example-415)  

    __foo __bar__ baz__

   

    <p><strong>foo <strong>bar</strong> baz</strong></p>

[Example 416](https://github.github.com/gfm/#example-416)  

    ____foo__ bar__

   

    <p><strong><strong>foo</strong> bar</strong></p>

[Example 417](https://github.github.com/gfm/#example-417)  

    **foo **bar****

   

    <p><strong>foo <strong>bar</strong></strong></p>

[Example 418](https://github.github.com/gfm/#example-418)  

    **foo *bar* baz**

   

    <p><strong>foo <em>bar</em> baz</strong></p>

[Example 419](https://github.github.com/gfm/#example-419)  

    **foo*bar*baz**

   

    <p><strong>foo<em>bar</em>baz</strong></p>

[Example 420](https://github.github.com/gfm/#example-420)  

    ***foo* bar**

   

    <p><strong><em>foo</em> bar</strong></p>

[Example 421](https://github.github.com/gfm/#example-421)  

    **foo *bar***

   

    <p><strong>foo <em>bar</em></strong></p>

Indefinite levels of nesting are possible:  
[Example 422](https://github.github.com/gfm/#example-422)  

    **foo *bar **baz**
    bim* bop**

   

    <p><strong>foo <em>bar <strong>baz</strong>
    bim</em> bop</strong></p>

[Example 423](https://github.github.com/gfm/#example-423)  

    **foo [*bar*](/url)**

   

    <p><strong>foo <a href="/url"><em>bar</em></a></strong></p>

There can be no empty emphasis or strong emphasis:  
[Example 424](https://github.github.com/gfm/#example-424)  

    __ is not an empty emphasis

   

    <p>__ is not an empty emphasis</p>

[Example 425](https://github.github.com/gfm/#example-425)  

    ____ is not an empty strong emphasis

   

    <p>____ is not an empty strong emphasis</p>

Rule 11:  
[Example 426](https://github.github.com/gfm/#example-426)  

    foo ***

   

    <p>foo ***</p>

[Example 427](https://github.github.com/gfm/#example-427)  

    foo *\**

   

    <p>foo <em>*</em></p>

[Example 428](https://github.github.com/gfm/#example-428)  

    foo *_*

   

    <p>foo <em>_</em></p>

[Example 429](https://github.github.com/gfm/#example-429)  

    foo *****

   

    <p>foo *****</p>

[Example 430](https://github.github.com/gfm/#example-430)  

    foo **\***

   

    <p>foo <strong>*</strong></p>

[Example 431](https://github.github.com/gfm/#example-431)  

    foo **_**

   

    <p>foo <strong>_</strong></p>

Note that when delimiters do not match evenly, Rule 11 determines that the excess literal `*` characters will appear outside of the emphasis, rather than inside it:  
[Example 432](https://github.github.com/gfm/#example-432)  

    **foo*

   

    <p>*<em>foo</em></p>

[Example 433](https://github.github.com/gfm/#example-433)  

    *foo**

   

    <p><em>foo</em>*</p>

[Example 434](https://github.github.com/gfm/#example-434)  

    ***foo**

   

    <p>*<strong>foo</strong></p>

[Example 435](https://github.github.com/gfm/#example-435)  

    ****foo*

   

    <p>***<em>foo</em></p>

[Example 436](https://github.github.com/gfm/#example-436)  

    **foo***

   

    <p><strong>foo</strong>*</p>

[Example 437](https://github.github.com/gfm/#example-437)  

    *foo****

   

    <p><em>foo</em>***</p>

Rule 12:  
[Example 438](https://github.github.com/gfm/#example-438)  

    foo ___

   

    <p>foo ___</p>

[Example 439](https://github.github.com/gfm/#example-439)  

    foo _\__

   

    <p>foo <em>_</em></p>

[Example 440](https://github.github.com/gfm/#example-440)  

    foo _*_

   

    <p>foo <em>*</em></p>

[Example 441](https://github.github.com/gfm/#example-441)  

    foo _____

   

    <p>foo _____</p>

[Example 442](https://github.github.com/gfm/#example-442)  

    foo __\___

   

    <p>foo <strong>_</strong></p>

[Example 443](https://github.github.com/gfm/#example-443)  

    foo __*__

   

    <p>foo <strong>*</strong></p>

[Example 444](https://github.github.com/gfm/#example-444)  

    __foo_

   

    <p>_<em>foo</em></p>

Note that when delimiters do not match evenly, Rule 12 determines that the excess literal `_` characters will appear outside of the emphasis, rather than inside it:  
[Example 445](https://github.github.com/gfm/#example-445)  

    _foo__

   

    <p><em>foo</em>_</p>

[Example 446](https://github.github.com/gfm/#example-446)  

    ___foo__

   

    <p>_<strong>foo</strong></p>

[Example 447](https://github.github.com/gfm/#example-447)  

    ____foo_

   

    <p>___<em>foo</em></p>

[Example 448](https://github.github.com/gfm/#example-448)  

    __foo___

   

    <p><strong>foo</strong>_</p>

[Example 449](https://github.github.com/gfm/#example-449)  

    _foo____

   

    <p><em>foo</em>___</p>

Rule 13 implies that if you want emphasis nested directly inside emphasis, you must use different delimiters:  
[Example 450](https://github.github.com/gfm/#example-450)  

    **foo**

   

    <p><strong>foo</strong></p>

[Example 451](https://github.github.com/gfm/#example-451)  

    *_foo_*

   

    <p><em><em>foo</em></em></p>

[Example 452](https://github.github.com/gfm/#example-452)  

    __foo__

   

    <p><strong>foo</strong></p>

[Example 453](https://github.github.com/gfm/#example-453)  

    _*foo*_

   

    <p><em><em>foo</em></em></p>

However, strong emphasis within strong emphasis is possible without switching delimiters:  
[Example 454](https://github.github.com/gfm/#example-454)  

    ****foo****

   

    <p><strong><strong>foo</strong></strong></p>

[Example 455](https://github.github.com/gfm/#example-455)  

    ____foo____

   

    <p><strong><strong>foo</strong></strong></p>

Rule 13 can be applied to arbitrarily long sequences of delimiters:  
[Example 456](https://github.github.com/gfm/#example-456)  

    ******foo******

   

    <p><strong><strong><strong>foo</strong></strong></strong></p>

Rule 14:  
[Example 457](https://github.github.com/gfm/#example-457)  

    ***foo***

   

    <p><em><strong>foo</strong></em></p>

[Example 458](https://github.github.com/gfm/#example-458)  

    _____foo_____

   

    <p><em><strong><strong>foo</strong></strong></em></p>

Rule 15:  
[Example 459](https://github.github.com/gfm/#example-459)  

    *foo _bar* baz_

   

    <p><em>foo _bar</em> baz_</p>

[Example 460](https://github.github.com/gfm/#example-460)  

    *foo __bar *baz bim__ bam*

   

    <p><em>foo <strong>bar *baz bim</strong> bam</em></p>

Rule 16:  
[Example 461](https://github.github.com/gfm/#example-461)  

    **foo **bar baz**

   

    <p>**foo <strong>bar baz</strong></p>

[Example 462](https://github.github.com/gfm/#example-462)  

    *foo *bar baz*

   

    <p>*foo <em>bar baz</em></p>

Rule 17:  
[Example 463](https://github.github.com/gfm/#example-463)  

    *[bar*](/url)

   

    <p>*<a href="/url">bar*</a></p>

[Example 464](https://github.github.com/gfm/#example-464)  

    _foo [bar_](/url)

   

    <p>_foo <a href="/url">bar_</a></p>

[Example 465](https://github.github.com/gfm/#example-465)  

    *<img src="foo" title="*"/>

   

    <p>*<img src="foo" title="*"/></p>

[Example 466](https://github.github.com/gfm/#example-466)  

    **<a href="**">

   

    <p>**<a href="**"></p>

[Example 467](https://github.github.com/gfm/#example-467)  

    __<a href="__">

   

    <p>__<a href="__"></p>

[Example 468](https://github.github.com/gfm/#example-468)  

    *a `*`*

   

    <p><em>a <code>*</code></em></p>

[Example 469](https://github.github.com/gfm/#example-469)  

    _a `_`_

   

    <p><em>a <code>_</code></em></p>

[Example 470](https://github.github.com/gfm/#example-470)  

    **a<http://foo.bar/?q=**>

   

    <p>**a<a href="http://foo.bar/?q=**">http://foo.bar/?q=**</a></p>

[Example 471](https://github.github.com/gfm/#example-471)  

    __a<http://foo.bar/?q=__>

   

    <p>__a<a href="http://foo.bar/?q=__">http://foo.bar/?q=__</a></p>