### ATX headings

An [ATX heading](https://github.github.com/gfm/#atx-heading) consists of a string of characters, parsed as inline content, between an opening sequence of 1–6 unescaped `#` characters and an optional closing sequence of any number of unescaped `#` characters. The opening sequence of `#` characters must be followed by a [space](https://github.github.com/gfm/#space) or by the end of line. The optional closing sequence of `#`s must be preceded by a [space](https://github.github.com/gfm/#space) and may be followed by spaces only. The opening `#`character may be indented 0-3 spaces. The raw contents of the heading are stripped of leading and trailing spaces before being parsed as inline content. The heading level is equal to the number of `#` characters in the opening sequence.  

Simple headings:  
<Example :index="32"/>

More than six `#` characters is not a heading:  
<Example :index="33"/>

At least one space is required between the `#` characters and the heading’s contents, unless the heading is empty. Note that many implementations currently do not require the space. However, the space was required by the [original ATX implementation](http://www.aaronsw.com/2002/atx/atx.py), and it helps prevent things like the following from being parsed as headings:  
<Example :index="34"/>

This is not a heading, because the first `#` is escaped:  
<Example :index="35"/>

Contents are parsed as inlines:  
<Example :index="36"/>

Leading and trailing whitespace is ignored in parsing inline content:    
<Example :index="37"/>

One to three spaces indentation are allowed:  
<Example :index="38"/>

Four spaces are too much:  
<Example :index="39"/>

<Example :index="40"/>

A closing sequence of `#` characters is optional:  
<Example :index="41"/>

It need not be the same length as the opening sequence:  
<Example :index="42"/>

Spaces are allowed after the closing sequence:  
<Example :index="43"/>

A sequence of `#` characters with anything but [spaces](https://github.github.com/gfm/#space) following it is not a closing sequence, but counts as part of the contents of the heading:  
<Example :index="44"/>

The closing sequence must be preceded by a space:  
<Example :index="45"/>

Backslash-escaped `#` characters do not count as part of the closing sequence:  
<Example :index="46"/>

ATX headings need not be separated from surrounding content by blank lines, and they can interrupt paragraphs:  
<Example :index="47"/>

<Example :index="48"/>

ATX headings can be empty:  
<Example :index="49"/>

