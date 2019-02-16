### Disallowed Raw HTML (extension)

GFM enables the `tagfilter` extension, where the following HTML tags will be filtered when rendering HTML output:  

*   `<title>`
*   `<textarea>`
*   `<style>`
*   `<xmp>`
*   `<iframe>`
*   `<noembed>`
*   `<noframes>`
*   `<script>`
*   `<plaintext>`

Filtering is done by replacing the leading `<` with the entity `&lt;`. These tags are chosen in particular as they change how HTML is interpreted in a way unique to them (i.e. nested HTML is interpreted differently), and this is usually undesireable in the context of other rendered Markdown content.  
All other HTML tags are left untouched.  
[Example 631](https://github.github.com/gfm/#example-631)  

    <strong> <title> <style> <em>
    
    <blockquote>
      <xmp> is disallowed.  <XMP> is also disallowed.
    </blockquote>

   

    <p><strong> &lt;title> &lt;style> <em></p>
    <blockquote>
      &lt;xmp> is disallowed.  &lt;XMP> is also disallowed.
    </blockquote>
