### HTML blocks

An [HTML block](https://github.github.com/gfm/#html-block) is a group of lines that is treated as raw HTML (and will not be escaped in HTML output).  

There are seven kinds of [HTML block](https://github.github.com/gfm/#html-block), which can be defined by their start and end conditions. The block begins with a line that meets a [start condition](https://github.github.com/gfm/#start-condition) (after up to three spaces optional indentation). It ends with the first subsequent line that meets a matching [end condition](https://github.github.com/gfm/#end-condition), or the last line of the document or other [container block](https://github.github.com/gfm/#container-block)), if no line is encountered that meets the [end condition](https://github.github.com/gfm/#end-condition). If the first line meets both the [start condition](https://github.github.com/gfm/#start-condition) and the [end condition](https://github.github.com/gfm/#end-condition), the block will contain just that line.  

1.  **Start condition:** line begins with the string `<script`, `<pre`, or `<style` (case-insensitive), followed by whitespace, the string `>`, or the end of the line.  
    **End condition:** line contains an end tag `</script>`, `</pre>`, or `</style>` (case-insensitive; it need not match the start tag).  
    
2.  **Start condition:** line begins with the string `<!--`.  
    **End condition:** line contains the string `-->`.  
    
3.  **Start condition:** line begins with the string `<?`.  
    **End condition:** line contains the string `?>`.  
    
4.  **Start condition:** line begins with the string `<!` followed by an uppercase ASCII letter.  
    **End condition:** line contains the character `>`.  
    
5.  **Start condition:** line begins with the string `<![CDATA[`.  
    **End condition:** line contains the string `]]>`.  
    
6.  **Start condition:** line begins the string `<` or `</` followed by one of the strings (case-insensitive) `address`, `article`, `aside`, `base`, `basefont`, `blockquote`, `body`, `caption`, `center`, `col`, `colgroup`, `dd`, `details`, `dialog`, `dir`, `div`, `dl`, `dt`, `fieldset`, `figcaption`, `figure`, `footer`, `form`, `frame`, `frameset`, `h1`, `h2`, `h3`, `h4`, `h5`, `h6`, `head`, `header`, `hr`, `html`, `iframe`, `legend`, `li`, `link`, `main`, `menu`, `menuitem`, `nav`, `noframes`, `ol`, `optgroup`, `option`, `p`, `param`, `section`, `source`, `summary`, `table`, `tbody`, `td`, `tfoot`, `th`, `thead`, `title`, `tr`, `track`, `ul`, followed by [whitespace](https://github.github.com/gfm/#whitespace), the end of the line, the string `>`, or the string `/>`.  
    **End condition:** line is followed by a [blank line](https://github.github.com/gfm/#blank-line).
7.  **Start condition:** line begins with a complete [open tag](https://github.github.com/gfm/#open-tag) or [closing tag](https://github.github.com/gfm/#closing-tag) (with any [tag name](https://github.github.com/gfm/#tag-name) other than `script`, `style`, or `pre`) followed only by [whitespace](https://github.github.com/gfm/#whitespace) or the end of the line.  
    **End condition:** line is followed by a [blank line](https://github.github.com/gfm/#blank-line).

HTML blocks continue until they are closed by their appropriate [end condition](https://github.github.com/gfm/#end-condition), or the last line of the document or other [container block](https://github.github.com/gfm/#container-block). This means any HTML **within an HTML block** that might otherwise be recognised as a start condition will be ignored by the parser and passed through as-is, without changing the parser’s state.  
For instance, `<pre>` within a HTML block started by `<table>` will not affect the parser state; as the HTML block was started in by start condition 6, it will end at any blank line. This can be surprising:  
[Example 116](https://github.github.com/gfm/#example-116)  

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

In this case, the HTML block is terminated by the newline — the `**Hello**` text remains verbatim — and regular parsing resumes, with a paragraph, emphasised `world` and inline and block HTML following.  
All types of [HTML blocks](https://github.github.com/gfm/#html-blocks) except type 7 may interrupt a paragraph. Blocks of type 7 may not interrupt a paragraph. (This restriction is intended to prevent unwanted interpretation of long tags inside a wrapped paragraph as starting HTML blocks.)  
Some simple examples follow. Here are some basic HTML blocks of type 6:  
[Example 117](https://github.github.com/gfm/#example-117)  

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

[Example 118](https://github.github.com/gfm/#example-118)  

     <div>
      *hello*
             <foo><a>

   

     <div>
      *hello*
             <foo><a>

A block can also start with a closing tag:  
[Example 119](https://github.github.com/gfm/#example-119)  

    </div>
    *foo*

   

    </div>
    *foo*

Here we have two HTML blocks with a Markdown paragraph between them:  
[Example 120](https://github.github.com/gfm/#example-120)  

    <DIV CLASS="foo">
    
    *Markdown*
    
    </DIV>

   

    <DIV CLASS="foo">
    <p><em>Markdown</em></p>
    </DIV>

The tag on the first line can be partial, as long as it is split where there would be whitespace:  
[Example 121](https://github.github.com/gfm/#example-121)  

    <div id="foo"
      class="bar">
    </div>

   

    <div id="foo"
      class="bar">
    </div>

[Example 122](https://github.github.com/gfm/#example-122)  

    <div id="foo" class="bar
      baz">
    </div>

   

    <div id="foo" class="bar
      baz">
    </div>

An open tag need not be closed:  
[Example 123](https://github.github.com/gfm/#example-123)  

    <div>
    *foo*
    
    *bar*

   

    <div>
    *foo*
    <p><em>bar</em></p>

A partial tag need not even be completed (garbage in, garbage out):  
[Example 124](https://github.github.com/gfm/#example-124)  

    <div id="foo"
    *hi*

   

    <div id="foo"
    *hi*

[Example 125](https://github.github.com/gfm/#example-125)  

    <div class
    foo

   

    <div class
    foo

The initial tag doesn’t even need to be a valid tag, as long as it starts like one:  
[Example 126](https://github.github.com/gfm/#example-126)  

    <div *???-&&&-<---
    *foo*

   

    <div *???-&&&-<---
    *foo*

In type 6 blocks, the initial tag need not be on a line by itself:  
[Example 127](https://github.github.com/gfm/#example-127)  

    <div><a href="bar">*foo*</a></div>

   

    <div><a href="bar">*foo*</a></div>

[Example 128](https://github.github.com/gfm/#example-128)  

    <table><tr><td>
    foo
    </td></tr></table>

   

    <table><tr><td>
    foo
    </td></tr></table>

Everything until the next blank line or end of document gets included in the HTML block. So, in the following example, what looks like a Markdown code block is actually part of the HTML block, which continues until a blank line or the end of the document is reached:  
[Example 129](https://github.github.com/gfm/#example-129)  

    <div></div>
    ``` c
    int x = 33;
    ```

   

    <div></div>
    ``` c
    int x = 33;
    ```

To start an [HTML block](https://github.github.com/gfm/#html-block) with a tag that is _not_ in the list of block-level tags in (6), you must put the tag by itself on the first line (and it must be complete):  
[Example 130](https://github.github.com/gfm/#example-130)  

    <a href="foo">
    *bar*
    </a>

   

    <a href="foo">
    *bar*
    </a>

In type 7 blocks, the [tag name](https://github.github.com/gfm/#tag-name) can be anything:  
[Example 131](https://github.github.com/gfm/#example-131)  

    <Warning>
    *bar*
    </Warning>

   

    <Warning>
    *bar*
    </Warning>

[Example 132](https://github.github.com/gfm/#example-132)  

    <i class="foo">
    *bar*
    </i>

   

    <i class="foo">
    *bar*
    </i>

[Example 133](https://github.github.com/gfm/#example-133)  

    </ins>
    *bar*

   

    </ins>
    *bar*

These rules are designed to allow us to work with tags that can function as either block-level or inline-level tags. The `<del>` tag is a nice example. We can surround content with `<del>` tags in three different ways. In this case, we get a raw HTML block, because the `<del>` tag is on a line by itself:  
[Example 134](https://github.github.com/gfm/#example-134)  

    <del>
    *foo*
    </del>

   

    <del>
    *foo*
    </del>

In this case, we get a raw HTML block that just includes the `<del>` tag (because it ends with the following blank line). So the contents get interpreted as CommonMark:  
[Example 135](https://github.github.com/gfm/#example-135)  

    <del>
    
    *foo*
    
    </del>

   

    <del>
    <p><em>foo</em></p>
    </del>

Finally, in this case, the `<del>` tags are interpreted as [raw HTML](https://github.github.com/gfm/#raw-html) _inside_ the CommonMark paragraph. (Because the tag is not on a line by itself, we get inline HTML rather than an [HTML block](https://github.github.com/gfm/#html-block).)  
[Example 136](https://github.github.com/gfm/#example-136)  

    <del>*foo*</del>

   

    <p><del><em>foo</em></del></p>

HTML tags designed to contain literal content (`script`, `style`, `pre`), comments, processing instructions, and declarations are treated somewhat differently. Instead of ending at the first blank line, these blocks end at the first line containing a corresponding end tag. As a result, these blocks can contain blank lines:  
A pre tag (type 1):  
[Example 137](https://github.github.com/gfm/#example-137)  

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

A script tag (type 1):  
[Example 138](https://github.github.com/gfm/#example-138)  

    <script type="text/javascript">
    // JavaScript example
    
    document.getElementById("demo").innerHTML = "Hello JavaScript!";
    </script>
    okay

   

    <script type="text/javascript">
    // JavaScript example
    
    document.getElementById("demo").innerHTML = "Hello JavaScript!";
    </script>
    <p>okay</p>

A style tag (type 1):  
[Example 139](https://github.github.com/gfm/#example-139)  

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

If there is no matching end tag, the block will end at the end of the document (or the enclosing [block quote](https://github.github.com/gfm/#block-quotes)or [list item](https://github.github.com/gfm/#list-items)):  
[Example 140](https://github.github.com/gfm/#example-140)  

    <style
      type="text/css">
    
    foo

   

    <style
      type="text/css">
    
    foo

[Example 141](https://github.github.com/gfm/#example-141)  

    > <div>
    > foo
    
    bar

   

    <blockquote>
    <div>
    foo
    </blockquote>
    <p>bar</p>

[Example 142](https://github.github.com/gfm/#example-142)  

    - <div>
    - foo

   

    <ul>
    <li>
    <div>
    </li>
    <li>foo</li>
    </ul>

The end tag can occur on the same line as the start tag:  
[Example 143](https://github.github.com/gfm/#example-143)  

    <style>p{color:red;}</style>
    *foo*

   

    <style>p{color:red;}</style>
    <p><em>foo</em></p>

[Example 144](https://github.github.com/gfm/#example-144)  

    <!-- foo -->*bar*
    *baz*

   

    <!-- foo -->*bar*
    <p><em>baz</em></p>

Note that anything on the last line after the end tag will be included in the [HTML block](https://github.github.com/gfm/#html-block):  
[Example 145](https://github.github.com/gfm/#example-145)  

    <script>
    foo
    </script>1. *bar*

   

    <script>
    foo
    </script>1. *bar*

A comment (type 2):  
[Example 146](https://github.github.com/gfm/#example-146)  

    <!-- Foo
    
    bar
       baz -->
    okay

   

    <!-- Foo
    
    bar
       baz -->
    <p>okay</p>

A processing instruction (type 3):  
[Example 147](https://github.github.com/gfm/#example-147)  

    <?php
    
      echo '>';
    
    ?>
    okay

   

    <?php
    
      echo '>';
    
    ?>
    <p>okay</p>

A declaration (type 4):  
[Example 148](https://github.github.com/gfm/#example-148)  

    <!DOCTYPE html>

   

    <!DOCTYPE html>

CDATA (type 5):  
[Example 149](https://github.github.com/gfm/#example-149)  

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

The opening tag can be indented 1-3 spaces, but not 4:  
[Example 150](https://github.github.com/gfm/#example-150)  

      <!-- foo -->
    
        <!-- foo -->

   

      <!-- foo -->
    <pre><code>&lt;!-- foo --&gt;
    </code></pre>

[Example 151](https://github.github.com/gfm/#example-151)  

      <div>
    
        <div>

   

      <div>
    <pre><code>&lt;div&gt;
    </code></pre>

An HTML block of types 1–6 can interrupt a paragraph, and need not be preceded by a blank line.  
[Example 152](https://github.github.com/gfm/#example-152)  

    Foo
    <div>
    bar
    </div>

   

    <p>Foo</p>
    <div>
    bar
    </div>

However, a following blank line is needed, except at the end of a document, and except for blocks of types 1–5, [above](https://github.github.com/gfm/#html-block):  
[Example 153](https://github.github.com/gfm/#example-153)  

    <div>
    bar
    </div>
    *foo*

   

    <div>
    bar
    </div>
    *foo*

HTML blocks of type 7 cannot interrupt a paragraph:  
[Example 154](https://github.github.com/gfm/#example-154)  

    Foo
    <a href="bar">
    baz

   

    <p>Foo
    <a href="bar">
    baz</p>

This rule differs from John Gruber’s original Markdown syntax specification, which says:  

> The only restrictions are that block-level HTML elements — e.g. `<div>`, `<table>`, `<pre>`, `<p>`, etc. — must be separated from surrounding content by blank lines, and the start and end tags of the block should not be indented with tabs or spaces.

In some ways Gruber’s rule is more restrictive than the one given here:  

*   It requires that an HTML block be preceded by a blank line.
*   It does not allow the start tag to be indented.
*   It requires a matching end tag, which it also does not allow to be indented.

Most Markdown implementations (including some of Gruber’s own) do not respect all of these restrictions.  
There is one respect, however, in which Gruber’s rule is more liberal than the one given here, since it allows blank lines to occur inside an HTML block. There are two reasons for disallowing them here. First, it removes the need to parse balanced tags, which is expensive and can require backtracking from the end of the document if no matching end tag is found. Second, it provides a very simple and flexible way of including Markdown content inside HTML tags: simply separate the Markdown from the HTML using blank lines:  
Compare:  
[Example 155](https://github.github.com/gfm/#example-155)  

    <div>
    
    *Emphasized* text.
    
    </div>

   

    <div>
    <p><em>Emphasized</em> text.</p>
    </div>

[Example 156](https://github.github.com/gfm/#example-156)  

    <div>
    *Emphasized* text.
    </div>

   

    <div>
    *Emphasized* text.
    </div>

Some Markdown implementations have adopted a convention of interpreting content inside tags as text if the open tag has the attribute `markdown=1`. The rule given above seems a simpler and more elegant way of achieving the same expressive power, which is also much simpler to parse.  
The main potential drawback is that one can no longer paste HTML blocks into Markdown documents with 100% reliability. However, _in most cases_ this will work fine, because the blank lines in HTML are usually followed by HTML block tags. For example:  
[Example 157](https://github.github.com/gfm/#example-157)  

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

There are problems, however, if the inner tags are indented _and_ separated by spaces, as then they will be interpreted as an indented code block:  
[Example 158](https://github.github.com/gfm/#example-158)  

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

Fortunately, blank lines are usually not necessary and can be deleted. The exception is inside `<pre>` tags, but as described [above](https://github.github.com/gfm/#html-blocks), raw HTML blocks starting with `<pre>` _can_ contain blank lines.  