{{($page.frontmatter.start = 669) ? null : null}}
### Soft line breaks

A regular line break (not in a code span or HTML tag) that is not preceded by two or more spaces or a backslash is parsed as a [softbreak](https://github.github.com/gfm/#softbreak). (A softbreak may be rendered in HTML either as a [line ending](https://github.github.com/gfm/#line-ending) or as a space. The result will be the same in browsers. In the examples here, a [line ending](https://github.github.com/gfm/#line-ending) will be used.)  
<Example :index="$page.frontmatter.start++"/>

Spaces at the end of the line and beginning of the next line are removed:  
<Example :index="$page.frontmatter.start++"/>

A conforming parser may render a soft line break in HTML either as a line break or as a space.  
A renderer may also provide an option to render soft line breaks as hard line breaks.  
