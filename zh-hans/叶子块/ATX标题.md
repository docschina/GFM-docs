{{($page.frontmatter.start = 32) ? null : null}}
### ATX 标题

[ATX 标题]((https://github.github.com/gfm/#atx-heading))由一串字符组成，这些字符被解析为内联内容，它们位于 1-6 个未转义的 `#` 字符的起始序列和任意数量的未转义的 `#` 字符的可选末尾序列之间。`#` 字符的起始序列必须后跟[空格](https://github.github.com/gfm/#space)或行尾。可选的 `#` 的末尾序列之前必须有空格，并且只能有空格。起始的 `#` 字符可以缩进 0-3 个空格。在将标题的原始内容解析为内联内容之前，要先去掉前导空格和后置空格。标题级别等于起始序列中的 `#` 字符数。

简单的标题:    
<Example :index="$page.frontmatter.start++"/>

超过六个 `#` 字符就不是标题：    
<Example :index="$page.frontmatter.start++"/>

除非标题为空，否则 `#` 字符和标题内容之间至少需要一个空格。注意，许多实现目前不需要空格。但是，[原始的 ATX 实现](http://www.aaronsw.com/2002/atx/atx.py)需要此空格，它有助于防止将以下内容解析为标题：    
<Example :index="$page.frontmatter.start++"/>

这不是标题，因为第一个 `＃` 被转义了：    
<Example :index="$page.frontmatter.start++"/>

内容作为内联规则被解析：    
<Example :index="$page.frontmatter.start++"/>

在解析内联内容时忽略前导空格和后置空格：     
<Example :index="$page.frontmatter.start++"/>

允许一到三个空格缩进：    
<Example :index="$page.frontmatter.start++"/>

四个空格太多了：     
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

`#` 字符的末尾序列是可选的：    
<Example :index="$page.frontmatter.start++"/>

它不必与起始序列的长度相同：    
<Example :index="$page.frontmatter.start++"/>

关闭的序列后允许使用空格：    
<Example :index="$page.frontmatter.start++"/>

除了[空格](https://github.github.com/gfm/#space)之外的任何 `#` 字符序列都不是末尾序列，而是作为标题内容的一部分：    
<Example :index="$page.frontmatter.start++"/>

结束序列必须以空格开头：    
<Example :index="$page.frontmatter.start++"/>

反斜杠转义的 `#` 字符不算作结束序列的一部分：    
<Example :index="$page.frontmatter.start++"/>

ATX 标题不需要用空行与周围内容分开，它们可以中断段落：    
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

ATX 标题可以为空：    
<Example :index="$page.frontmatter.start++"/>
