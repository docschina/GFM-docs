{{($page.frontmatter.start = 632) ? null : null}}
### 原生 HTML

看起来像 HTML 标签的`<`和`>`之间的文本被解析为原生 HTML 标签，并且将以 HTML 格式渲染而不会转义。标签和属性名称不限于当前 HTML 标签，因此可以使用自定义标签（甚至是 DocBook 标签）。  
这是标签的语法：  
[标签名称](https://github.github.com/gfm/#tag-name)由 ASCII 字母后跟零个或多个 ASCII 字母，数字或连字符（`-`）组成。
  
[属性](https://github.github.com/gfm/#attribute)由[空格](https://github.github.com/gfm/#whitespace)，[属性名称](https://github.github.com/gfm/#attribute-name)和可选[属性值规范](https://github.github.com/gfm/#attribute-value-specification)组成。
  
[属性名称](https://github.github.com/gfm/#attribute-name)由 ASCII 字母，`_`或`:`组成，后跟零个或多个 ASCII 字母，数字，`_`，`.`，`:`，或者 `-`。 （注意：这是限制为 ASCII 的 XML 规范。HTML5 较宽松。）
  
[属性值规范](https://github.github.com/gfm/#attribute-value-specification)由可选的[空格](https://github.github.com/gfm/#whitespace)，一个`=`字符，可选的[空格](https://github.github.com/gfm/#whitespace)和[属性值](https://github.github.com/gfm/#attribute-value)组成。
  
[属性值](https://github.github.com/gfm/#attribute-value)由[不带引号的属性值](https://github.github.com/gfm/#unquoted-attribute-value)，[单引号属性值](https://github.github.com/gfm/#single-quoted-attribute-value)或[双引用属性值](https://github.github.com/gfm/#double-quoted-attribute-value)组成。
  
[不带引号的属性值](https://github.github.com/gfm/#unquoted-attribute-value)是非空字符串，不包括[空格](https://github.github.com/gfm/#whitespace)，`"`， `'`，`=`， `<`， `>`，或 `` ` ``。
  
[单引号属性值](https://github.github.com/gfm/#single-quoted-attribute-value)由'，零个或多个不包括`'`的字符和后面的`'`组成。
  
[双引号属性值](https://github.github.com/gfm/#double-quoted-attribute-value)由“，零个或多个不包括`"`的字符和最后一个`"`组成。
  
[开始标签](https://github.github.com/gfm/#open-tag)由`<`字符，[标签名称](https://github.github.com/gfm/#tag-name)，零个或多个[属性](https://github.github.com/gfm/#attribute)，可选[空格](https://github.github.com/gfm/#whitespace)，可选`/`字符和`>`字符组成。
  
[闭合标签](https://github.github.com/gfm/#closing-tag)由字符串`</`，[标签名称](https://github.github.com/gfm/#tag-name)，可选[空格](https://github.github.com/gfm/#whitespace)和字符`>`组成。
  
[HTML 注释](https://github.github.com/gfm/#html-comment)由`&lt;!--` + 文本 + `-->`组成，其中文本不以`>`或 `->`开头，不以 `-` 结尾，也不包含 `--` 。（参考 [HTML5 规范](http://www.w3.org/TR/html5/syntax.html#comments)。）
  
[处理指令](https://github.github.com/gfm/#processing-instruction)由字符串`<?`，不包括`?>`的字符串和字符串`?>`组成。
  
[声明](https://github.github.com/gfm/#declaration)由字符串`<!`,一个由一个或多个大写 ASCII 字母组成的名称，[空格](https://github.github.com/gfm/#whitespace)，不包括`>`字符的字符串和字符`>`组成。
  
[CDATA 部分](https://github.github.com/gfm/#cdata-section)由字符串`&lt;![CDATA[`，不包括`]]>`的字符串和字符串`]]>`组成。
  
一个 [HTML 标签](https://github.github.com/gfm/#html-tag) 由[开始标签](https://github.github.com/gfm/#open-tag)，[闭合标签](https://github.github.com/gfm/#closing-tag)，[HTML 注释](https://github.github.com/gfm/#html-comment)，[处理指令](https://github.github.com/gfm/#processing-instruction)，[声明](https://github.github.com/gfm/#declaration)或 [CDATA 部分](https://github.github.com/gfm/#cdata-section)组成。

这里是一些打开的标签：  
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

允许出现[空格](https://github.github.com/gfm/#whitespace) ：  
<Example :index="$page.frontmatter.start++"/>

带有属性值：  
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

可以使用自定义标签名称：  
<Example :index="$page.frontmatter.start++"/>

无效标签名称，不会被解析为 HTML：  
<Example :index="$page.frontmatter.start++"/>

无效的属性名：  
<Example :index="$page.frontmatter.start++"/>

无效的属性值：  
<Example :index="$page.frontmatter.start++"/>

无效的[空格](https://github.github.com/gfm/#whitespace)：  
<Example :index="$page.frontmatter.start++"/>

[空格](https://github.github.com/gfm/#whitespace)缺失：  
<Example :index="$page.frontmatter.start++"/>

闭合标签:  
<Example :index="$page.frontmatter.start++"/>

闭合标签中属性无效：  
<Example :index="$page.frontmatter.start++"/>

注释：  
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

无效注释：  
<Example :index="$page.frontmatter.start++"/>

处理指令：  
<Example :index="$page.frontmatter.start++"/>

声明：  
<Example :index="$page.frontmatter.start++"/>

CDATA 部分：  
<Example :index="$page.frontmatter.start++"/>

实体和数字字符引用保留在 HTML 属性中  
<Example :index="$page.frontmatter.start++"/>

反斜杠转义在 HTML 属性中不起作用：  
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>
