### Raw HTML

Text between `<` and `>` that looks like an HTML tag is parsed as a raw HTML tag and will be rendered in HTML without escaping. Tag and attribute names are not limited to current HTML tags, so custom tags (and even, say, DocBook tags) may be used.  
Here is the grammar for tags:  
A [tag name](https://github.github.com/gfm/#tag-name) consists of an ASCII letter followed by zero or more ASCII letters, digits, or hyphens (`-`).  

An [attribute](https://github.github.com/gfm/#attribute) consists of [whitespace](https://github.github.com/gfm/#whitespace), an [attribute name](https://github.github.com/gfm/#attribute-name), and an optional [attribute value specification](https://github.github.com/gfm/#attribute-value-specification).  

An [attribute name](https://github.github.com/gfm/#attribute-name) consists of an ASCII letter, `_`, or `:`, followed by zero or more ASCII letters, digits, `_`, `.`, `:`, or `-`. (Note: This is the XML specification restricted to ASCII. HTML5 is laxer.)  

An [attribute value specification](https://github.github.com/gfm/#attribute-value-specification) consists of optional [whitespace](https://github.github.com/gfm/#whitespace), a `=` character, optional [whitespace](https://github.github.com/gfm/#whitespace), and an [attribute value](https://github.github.com/gfm/#attribute-value). 
 
An [attribute value](https://github.github.com/gfm/#attribute-value) consists of an [unquoted attribute value](https://github.github.com/gfm/#unquoted-attribute-value), a [single-quoted attribute value](https://github.github.com/gfm/#single-quoted-attribute-value), or a [double-quoted attribute value](https://github.github.com/gfm/#double-quoted-attribute-value).  

An [unquoted attribute value](https://github.github.com/gfm/#unquoted-attribute-value) is a nonempty string of characters not including [whitespace](https://github.github.com/gfm/#whitespace), `"`, `'`, `=`, `<`, `>`, or `` ` ``.  

A [single-quoted attribute value](https://github.github.com/gfm/#single-quoted-attribute-value) consists of `'`, zero or more characters not including `'`, and a final `'`.  

A [double-quoted attribute value](https://github.github.com/gfm/#double-quoted-attribute-value) consists of `"`, zero or more characters not including `"`, and a final `"`.  

An [open tag](https://github.github.com/gfm/#open-tag) consists of a `<` character, a [tag name](https://github.github.com/gfm/#tag-name), zero or more [attributes](https://github.github.com/gfm/#attribute), optional [whitespace](https://github.github.com/gfm/#whitespace), an optional `/` character, and a `>` character.  

A [closing tag](https://github.github.com/gfm/#closing-tag) consists of the string `</`, a [tag name](https://github.github.com/gfm/#tag-name), optional [whitespace](https://github.github.com/gfm/#whitespace), and the character `>`.  

An [HTML comment](https://github.github.com/gfm/#html-comment) consists of `<!--` + _text_ + `-->`, where _text_ does not start with `>` or `->`, does not end with `-`, and does not contain `--`. (See the [HTML5 spec](http://www.w3.org/TR/html5/syntax.html#comments).)  

A [processing instruction](https://github.github.com/gfm/#processing-instruction) consists of the string `<?`, a string of characters not including the string `?>`, and the string `?>`.  

A [declaration](https://github.github.com/gfm/#declaration) consists of the string `<!`, a name consisting of one or more uppercase ASCII letters,[whitespace](https://github.github.com/gfm/#whitespace), a string of characters not including the character `>`, and the character `>`.  

A [CDATA section](https://github.github.com/gfm/#cdata-section) consists of the string `<![CDATA[`, a string of characters not including the string `]]>`, and the string `]]>`.  

An [HTML tag](https://github.github.com/gfm/#html-tag) consists of an [open tag](https://github.github.com/gfm/#open-tag), a [closing tag](https://github.github.com/gfm/#closing-tag), an [HTML comment](https://github.github.com/gfm/#html-comment), a [processing instruction](https://github.github.com/gfm/#processing-instruction), a [declaration](https://github.github.com/gfm/#declaration), or a [CDATA section](https://github.github.com/gfm/#cdata-section).  

Here are some simple open tags:  
[Example 610](https://github.github.com/gfm/#example-610)  

    <a><bab><c2c>

   

    <p><a><bab><c2c></p>

Empty elements:  
[Example 611](https://github.github.com/gfm/#example-611)  

    <a/><b2/>

   

    <p><a/><b2/></p>

[Whitespace](https://github.github.com/gfm/#whitespace) is allowed:  
[Example 612](https://github.github.com/gfm/#example-612)  

    <a  /><b2
    data="foo" >

   

    <p><a  /><b2
    data="foo" ></p>

With attributes:  
[Example 613](https://github.github.com/gfm/#example-613)  

    <a foo="bar" bam = 'baz <em>"</em>'
    _boolean zoop:33=zoop:33 />

   

    <p><a foo="bar" bam = 'baz <em>"</em>'
    _boolean zoop:33=zoop:33 /></p>

Custom tag names can be used:  
[Example 614](https://github.github.com/gfm/#example-614)  

    Foo <responsive-image src="foo.jpg" />

   

    <p>Foo <responsive-image src="foo.jpg" /></p>

Illegal tag names, not parsed as HTML:  
[Example 615](https://github.github.com/gfm/#example-615)  

    <33> <__>

   

    <p>&lt;33&gt; &lt;__&gt;</p>

Illegal attribute names:  
[Example 616](https://github.github.com/gfm/#example-616)  

    <a h*#ref="hi">

   

    <p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>

Illegal attribute values:  
[Example 617](https://github.github.com/gfm/#example-617)  

    <a href="hi'> <a href=hi'>

   

    <p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>

Illegal [whitespace](https://github.github.com/gfm/#whitespace):  
[Example 618](https://github.github.com/gfm/#example-618)  

    < a><
    foo><bar/ >
    <foo bar=baz
    bim!bop />

   

    <p>&lt; a&gt;&lt;
    foo&gt;&lt;bar/ &gt;
    &lt;foo bar=baz
    bim!bop /&gt;</p>

Missing [whitespace](https://github.github.com/gfm/#whitespace):  
[Example 619](https://github.github.com/gfm/#example-619)  

    <a href='bar'title=title>

   

    <p>&lt;a href='bar'title=title&gt;</p>

Closing tags:  
[Example 620](https://github.github.com/gfm/#example-620)  

    </a></foo >

   

    <p></a></foo ></p>

Illegal attributes in closing tag:  
[Example 621](https://github.github.com/gfm/#example-621)  

    </a href="foo">

   

    <p>&lt;/a href=&quot;foo&quot;&gt;</p>

Comments:  
[Example 622](https://github.github.com/gfm/#example-622)  

    foo <!-- this is a
    comment - with hyphen -->

   

    <p>foo <!-- this is a
    comment - with hyphen --></p>

[Example 623](https://github.github.com/gfm/#example-623)  

    foo <!-- not a comment -- two hyphens -->

   

    <p>foo &lt;!-- not a comment -- two hyphens --&gt;</p>

Not comments:  
[Example 624](https://github.github.com/gfm/#example-624)  

    foo <!--> foo -->
    
    foo <!-- foo--->

   

    <p>foo &lt;!--&gt; foo --&gt;</p>
    <p>foo &lt;!-- foo---&gt;</p>

Processing instructions:  
[Example 625](https://github.github.com/gfm/#example-625)  

    foo <?php echo $a; ?>

   

    <p>foo <?php echo $a; ?></p>

Declarations:  
[Example 626](https://github.github.com/gfm/#example-626)  

    foo <!ELEMENT br EMPTY>

   

    <p>foo <!ELEMENT br EMPTY></p>

CDATA sections:  
[Example 627](https://github.github.com/gfm/#example-627)  

    foo <![CDATA[>&<]]>

   

    <p>foo <![CDATA[>&<]]></p>

Entity and numeric character references are preserved in HTML attributes:  
[Example 628](https://github.github.com/gfm/#example-628)  

    foo <a href="&ouml;">

   

    <p>foo <a href="&ouml;"></p>

Backslash escapes do not work in HTML attributes:  
[Example 629](https://github.github.com/gfm/#example-629)  

    foo <a href="\*">

   

    <p>foo <a href="\*"></p>

[Example 630](https://github.github.com/gfm/#example-630)  

    <a href="\"">

   

    <p>&lt;a href=&quot;&quot;&quot;&gt;</p>
