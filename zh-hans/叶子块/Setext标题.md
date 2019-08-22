### Setext 标题

[setext 标题](https://github.github.com/gfm/#setext-heading)由一行或多行文本组成，每行包含至少一个[非空字符](https://github.github.com/gfm/#non-whitespace-character)，不超过 3 个空格缩进，后跟 [setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)。文本行必须是这样的，如果后面没有跟 setext 标题下划线，它们将被解释为段落：它们不能被解释为[代码围栏]((https://github.github.com/gfm/#code-fence))，[ATX 标题](https://github.github.com/gfm/#atx-headings)，[块引用](https://github.github.com/gfm/#block-quotes)，[专门的换行](https://github.github.com/gfm/#thematic-breaks)，[列表项](https://github.github.com/gfm/#list-items)或 [HTML 块]((https://github.github.com/gfm/#html-blocks))。

[setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline) 是一系列 `=` 字符或一系列 `-` 字符，不超过 3 个空格缩进和任意数量的尾随空格。如果一行包含单个的 `-`，可以解释为空列表项，它应该以这种方式解释，而不是作为 [setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)的文本。


如果在 [setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)中使用 `=` 字符，则标题为 1 级标题，如果使用 `-` 字符，则标题为 2 级标题。标题的内容是将前面的文本行解析为 CommonMark 内联内容的结果。

通常，setext 标题不必在空白行之前或之后。但是，它不能使段落中断，所以当一个 setext 标题在段落后时，它们之间需要一个空白行。

简单的例子：  
[示例 50](https://github.github.com/gfm/#example-50)  

    Foo *bar*
    =========
    
    Foo *bar*
    ---------

   

    <h1>Foo <em>bar</em></h1>
    <h2>Foo <em>bar</em></h2>

标题的内容可能跨越多行：  
[示例 51](https://github.github.com/gfm/#example-51)  

    Foo *bar
    baz*
    ====

   

    <h1>Foo <em>bar
    baz</em></h1>

下划线可以是任意长度：   
[示例 52](https://github.github.com/gfm/#example-52)  

    Foo
    -------------------------
    
    Foo
    =

   

    <h2>Foo</h2>
    <h1>Foo</h1>


Example 51.5     
这个内容是，作为内联来解析的标题它的原始内容的结果，标题的原始内容形成连接线，并移除初始和末尾空格。

```
  Foo *bar
baz*→
====
```

```
<h1>Foo <em>bar
baz</em></h1>
```

标题内容最多可缩进三个空格，不需要与下划线对齐：  
[示例 53](https://github.github.com/gfm/#example-53)  

       Foo
    ---
    
      Foo
    -----
    
      Foo
      ===

   

    <h2>Foo</h2>
    <h2>Foo</h2>
    <h1>Foo</h1>

缩进四个空格太多了：   
[示例 54](https://github.github.com/gfm/#example-54)  

        Foo
        ---
    
        Foo
    ---

   

    <pre><code>Foo
    ---
    
    Foo
    </code></pre>
    <hr />

setext 标题下划线最多可以缩进三个空格，并且可以有尾随空格：  
[示例 55](https://github.github.com/gfm/#example-55)  

    Foo
       ----

   

    <h2>Foo</h2>

四个空格太多了：   
[示例 56](https://github.github.com/gfm/#example-56)  

    Foo
        ---

   

    <p>Foo
    ---</p>

setext 标题下划线不能包含内部空格：   
[示例 57](https://github.github.com/gfm/#example-57)  

    Foo
    = =
    
    Foo
    --- -

   

    <p>Foo
    = =</p>
    <p>Foo</p>
    <hr />

内容行中的尾随空格不会导致换行：   
[示例 58](https://github.github.com/gfm/#example-58)  

    Foo  
    -----

   

    <h2>Foo</h2>

最后也没有反斜杠：   
[示例 59](https://github.github.com/gfm/#example-59)  

    Foo\
    ----

   

    <h2>Foo\</h2>

由于块结构的优先级优先于内联结构的优先级，因此以下是文本标题：  
[示例 60](https://github.github.com/gfm/#example-60)  

    `Foo
    ----
    `
    
    <a title="a lot
    ---
    of dashes"/>

   

    <h2>`Foo</h2>
    <p>`</p>
    <h2>&lt;a title=&quot;a lot</h2>
    <p>of dashes&quot;/&gt;</p>


setext 标题下划线不能是列表项或块引用中的[懒延续线](https://github.github.com/gfm/#lazy-continuation-line)：   
[示例 61](https://github.github.com/gfm/#example-61)  

    > Foo
    ---

   

    <blockquote>
    <p>Foo</p>
    </blockquote>
    <hr />

[示例 62](https://github.github.com/gfm/#example-62)  

    > foo
    bar
    ===

   

    <blockquote>
    <p>foo
    bar
    ===</p>
    </blockquote>

[示例 63](https://github.github.com/gfm/#example-63)  

    - Foo
    ---

   

    <ul>
    <li>Foo</li>
    </ul>
    <hr />

段落和后续 setext 标题之间需要一个空行，否则该段落将成为标题内容的一部分：   

[示例 64](https://github.github.com/gfm/#example-64)  

    Foo
    Bar
    ---

   

    <h2>Foo
    Bar</h2>

但一般来说，在文本标题之前或之后不需要空白行：  
[示例 65](https://github.github.com/gfm/#example-65)  

    ---
    Foo
    ---
    Bar
    ---
    Baz

   

    <hr />
    <h2>Foo</h2>
    <h2>Bar</h2>
    <p>Baz</p>

Setext 标题不能为空：  
[示例 66](https://github.github.com/gfm/#example-66)  

    
    ====

   

    <p>====</p>

Setext 标题文本行不能解释为段落以外的块结构。因此，这些示例中的破折号线被解释为专门的换行：   
[示例 67](https://github.github.com/gfm/#example-67)  

    ---
    ---

   

    <hr />
    <hr />

[示例 68](https://github.github.com/gfm/#example-68)  

    - foo
    -----

   

    <ul>
    <li>foo</li>
    </ul>
    <hr />

[示例 69](https://github.github.com/gfm/#example-69)  

        foo
    ---

   

    <pre><code>foo
    </code></pre>
    <hr />

[示例 70](https://github.github.com/gfm/#example-70)  

    > foo
    -----

   

    <blockquote>
    <p>foo</p>
    </blockquote>
    <hr />

如果你想要一个带有 `> foo` 的标题作为它的文字文本，你可以使用反斜杠转义：  
[示例 71](https://github.github.com/gfm/#example-71)  

    \> foo
    ------

   

    <h2>&gt; foo</h2>


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
[示例 72](https://github.github.com/gfm/#example-72)  

    Foo
    
    bar
    ---
    baz

   

    <p>Foo</p>
    <h2>bar</h2>
    <p>baz</p>

想要解释 2 的作者可以在专门的换行周围加上空白行，
[示例 73](https://github.github.com/gfm/#example-73)  

    Foo
    bar
    
    ---
    
    baz

   

    <p>Foo
    bar</p>
    <hr />
    <p>baz</p>

或使用不能算作[setext 标题下划线](https://github.github.com/gfm/#setext-heading-underline)的专门的换行，例如  
[示例 74](https://github.github.com/gfm/#example-74)  

    Foo
    bar
    * * *
    baz

   

    <p>Foo
    bar</p>
    <hr />
    <p>baz</p>

想要解释 3 的作者可以使用反斜杠转义：   
[示例 75](https://github.github.com/gfm/#example-75)  

    Foo
    bar
    \---
    baz

   

    <p>Foo
    bar
    ---
    baz</p>

