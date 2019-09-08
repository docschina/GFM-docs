### ATX 标题

[ATX 标题]((https://github.github.com/gfm/#atx-heading))由一串字符组成，这些字符被解析为内联内容，它们位于 1-6 个未转义的 `#` 字符的起始序列和任意数量的未转义的 `#` 字符的可选末尾序列之间。`#` 字符的起始序列必须后跟[空格](https://github.github.com/gfm/#space)或行尾。可选的 `#` 的末尾序列之前必须有空格，并且只能有空格。起始的 `#` 字符可以缩进 0-3 个空格。在将标题的原始内容解析为内联内容之前，要先去掉前导空格和后置空格。标题级别等于起始序列中的 `#` 字符数。

简单的标题:    
[示例 32](https://github.github.com/gfm/#example-32)  

    # foo
    ## foo
    ### foo
    #### foo
    ##### foo
    ###### foo

   

    <h1>foo</h1>
    <h2>foo</h2>
    <h3>foo</h3>
    <h4>foo</h4>
    <h5>foo</h5>
    <h6>foo</h6>

超过六个 `#` 字符就不是标题：    
[示例 33](https://github.github.com/gfm/#example-33)  

    ####### foo

   

    <p>####### foo</p>

除非标题为空，否则 `#` 字符和标题内容之间至少需要一个空格。注意，许多实现目前不需要空格。但是，[原始的 ATX 实现](http://www.aaronsw.com/2002/atx/atx.py)需要此空格，它有助于防止将以下内容解析为标题：    
[示例 34](https://github.github.com/gfm/#example-34)  

    #5 bolt
    
    #hashtag

   

    <p>#5 bolt</p>
    <p>#hashtag</p>

这不是标题，因为第一个 `＃` 被转义了：    
[示例 35](https://github.github.com/gfm/#example-35)  

    \## foo

   

    <p>## foo</p>

内容作为内联规则被解析：    
[示例 36](https://github.github.com/gfm/#example-36)  

    # foo *bar* \*baz\*

   

    <h1>foo <em>bar</em> *baz*</h1>

在解析内联内容时忽略前导空格和后置空格：     
[示例 37](https://github.github.com/gfm/#example-37)  

    #                  foo

   

    <h1>foo</h1>

允许一到三个空格缩进：    
[示例 38](https://github.github.com/gfm/#example-38)  

     ### foo
      ## foo
       # foo

   

    <h3>foo</h3>
    <h2>foo</h2>
    <h1>foo</h1>

四个空格太多了：     
[示例 39](https://github.github.com/gfm/#example-39)  

        # foo

   

    <pre><code># foo
    </code></pre>

[示例 40](https://github.github.com/gfm/#example-40)  

    foo
        # bar

   

    <p>foo
    # bar</p>

`#` 字符的末尾序列是可选的：    
[示例 41](https://github.github.com/gfm/#example-41)  

    ## foo ##
      ###   bar    ###

   

    <h2>foo</h2>
    <h3>bar</h3>

它不必与起始序列的长度相同：    
[示例 42](https://github.github.com/gfm/#example-42)  

    # foo ##################################
    ##### foo ##

   

    <h1>foo</h1>
    <h5>foo</h5>

关闭的序列后允许使用空格：    
[示例 43](https://github.github.com/gfm/#example-43)  

    ### foo ###

   

    <h3>foo</h3>

除了[空格](https://github.github.com/gfm/#space)之外的任何 `#` 字符序列都不是末尾序列，而是作为标题内容的一部分：    
[示例 44](https://github.github.com/gfm/#example-44)  

    ### foo ### b

   

    <h3>foo ### b</h3>

结束序列必须以空格开头：    
[示例 45](https://github.github.com/gfm/#example-45)  

    # foo#

   

    <h1>foo#</h1>

反斜杠转义的 `#` 字符不算作结束序列的一部分：    
[示例 46](https://github.github.com/gfm/#example-46)  

    ### foo \###
    ## foo #\##
    # foo \#

   

    <h3>foo ###</h3>
    <h2>foo ###</h2>
    <h1>foo #</h1>

ATX 标题不需要用空行与周围内容分开，它们可以中断段落：    
[示例 47](https://github.github.com/gfm/#example-47)  

    ****
    ## foo
    ****

   

    <hr />
    <h2>foo</h2>
    <hr />

[示例 48](https://github.github.com/gfm/#example-48)  

    Foo bar
    # baz
    Bar foo

   

    <p>Foo bar</p>
    <h1>baz</h1>
    <p>Bar foo</p>

ATX 标题可以为空：    
[示例 49](https://github.github.com/gfm/#example-49)  

    ## 
    #
    ### ###

   

    <h2></h2>
    <h1></h1>
    <h3></h3>

