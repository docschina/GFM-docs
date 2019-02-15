## Container blocks

A [container block](https://github.github.com/gfm/#container-block) is a block that has other blocks as its contents. There are two basic kinds of container blocks: [block quotes](https://github.github.com/gfm/#block-quotes) and [list items](https://github.github.com/gfm/#list-items). [Lists](https://github.github.com/gfm/#lists) are meta-containers for [list items](https://github.github.com/gfm/#list-items).  
We define the syntax for container blocks recursively. The general form of the definition is:  

> If X is a sequence of blocks, then the result of transforming X in such-and-such a way is a container of type Y with these blocks as its content.

So, we explain what counts as a block quote or list item by explaining how these can be _generated_ from their contents. This should suffice to define the syntax, although it does not give a recipe for _parsing_ these constructions. (A recipe is provided below in the section entitled [A parsing strategy](https://github.github.com/gfm/#appendix-a-parsing-strategy).)  