### Images

Syntax for images is like the syntax for links, with one difference. Instead of [link text](https://github.github.com/gfm/#link-text), we have an [image description](https://github.github.com/gfm/#image-description). The rules for this are the same as for [link text](https://github.github.com/gfm/#link-text), except that (a) an image description starts with `![` rather than `[`, and (b) an image description may contain links. An image description has inline elements as its contents. When an image is rendered to HTML, this is standardly used as the image’s `alt` attribute.  
[Example 558](https://github.github.com/gfm/#example-558)  

    ![foo](/url "title")

   

    <p><img src="/url" alt="foo" title="title" /></p>

[Example 559](https://github.github.com/gfm/#example-559)  

    ![foo *bar*]
    
    [foo *bar*]: train.jpg "train & tracks"

   

    <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

[Example 560](https://github.github.com/gfm/#example-560)  

    ![foo ![bar](/url)](/url2)

   

    <p><img src="/url2" alt="foo bar" /></p>

[Example 561](https://github.github.com/gfm/#example-561)  

    ![foo [bar](/url)](/url2)

   

    <p><img src="/url2" alt="foo bar" /></p>

Though this spec is concerned with parsing, not rendering, it is recommended that in rendering to HTML, only the plain string content of the [image description](https://github.github.com/gfm/#image-description) be used. Note that in the above example, the alt attribute’s value is `foo bar`, not `foo [bar](/url)` or `foo <a href="/url">bar</a>`. Only the plain string content is rendered, without formatting.  
[Example 562](https://github.github.com/gfm/#example-562)  

    ![foo *bar*][]
    
    [foo *bar*]: train.jpg "train & tracks"

   

    <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

[Example 563](https://github.github.com/gfm/#example-563)  

    ![foo *bar*][foobar]
    
    [FOOBAR]: train.jpg "train & tracks"

   

    <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

[Example 564](https://github.github.com/gfm/#example-564)  

    ![foo](train.jpg)

   

    <p><img src="train.jpg" alt="foo" /></p>

[Example 565](https://github.github.com/gfm/#example-565)  

    My ![foo bar](/path/to/train.jpg  "title"   )

   

    <p>My <img src="/path/to/train.jpg" alt="foo bar" title="title" /></p>

[Example 566](https://github.github.com/gfm/#example-566)  

    ![foo](<url>)

   

    <p><img src="url" alt="foo" /></p>

[Example 567](https://github.github.com/gfm/#example-567)  

    ![](/url)

   

    <p><img src="/url" alt="" /></p>

Reference-style:  
[Example 568](https://github.github.com/gfm/#example-568)  

    ![foo][bar]
    
    [bar]: /url

   

    <p><img src="/url" alt="foo" /></p>

[Example 569](https://github.github.com/gfm/#example-569)  

    ![foo][bar]
    
    [BAR]: /url

   

    <p><img src="/url" alt="foo" /></p>

Collapsed:  
[Example 570](https://github.github.com/gfm/#example-570)  

    ![foo][]
    
    [foo]: /url "title"

   

    <p><img src="/url" alt="foo" title="title" /></p>

[Example 571](https://github.github.com/gfm/#example-571)  

    ![*foo* bar][]
    
    [*foo* bar]: /url "title"

   

    <p><img src="/url" alt="foo bar" title="title" /></p>

The labels are case-insensitive:  
[Example 572](https://github.github.com/gfm/#example-572)  

    ![Foo][]
    
    [foo]: /url "title"

   

    <p><img src="/url" alt="Foo" title="title" /></p>

As with reference links, [whitespace](https://github.github.com/gfm/#whitespace) is not allowed between the two sets of brackets:  
[Example 573](https://github.github.com/gfm/#example-573)  

    ![foo] 
    []
    
    [foo]: /url "title"

   

    <p><img src="/url" alt="foo" title="title" />
    []</p>

Shortcut:  
[Example 574](https://github.github.com/gfm/#example-574)  

    ![foo]
    
    [foo]: /url "title"

   

    <p><img src="/url" alt="foo" title="title" /></p>

[Example 575](https://github.github.com/gfm/#example-575)  

    ![*foo* bar]
    
    [*foo* bar]: /url "title"

   

    <p><img src="/url" alt="foo bar" title="title" /></p>

Note that link labels cannot contain unescaped brackets:  
[Example 576](https://github.github.com/gfm/#example-576)  

    ![[foo]]
    
    [[foo]]: /url "title"

   

    <p>![[foo]]</p>
    <p>[[foo]]: /url &quot;title&quot;</p>

The link labels are case-insensitive:  
[Example 577](https://github.github.com/gfm/#example-577)  

    ![Foo]
    
    [foo]: /url "title"

   

    <p><img src="/url" alt="Foo" title="title" /></p>

If you just want a literal `!` followed by bracketed text, you can backslash-escape the opening `[`:  
[Example 578](https://github.github.com/gfm/#example-578)  

    !\[foo]
    
    [foo]: /url "title"

   

    <p>![foo]</p>

If you want a link after a literal `!`, backslash-escape the `!`:  
[Example 579](https://github.github.com/gfm/#example-579)  

    \![foo]
    
    [foo]: /url "title"

   

    <p>!<a href="/url" title="title">foo</a></p>