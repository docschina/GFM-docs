### HTML 块

[HTML 块](https://github.github.com/gfm/#html-block)是一组被视为原生 HTML 的行（并且不会在 HTML 输出中进行转义）。  
  
有七种 [HTML 块](https://github.github.com/gfm/#html-block)，可以通过它们的起始和结束条件来定义。这种块以满足[起始条件](https://github.github.com/gfm/#start-condition)的行开始（在最多三个空格可选缩进之后）。如果没有遇到满足[结束条件](https://github.github.com/gfm/#end-condition)的行，它就以满足匹配结束条件的第一个后续行，或者文档的最后一行，或其他容器块结束。如果第一行同时满足开始条件和结束条件，则该块将仅包含该行。

1. **开始条件：** 行以字符串 `<script`，`<pre` 或 `<style`（不区分大小写）开头，后跟空格，字符串 `>` 或行尾。   

   **结束条件：** 行包含结束标签 `</script>`，`</pre>` 或 `</style>`（不区分大小写;它不需要与起始标签匹配）。  
    
2.  **开始条件：** 行以字符串 `<!--` 开头。

    **结束条件：** 行包含字符串 `-->`。
    
3.  **起始条件：** 行以字符串 `<?` 开头。

    **结束条件：** 行包含字符串 `?>`。
    
4.  **起始条件：** 行以字符串 `<!` 开头，后跟一个大写的 ASCII 字母。

    **结束条件：** 行包含字符 `>`。
    
5.  **起始条件：** 行以字符串 `<![CDATA[` 开头。 

    **结束条件：** 行包含字符 `]]>`。
    
6.  **起始条件：** 行以字符串 `<` 或 `</` 开头，后跟其中一个字符串（不区分大小写）`address`, `article`, `aside`, `base`, `basefont`, `blockquote`, `body`, `caption`, `center`, `col`, `colgroup`, `dd`, `details`, `dialog`, `dir`, `div`, `dl`, `dt`, `fieldset`, `figcaption`, `figure`, `footer`, `form`, `frame`, `frameset`, `h1`, `h2`, `h3`, `h4`, `h5`, `h6`, `head`, `header`, `hr`, `html`, `iframe`, `legend`, `li`, `link`, `main`, `menu`, `menuitem`, `nav`, `noframes`, `ol`, `optgroup`, `option`, `p`, `param`, `section`, `source`, `summary`, `table`, `tbody`, `td`, `tfoot`, `th`, `thead`, `title`, `tr`, `track`, `ul`, 后跟[空格](https://github.github.com/gfm/#whitespace), 在行尾是字符 `>` 或者 `/>`。  

    **结束条件：** 行后跟一个[空行](https://github.github.com/gfm/#blank-line)。
7.  **起始条件：** 行以完整的[打开标签](https://github.github.com/gfm/#open-tag)或[闭合标签](https://github.github.com/gfm/#closing-tag)（除了 `script`，`style` 或 `pre` 之外的任何标签名称）开始，后面只有[空格](https://github.github.com/gfm/#whitespace)或行尾。

    **结束条件：** 行后紧跟[空行](https://github.github.com/gfm/#blank-line)。

HTML 块会一直连续，直到它们被适当的[结束条件](https://github.github.com/gfm/#end-condition)，或文档的最后一行，或其他[容器块](https://github.github.com/gfm/#container-block)关闭。这意味着 HTML 块中可能被识别为起始条件的任何 HTML 都将被解析器忽略并按原样传递，而不会更改解析器的状态。

例如，`<table>` 起头的 HTML 块中的 `<pre>` 不会影响解析器状态; 当 HTML 块由启动条件 6 启动时，它将在任意空白行结束。这可能是令人惊讶的：  
[示例 116](https://github.github.com/gfm/#示例-116)  

    <table><tr><td>
    <pre>
    **Hello**,
    
    _world_.
    </pre>
    </td></tr></table>

   

    <table><tr><td>
    <pre>
    **Hello**,
    <p><em>world</em>.
    </pre></p>
    </td></tr></table>

在这种情况下，HTML 块由换行符终止 `**Hello**` 文本保持逐字逐句且常规的解析，如此周而复始，并有段落，强调的 `world`，内联和块 HTML 伴随。

除类型 7 之外的所有类型的 [HTML 块](https://github.github.com/gfm/#html-blocks)都可能会中断段落。类型 7 的块可能不会中断段落。 （此限制旨在防止对包裹段落中的长标签进行不必要的解释，比如起始的 HTML 块。）

一些简单的例子如下。以下是类型 6 的一些基本的 HTML 块：  
[示例 117](https://github.github.com/gfm/#示例-117)  

    <table>
      <tr>
        <td>
               hi
        </td>
      </tr>
    </table>
    
    okay.

   

    <table>
      <tr>
        <td>
               hi
        </td>
      </tr>
    </table>
    <p>okay.</p>

[示例 118](https://github.github.com/gfm/#示例-118)  

     <div>
      *hello*
             <foo><a>

   

     <div>
      *hello*
             <foo><a>

块也可以以闭合标签开头：  
[示例 119](https://github.github.com/gfm/#示例-119)  

    </div>
    *foo*

   

    </div>
    *foo*

这里我们有两个 HTML 块，它们之间有 Markdown 段落：   
[示例 120](https://github.github.com/gfm/#示例-120)  

    <DIV CLASS="foo">
    
    *Markdown*
    
    </DIV>

   

    <DIV CLASS="foo">
    <p><em>Markdown</em></p>
    </DIV>

第一行上的标签可以是局部的，只要它被分割成有空格的结果：  
[示例 121](https://github.github.com/gfm/#示例-121)  

    <div id="foo"
      class="bar">
    </div>

   

    <div id="foo"
      class="bar">
    </div>

[示例 122](https://github.github.com/gfm/#示例-122)  

    <div id="foo" class="bar
      baz">
    </div>

   

    <div id="foo" class="bar
      baz">
    </div>

无需关闭打开的标签：  
[示例 123](https://github.github.com/gfm/#示例-123)  

    <div>
    *foo*
    
    *bar*

   

    <div>
    *foo*
    <p><em>bar</em></p>

部分标签甚至不需要完成（垃圾进，垃圾出）：   
[示例 124](https://github.github.com/gfm/#示例-124)  

    <div id="foo"
    *hi*

   

    <div id="foo"
    *hi*

[示例 125](https://github.github.com/gfm/#示例-125)  

    <div class
    foo

   

    <div class
    foo

初始标签甚至不需要是有效标签，只要它像一个标签一样：    
[示例 126](https://github.github.com/gfm/#示例-126)  

    <div *???-&&&-<---
    *foo*

   

    <div *???-&&&-<---
    *foo*

在类型 6 的块中，初始标签本身不需要在一行上：  
[示例 127](https://github.github.com/gfm/#示例-127)  

    <div><a href="bar">*foo*</a></div>

   

    <div><a href="bar">*foo*</a></div>

[示例 128](https://github.github.com/gfm/#示例-128)  

    <table><tr><td>
    foo
    </td></tr></table>

   

    <table><tr><td>
    foo
    </td></tr></table>

直到下一个空白行或文档结尾的所有内容都包含在 HTML 块中。因此，在下面的示例中，看起来像 Markdown 代码块的实际上是 HTML 块的一部分，它一直持续到空白行或文档的末尾：
  
[示例 129](https://github.github.com/gfm/#示例-129)  

    <div></div>
    ``` c
    int x = 33;
    ```

   

    <div></div>
    ``` c
    int x = 33;
    ```

要启动带有 _不在_（6）中的块级标签列表中的标签的 [HTML 块](https://github.github.com/gfm/#html-block)，必须将标签单独放在第一行（并且必须完成）：  
[示例 130](https://github.github.com/gfm/#示例-130)  

    <a href="foo">
    *bar*
    </a>

   

    <a href="foo">
    *bar*
    </a>

在类型 7 的块中，[标签名称](https://github.github.com/gfm/#tag-name)可以是任意内容：  
[示例 131](https://github.github.com/gfm/#示例-131)  

    <Warning>
    *bar*
    </Warning>

   

    <Warning>
    *bar*
    </Warning>

[示例 132](https://github.github.com/gfm/#示例-132)  

    <i class="foo">
    *bar*
    </i>

   

    <i class="foo">
    *bar*
    </i>

[示例 133](https://github.github.com/gfm/#示例-133)  

    </ins>
    *bar*

   

    </ins>
    *bar*

这些规则旨在允许我们使用可用作块级或内联级标签的标签。`<del>` 标签是一个很好的示例。我们可以用三种不同的方式用 `<del>` 标签包围内容。在这种情况下，我们会得到一个原生的 HTML 块，因为 `<del>` 标签本身就是一行：  
[示例 134](https://github.github.com/gfm/#示例-134)  

    <del>
    *foo*
    </del>

   

    <del>
    *foo*
    </del>

在这种情况下，我们会得到一个原生的 HTML 块，它只包含 `<del>` 标签（因为它以下面的空行结束）。所以内容被 CommonMark 规范解释：  
[示例 135](https://github.github.com/gfm/#示例-135)  

    <del>
    
    *foo*
    
    </del>

   

    <del>
    <p><em>foo</em></p>
    </del>

最后，在这种情况下，`<del>` 标签在 CommonMark 段落中被解释为原生 HTML。 （因为标签本身不在一行，我们得到内联 HTML 而不是 HTML 块。）  
[示例 136](https://github.github.com/gfm/#示例-136)   

    <del>*foo*</del>

   

    <p><del><em>foo</em></del></p>

旨在包含字面量内容（`script`, `style`, `pre`），注释，处理指令和声明的 HTML 标签，它们的处理方式有所不同。这些块不是以第一个空行结束，而是在包含相应结束标签的第一行结束。因此，这些块可以包含空行： 
一个 pre 标签（类型 1）：  
[示例 137](https://github.github.com/gfm/#示例-137)  

    <pre language="haskell"><code>
    import Text.HTML.TagSoup
    
    main :: IO ()
    main = print $ parseTags tags
    </code></pre>
    okay

   

    <pre language="haskell"><code>
    import Text.HTML.TagSoup
    
    main :: IO ()
    main = print $ parseTags tags
    </code></pre>
    <p>okay</p>

一个 script 标签（类型 1）：  
[示例 138](https://github.github.com/gfm/#示例-138)  

    <script type="text/javascript">
    // JavaScript 示例
    
    document.getElementById("demo").innerHTML = "Hello JavaScript!";
    </script>
    okay

   

    <script type="text/javascript">
    // JavaScript 示例
    
    document.getElementById("demo").innerHTML = "Hello JavaScript!";
    </script>
    <p>okay</p>

一个 style 标签（类型 1）：  
[示例 139](https://github.github.com/gfm/#示例-139)  

    <style
      type="text/css">
    h1 {color:red;}
    
    p {color:blue;}
    </style>
    okay

   

    <style
      type="text/css">
    h1 {color:red;}
    
    p {color:blue;}
    </style>
    <p>okay</p>

如果没有匹配的结束标签，则该块将在文档的末尾（或封闭的[块引号](https://github.github.com/gfm/#block-quotes)[列表项](https://github.github.com/gfm/#list-items)）结束：

[示例 140](https://github.github.com/gfm/#示例-140)  

    <style
      type="text/css">
    
    foo

   

    <style
      type="text/css">
    
    foo

[示例 141](https://github.github.com/gfm/#示例-141)  

    > <div>
    > foo
    
    bar

   

    <blockquote>
    <div>
    foo
    </blockquote>
    <p>bar</p>

[示例 142](https://github.github.com/gfm/#示例-142)  

    - <div>
    - foo

   

    <ul>
    <li>
    <div>
    </li>
    <li>foo</li>
    </ul>

结束标签可以与开始标签位于同一行：  
[示例 143](https://github.github.com/gfm/#示例-143)  

    <style>p{color:red;}</style>
    *foo*

   

    <style>p{color:red;}</style>
    <p><em>foo</em></p>

[示例 144](https://github.github.com/gfm/#示例-144)  

    <!-- foo -->*bar*
    *baz*

   

    <!-- foo -->*bar*
    <p><em>baz</em></p>

注意，结束标签之后的最后一行上的任何内容都将包含在 [HTML 块](https://github.github.com/gfm/#html-block)中：  
[示例 145](https://github.github.com/gfm/#示例-145)  

    <script>
    foo
    </script>1. *bar*

   

    <script>
    foo
    </script>1. *bar*

一个注释（类型 2）：  
[示例 146](https://github.github.com/gfm/#示例-146)  

    <!-- Foo
    
    bar
       baz -->
    okay

   

    <!-- Foo
    
    bar
       baz -->
    <p>okay</p>

一个处理指令（类型 3）：  
[示例 147](https://github.github.com/gfm/#示例-147)  

    <?php
    
      echo '>';
    
    ?>
    okay

   

    <?php
    
      echo '>';
    
    ?>
    <p>okay</p>

一个声明（类型 4）：  
[示例 148](https://github.github.com/gfm/#示例-148)  

    <!DOCTYPE html>

   

    <!DOCTYPE html>

CDATA （类型 5）：  
[示例 149](https://github.github.com/gfm/#示例-149)  

    <![CDATA[
    function matchwo(a,b)
    {
      if (a < b && a < 0) then {
        return 1;
    
      } else {
    
        return 0;
      }
    }
    ]]>
    okay

   

    <![CDATA[
    function matchwo(a,b)
    {
      if (a < b && a < 0) then {
        return 1;
    
      } else {
    
        return 0;
      }
    }
    ]]>
    <p>okay</p>

开始标签可以缩进 1-3 个空格，但不能缩进 4 个空格：  
[示例 150](https://github.github.com/gfm/#示例-150)  

      <!-- foo -->
    
        <!-- foo -->

   

      <!-- foo -->
    <pre><code>&lt;!-- foo --&gt;
    </code></pre>

[示例 151](https://github.github.com/gfm/#示例-151)  

      <div>
    
        <div>

   

      <div>
    <pre><code>&lt;div&gt;
    </code></pre>

1-6 类型的 HTML 块可以中断段落，并且不需要以空行开头。   
[示例 152](https://github.github.com/gfm/#示例-152)  

    Foo
    <div>
    bar
    </div>

   

    <p>Foo</p>
    <div>
    bar
    </div>

然而，除文档末尾外，还需要以下空白行，[除](https://github.github.com/gfm/#html-block)以上类型 1-5 的块外：
[示例 153](https://github.github.com/gfm/#示例-153)  

    <div>
    bar
    </div>
    *foo*

   

    <div>
    bar
    </div>
    *foo*

类型 7 的 HTML 块不能中断段落：   
[示例 154](https://github.github.com/gfm/#示例-154)  

    Foo
    <a href="bar">
    baz

   

    <p>Foo
    <a href="bar">
    baz</p>

此规则不同于 John Gruber 的原始 Markdown 语法规范，该规范说：

> 唯一的限制是块级 HTML 元素 - 例如 `<div>`, `<table>`, `<pre>`, `<p>` 等 - 必须用空行与周围内容分开，并且不应使用 tab 或空格缩进块的开始和结束标签。


在某种程度上，Gruber 的规则比这里给出的规则更具限制性：  

* 它要求 HTML 块前面有一个空行。
* 它不允许开始标签缩进。
* 它需要一个匹配的结束标签，它也不允许缩进。

大多数 Markdown 实现（包括 Gruber 自己的一些实现）并不尊重这些限制的全部。

但是，有一个方面，Gruber 的规则比这里给出的规则更自由，因为它允许在 HTML 块中出现空行。在这里禁止它们有两个原因。首先，它消除了解析平衡标签的需要，这是昂贵的，并且如果没有找到匹配的结束标签，则可能需要从文档的末尾回溯。其次，它提供了一种非常简单灵活的方法，可以在 HTML 标签中包含 Markdown 内容：只需使用空行将Markdown 与 HTML 分开：
对比：  
[示例 155](https://github.github.com/gfm/#示例-155)  

    <div>
    
    *Emphasized* text.
    
    </div>

   

    <div>
    <p><em>Emphasized</em> text.</p>
    </div>

[示例 156](https://github.github.com/gfm/#示例-156)  

    <div>
    *Emphasized* text.
    </div>

   

    <div>
    *Emphasized* text.
    </div>

如果打开的标签具有属性 `markdown=1`，则某些 Markdown 实现采用了将标签内的内容解释为文本的约定。上面给出的规则似乎是一种更简单，更优雅的方式来实现相同的表达能力，这也很容易解析。
主要的潜在缺点是，人们无法再将 HTML 块粘贴到 Markdown 文档中，并具有 100％ 的可靠性。但是，在大多数情况下，这样可以正常工作，因为 HTML 中的空行通常后跟HTML 块标签。对于示例：  
[示例 157](https://github.github.com/gfm/#示例-157)  

    <table>
    
    <tr>
    
    <td>
    Hi
    </td>
    
    </tr>
    
    </table>

   

    <table>
    <tr>
    <td>
    Hi
    </td>
    </tr>
    </table>

但是，如果内部标签缩进，并用空格分隔，则会出现问题，因为它们将被解释为缩进的代码块：  
[示例 158](https://github.github.com/gfm/#示例-158)  

    <table>
    
      <tr>
    
        <td>
          Hi
        </td>
    
      </tr>
    
    </table>

   

    <table>
      <tr>
    <pre><code>&lt;td&gt;
      Hi
    &lt;/td&gt;
    </code></pre>
      </tr>
    </table>

幸运的是，通常不需要空行，它是可以没有的。例外是在 `<pre>` 标签内，但[如上所述](https://github.github.com/gfm/#html-blocks)，以`<pre>` 开头的原生 HTML 块可以包含空行。