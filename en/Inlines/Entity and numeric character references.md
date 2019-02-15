### Entity and numeric character references

All valid HTML entity references and numeric character references, except those occuring in code blocks and code spans, are recognized as such and treated as equivalent to the corresponding Unicode characters. Conforming CommonMark parsers need not store information about whether a particular character was represented in the source using a Unicode character or an entity reference.  
[Entity references](https://github.github.com/gfm/#entity-references) consist of `&` + any of the valid HTML5 entity names + `;`. The document [https://html.spec.whatwg.org/multipage/entities.json](https://html.spec.whatwg.org/multipage/entities.json) is used as an authoritative source for the valid entity references and their corresponding code points.  
[Example 314](https://github.github.com/gfm/#example-314)  

    &nbsp; &amp; &copy; &AElig; &Dcaron;
    &frac34; &HilbertSpace; &DifferentialD;
    &ClockwiseContourIntegral; &ngE;

   

    <p>  &amp; © Æ Ď
    ¾ ℋ ⅆ
    ∲ ≧̸</p>

[Decimal numeric character](https://github.github.com/gfm/#decimal-numeric-character) consist of `&#` + a string of 1–7 arabic digits + `;`. A numeric character reference is parsed as the corresponding Unicode character. Invalid Unicode code points will be replaced by the REPLACEMENT CHARACTER (`U+FFFD`). For security reasons, the code point `U+0000` will also be replaced by `U+FFFD`.  
[Example 315](https://github.github.com/gfm/#example-315)  

    &#35; &#1234; &#992; &#0;

   

    <p># Ӓ Ϡ �</p>

[Hexadecimal numeric character](https://github.github.com/gfm/#hexadecimal-numeric-character) consist of `&#` + either `X` or `x` + a string of 1-6 hexadecimal digits + `;`. They too are parsed as the corresponding Unicode character (this time specified with a hexadecimal numeral instead of decimal).  
[Example 316](https://github.github.com/gfm/#example-316)  

    &#X22; &#XD06; &#xcab;

   

    <p>&quot; ആ ಫ</p>

Here are some nonentities:  
[Example 317](https://github.github.com/gfm/#example-317)  

    &nbsp &x; &#; &#x;
    &#987654321;
    &#abcdef0;
    &ThisIsNotDefined; &hi?;

   

    <p>&amp;nbsp &amp;x; &amp;#; &amp;#x;
    &amp;#987654321;
    &amp;#abcdef0;
    &amp;ThisIsNotDefined; &amp;hi?;</p>

Although HTML5 does accept some entity references without a trailing semicolon (such as `&copy`), these are not recognized here, because it makes the grammar too ambiguous:  
[Example 318](https://github.github.com/gfm/#example-318)  

    &copy

   

    <p>&amp;copy</p>

Strings that are not on the list of HTML5 named entities are not recognized as entity references either:  
[Example 319](https://github.github.com/gfm/#example-319)  

    &MadeUpEntity;

   

    <p>&amp;MadeUpEntity;</p>

Entity and numeric character references are recognized in any context besides code spans or code blocks, including URLs, [link titles](https://github.github.com/gfm/#link-title), and [fenced code block](https://github.github.com/gfm/#fenced-code-block) [info strings](https://github.github.com/gfm/#info-string):  
[Example 320](https://github.github.com/gfm/#example-320)  

    <a href="&ouml;&ouml;.html">

   

    <a href="&ouml;&ouml;.html">

[Example 321](https://github.github.com/gfm/#example-321)  

    [foo](/f&ouml;&ouml; "f&ouml;&ouml;")

   

    <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>

[Example 322](https://github.github.com/gfm/#example-322)  

    [foo]
    
    [foo]: /f&ouml;&ouml; "f&ouml;&ouml;"

   

    <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>

[Example 323](https://github.github.com/gfm/#example-323)  

    ``` f&ouml;&ouml;
    foo
    ```

   

    <pre><code class="language-föö">foo
    </code></pre>

Entity and numeric character references are treated as literal text in code spans and code blocks:  
[Example 324](https://github.github.com/gfm/#example-324)  

    `f&ouml;&ouml;`

   

    <p><code>f&amp;ouml;&amp;ouml;</code></p>

[Example 325](https://github.github.com/gfm/#example-325)  

        f&ouml;f&ouml;

   

    <pre><code>f&amp;ouml;f&amp;ouml;
    </code></pre>
