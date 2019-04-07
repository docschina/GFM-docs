## 容器块

[容器块](https://github.github.com/gfm/#container-block)是一种包含其他块的块的集合。容器块有两种基本类型，[块引用](https://github.github.com/gfm/#block-quotes)和[列表项](https://github.github.com/gfm/#list-items)。[列表](https://github.github.com/gfm/#lists)是[列表项](https://github.github.com/gfm/#list-items)的元容器。 
我们用递归的形式定义容器块的语法，其一般形式是：  

> 如果 X 是一个块序列，那么通过一定的方式转换之后，会变成包含这些块的另一种形式 Y 。

因此，我们通过 X 包含的内容 _生成_ 的结果来判断其是块引用还是列表项。这应该足以定义语法，尽管它没有给出 _解析_ 这些结构的方法。（有一个方法在章节 [A parsing strategy](https://github.github.com/gfm/#appendix-a-parsing-strategy) 中提及。）
