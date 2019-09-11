### Setext 标题
{{($page.frontmatter.start = 50) ? null : null}}

[setext 标题](https://github.github.com/gfm/#setext-heading)由一行或多行文本组成，每行包含至少一个[非空字符](https://github.github.com/gfm/#non-whitespace-character)，不超过 3 个空格缩进，后跟 [setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)。文本行必须是这样的，如果后面没有跟 setext 标题下划线，它们将被解释为段落：它们不能被解释为[代码围栏]((https://github.github.com/gfm/#code-fence))，[ATX 标题](https://github.github.com/gfm/#atx-headings)，[块引用](https://github.github.com/gfm/#block-quotes)，[专门的换行](https://github.github.com/gfm/#thematic-breaks)，[列表项](https://github.github.com/gfm/#list-items)或 [HTML 块]((https://github.github.com/gfm/#html-blocks))。

[setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline) 是一系列 `=` 字符或一系列 `-` 字符，不超过 3 个空格缩进和任意数量的尾随空格。如果一行包含单个的 `-`，可以解释为空列表项，它应该以这种方式解释，而不是作为 [setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)的文本。

如果在 [setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)中使用 `=` 字符，则标题为 1 级标题，如果使用 `-` 字符，则标题为 2 级标题。标题的内容是将前面的文本行解析为 CommonMark 内联内容的结果。

通常，setext 标题不必在空白行之前或之后。但是，它不能使段落中断，所以当一个 setext 标题在段落后时，它们之间需要一个空白行。

简单的例子：  
<Example :index="$page.frontmatter.start++"/>

标题的内容可能跨越多行：  
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

下划线可以是任意长度：   
<Example :index="$page.frontmatter.start++"/>

标题内容最多可缩进三个空格，不需要与下划线对齐：  
<Example :index="$page.frontmatter.start++"/>

缩进四个空格太多了：   
<Example :index="$page.frontmatter.start++"/>

setext 标题下划线最多可以缩进三个空格，并且可以有尾随空格：  
<Example :index="$page.frontmatter.start++"/>

四个空格太多了：   
<Example :index="$page.frontmatter.start++"/>

setext 标题下划线不能包含内部空格：   
<Example :index="$page.frontmatter.start++"/>

内容行中的尾随空格不会导致换行：    
<Example :index="$page.frontmatter.start++"/>

最后也没有反斜杠：    
<Example :index="$page.frontmatter.start++"/>

由于块结构的优先级优先于内联结构的优先级，因此以下是文本标题：  
<Example :index="$page.frontmatter.start++"/>

setext 标题下划线不能是列表项或块引用中的[懒延续线](https://github.github.com/gfm/#lazy-continuation-line)：   
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

段落和后续 setext 标题之间需要一个空行，否则该段落将成为标题内容的一部分：   
<Example :index="$page.frontmatter.start++"/>

但一般来说，在文本标题之前或之后不需要空白行：  
<Example :index="$page.frontmatter.start++"/>

Setext 标题不能为空：  
<Example :index="$page.frontmatter.start++"/>

Setext 标题文本行不能解释为段落以外的块结构。因此，这些示例中的破折号线被解释为专门的换行：   
<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

<Example :index="$page.frontmatter.start++"/>

如果你想要一个带有 `> foo` 的标题作为它的文字文本，你可以使用反斜杠转义：  
<Example :index="$page.frontmatter.start++"/>

**兼容性说明：** 大多数现有的 Markdown 实现不允许 setext 标题的文本跨越多行。 但是对于如何解释没有达成共识

    Foo
    bar
    ---
    baz

人们可以找到四种不同的解释：

1. 段落 “Foo”，标题 “bar”，段落 “baz”
2. 段落 “Foo bar”，专门的换行，段落 “baz”
3. 段落 “Foo bar  -  baz”
4. 标题为 “Foo bar”，段落 “baz”

我们发现解释 4 最自然，解释 4 通过允许多行标题增加了 CommonMark 的表达能力。 想要解释 1 的作者可以在第一段后面加一个空白行：  
<Example :index="$page.frontmatter.start++"/>

想要解释 2 的作者可以在专门的换行周围加上空白行，
<Example :index="$page.frontmatter.start++"/>

或使用不能算作[setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)的专门的换行，例如  
<Example :index="$page.frontmatter.start++"/>

想要解释 3 的作者可以使用反斜杠转义：   
<Example :index="$page.frontmatter.start++"/>

