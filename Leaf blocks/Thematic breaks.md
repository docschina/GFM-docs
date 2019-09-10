### Thematic breaks

A line consisting of 0-3 spaces of indentation, followed by a sequence of three or more matching `-`, `_`, or `*`characters, each followed optionally by any number of spaces or tabs, forms a [thematic break](https://github.github.com/gfm/#thematic-break).  

<Example :index="13"/>
Wrong characters:  
<Example :index="14"/>
<Example :index="15"/>
Not enough characters:  
<Example :index="16"/>
One to three spaces indent are allowed:  
<Example :index="17"/>
Four spaces is too many:  
<Example :index="18"/>
<Example :index="19"/>
More than three characters may be used:  
<Example :index="20"/>
Spaces are allowed between the characters:  
<Example :index="21"/>
<Example :index="22"/>
<Example :index="23"/>
Spaces are allowed at the end:  
<Example :index="24"/>
However, no other characters may occur in the line:  
<Example :index="25"/>
It is required that all of the [non-whitespace characters](https://github.github.com/gfm/#non-whitespace-character) be the same. So, this is not a thematic break:  
<Example :index="26"/>
Thematic breaks do not need blank lines before or after:  
<Example :index="27"/>
Thematic breaks can interrupt a paragraph:  
<Example :index="28"/>
If a line of dashes that meets the above conditions for being a thematic break could also be interpreted as the underline of a [setext heading](https://github.github.com/gfm/#setext-heading), the interpretation as a [setext heading](https://github.github.com/gfm/#setext-heading) takes precedence. Thus, for example, this is a setext heading, not a paragraph followed by a thematic break:      

<Example :index="29"/>
When both a thematic break and a list item are possible interpretations of a line, the thematic break takes precedence:  
<Example :index="30"/>
If you want a thematic break in a list item, use a different bullet:  
<Example :index="31"/>
