### Strikethrough (extension)

GFM enables the `strikethrough` extension, where an additional emphasis type is available.  
Strikethrough text is any text wrapped in two tildes (`~`).  
[Example 472](https://github.github.com/gfm/#example-472)  

    ~~Hi~~ Hello, world!

   

    <p><del>Hi</del> Hello, world!</p>

As with regular emphasis delimiters, a new paragraph will cause strikethrough parsing to cease:  
[Example 473](https://github.github.com/gfm/#example-473)  

    This ~~has a
    
    new paragraph~~.

   

    <p>This ~~has a</p>
    <p>new paragraph~~.</p>