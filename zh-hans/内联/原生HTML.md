### 原生 HTML

看起来像 HTML 标签的`<`和`>`之间的文本被解析为原生 HTML 标签，并且将以 HTML 格式渲染而不会转义。 标签和属性名称不限于当前 HTML 标签，因此可以使用自定义标签（甚至是 DocBook 标签）。  
这是一些标签的语法：  
[标签名称](https://github.github.com/gfm/#tag-name)由 ASCII 字母后跟零个或多个 ASCII 字母，数字或连字符（`-`）组成。
  
[属性](https://github.github.com/gfm/#attribute)由[空格](https://github.github.com/gfm/#whitespace)，[属性名称](https://github.github.com/gfm/#attribute-name)和可选[属性值规范](https://github.github.com/gfm/#attribute-value-specification)组成。
  
[属性名称](https://github.github.com/gfm/#attribute-name)由 ASCII 字母，`_`或`:`组成，后跟零个或多个 ASCII 字母，数字，`_`，`.`，`:`，或者 `-`。 （注意：这是限制为 ASCII 的 XML 规范。HTML5 较宽松。）
  
[属性值规范](https://github.github.com/gfm/#attribute-value-specification)由可选的[空格](https://github.github.com/gfm/#whitespace)，一个`=`字符，可选的[空格](https://github.github.com/gfm/#whitespace)和[属性值](https://github.github.com/gfm/#attribute-value)组成。
  
[属性值](https://github.github.com/gfm/#attribute-value)由[不带引号的属性值](https://github.github.com/gfm/#unquoted-attribute-value)，[单引号属性值](https://github.github.com/gfm/#single-quoted-attribute-value)或[双引用属性值](https://github.github.com/gfm/#double-quoted-attribute-value)组成。
  
[不带引号的属性值](https://github.github.com/gfm/#unquoted-attribute-value)是非空字符串，不包括[空格](https://github.github.com/gfm/#whitespace)，`"`， `'`，`=`， `<`， `>`，或 `` ` ``。
  
[单引号属性值](https://github.github.com/gfm/#single-quoted-attribute-value)由'，零个或多个字符不包括`'`和后面的`'`组成。
  
[双引用属性值](https://github.github.com/gfm/#double-quoted-attribute-value)由“，零个或多个字符不包括`"`和最后一个`"`。
  
[开始标签](https://github.github.com/gfm/#open-tag)由`<`字符，[标签名称](https://github.github.com/gfm/#tag-name)，零个或多个[属性](https://github.github.com/gfm/#attribute)，可选[空格](https://github.github.com/gfm/#whitespace)，可选`/`字符和`>`字符组成。
  
[闭合标签](https://github.github.com/gfm/#closing-tag)由字符串`</`，[标签名称](https://github.github.com/gfm/#tag-name)，可选[空格](https://github.github.com/gfm/#whitespace)和字符`>`组成。
  
[HTML 注释](https://github.github.com/gfm/#html-comment)由`&lt;!--` + 文本 + `-->`组成，其中文本不以`>`或 `->`开头，不以 `-` 结尾，也不包含 `--` 。 （参见 [HTML5 规范](http://www.w3.org/TR/html5/syntax.html#comments)。）
  
[处理指令](https://github.github.com/gfm/#processing-instruction)由字符串`<?`，不包括字符串`?>`的字符串和字符串`?>`组成。
  
[声明](https://github.github.com/gfm/#declaration)由字符串`<!`,一个由一个或多个大写 ASCII 字母组成的名称，[空格](https://github.github.com/gfm/#whitespace)，不包括字符的字符串`>`和字符`>`组成。
  
[CDATA 部分](https://github.github.com/gfm/#cdata-section)由字符串`&lt;![CDATA[`，不包括字符串的字符串`]]>`和字符串`]]>`组成。
  
一个 [HTML 标签](https://github.github.com/gfm/#html-tag) 由[开始标签](https://github.github.com/gfm/#open-tag)，[闭合标签](https://github.github.com/gfm/#closing-tag)，[HTML 注释](https://github.github.com/gfm/#html-comment)，[处理指令](https://github.github.com/gfm/#processing-instruction)，[声明](https://github.github.com/gfm/#declaration)或 [CDATA 部分](https://github.github.com/gfm/#cdata-section)组成。

这里是一些开放标签：  
[示例 610](https://github.github.com/gfm/#example-610)  

    <a><bab><c2c>

   

    <p><a><bab><c2c></p>

空元素：  
[示例 611](https://github.github.com/gfm/#example-611)  

    <a/><b2/>

   

    <p><a/><b2/></p>

允许出现[空格](https://github.github.com/gfm/#whitespace) ：  
[示例 612](https://github.github.com/gfm/#example-612)  

    <a  /><b2
    data="foo" >

   

    <p><a  /><b2
    data="foo" ></p>

带有属性值：  
[示例 613](https://github.github.com/gfm/#example-613)  

    <a foo="bar" bam = 'baz <em>"</em>'
    _boolean zoop:33=zoop:33 />

   

    <p><a foo="bar" bam = 'baz <em>"</em>'
    _boolean zoop:33=zoop:33 /></p>

可以使用自定义标签名称：  
[示例 614](https://github.github.com/gfm/#example-614)  

    Foo <responsive-image src="foo.jpg" />

   

    <p>Foo <responsive-image src="foo.jpg" /></p>

无效标签名称，不会被解析为 HTML：  
[示例 615](https://github.github.com/gfm/#example-615)  

    <33> <__>

   

    <p>&lt;33&gt; &lt;__&gt;</p>

无效的属性名:  
[示例 616](https://github.github.com/gfm/#example-616)  

    <a h*#ref="hi">

   

    <p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>

无效的属性值：  
[示例 617](https://github.github.com/gfm/#example-617)  

    <a href="hi'> <a href=hi'>

   

    <p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>

无效的[空格](https://github.github.com/gfm/#whitespace)：  
[示例 618](https://github.github.com/gfm/#example-618)  

    < a><
    foo><bar/ >
    <foo bar=baz
    bim!bop />

   

    <p>&lt; a&gt;&lt;
    foo&gt;&lt;bar/ &gt;
    &lt;foo bar=baz
    bim!bop /&gt;</p>

[空格](https://github.github.com/gfm/#whitespace)缺失：  
[示例 619](https://github.github.com/gfm/#example-619)  

    <a href='bar'title=title>

   

    <p>&lt;a href='bar'title=title&gt;</p>

闭合标签:  
[示例 620](https://github.github.com/gfm/#example-620)  

    </a></foo >

   

    <p></a></foo ></p>

闭合标签中无效的属性：  
[示例 621](https://github.github.com/gfm/#example-621)  

    </a href="foo">

   

    <p>&lt;/a href=&quot;foo&quot;&gt;</p>

注释：  
[示例 622](https://github.github.com/gfm/#example-622)  

    foo <!-- this is a
    comment - with hyphen -->

   

    <p>foo <!-- this is a
    comment - with hyphen --></p>

[示例 623](https://github.github.com/gfm/#example-623)  

    foo <!-- not a comment -- two hyphens -->

   

    <p>foo &lt;!-- not a comment -- two hyphens --&gt;</p>

无效注释：  
[示例 624](https://github.github.com/gfm/#example-624)  

    foo <!--> foo -->
    
    foo <!-- foo--->

   

    <p>foo &lt;!--&gt; foo --&gt;</p>
    <p>foo &lt;!-- foo---&gt;</p>

处理指令：  
[示例 625](https://github.github.com/gfm/#example-625)  

    foo <?php echo $a; ?>

   

    <p>foo <?php echo $a; ?></p>

声明：  
[示例 626](https://github.github.com/gfm/#example-626)  

    foo <!ELEMENT br EMPTY>

   

    <p>foo <!ELEMENT br EMPTY></p>

CDATA 部分：  
[示例 627](https://github.github.com/gfm/#example-627)  

    foo <![CDATA[>&<]]>

   

    <p>foo <![CDATA[>&<]]></p>

实体和数字字符引用保留在 HTML 属性中  
[示例 628](https://github.github.com/gfm/#example-628)  

    foo <a href="&ouml;">

   

    <p>foo <a href="&ouml;"></p>

反斜杠转义在 HTML 属性中不起作用：  
[示例 629](https://github.github.com/gfm/#example-629)  

    foo <a href="\*">

   

    <p>foo <a href="\*"></p>

[示例 630](https://github.github.com/gfm/#example-630)  

    <a href="\"">

   

    <p>&lt;a href=&quot;&quot;&quot;&gt;</p>
