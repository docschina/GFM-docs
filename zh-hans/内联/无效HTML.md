### 无效 HTML

GFM 启用`tagfilter`扩展，在渲染 HTML 输出时将过滤以下 HTML 标签：  

*   `<title>`
*   `<textarea>`
*   `<style>`
*   `<xmp>`
*   `<iframe>`
*   `<noembed>`
*   `<noframes>`
*   `<script>`
*   `<plaintext>`

通过将前置的`<`替换为实体`&lt;`来完成过滤。选择这些标签是因为它们改变了对 HTML 唯一的解释方式（嵌套的 HTML 有不同的解读），并且这经常在其他的 Markdown 内容的上下文中是不希望出现的。
所有其他 HTML 标签保持不变。   
<Example :index="653"/>

