## Inlines

Inlines are parsed sequentially from the beginning of the character stream to the end (left to right, in left-to-right languages). Thus, for example, in  
[Example 300](https://github.github.com/gfm/#example-300)  

    `hi`lo`

   

    <p><code>hi</code>lo`</p>

`hi` is parsed as code, leaving the backtick at the end as a literal backtick.  