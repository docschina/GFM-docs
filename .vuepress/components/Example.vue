<template>
    <div>
        <p>{{isZh ? '示例' : 'Example'}} {{index}}</p>
        <table>
            <thead>
            <tr>
                <th>Markdown</th>
                <th>HTML</th>
                <th>{{isZh ? '效果' : 'Demo'}}</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <div class="language-md" v-html="mdCode"/>
                </td>
                <td>
                    <div class="language-html" v-html="htmlCode"/>
                </td>
                <td>
                    <iframe width="100%" style="border: none" ref="demo"></iframe>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
  import MarkdownIt from 'markdown-it/dist/markdown-it';
  import highlight from '../util/highlight';

  const md = new MarkdownIt({highlight});
  export default {
    props: {
      md: {
        type: String,
        default: ''
      },
      html: {
        type: String,
        default: ''
      },
      index: {
        type: Number,
        required: true
      },
    },
    computed: {
      isZh: function () {
        return this.$page.path.startsWith('/zh-hans/')
      },
      example: function () {
        return this.$site.themeConfig.$examples[this.index - 1]
      },
      mdCode: function () {
        return this.renderMd(this.example.md, 'md')
      },
      htmlCode: function () {
        return this.renderMd(this.example.html, 'html')
      }
    },
    methods: {
      renderMd: (str, info) => md.render(`~~~~~~~~~~${info}\n${str}~~~~~~~~~~`)
    },
    mounted() {
      // console.log('$site', this.$site)
      // console.log('$page', this.$page)
      this.$refs.demo.contentDocument.write(this.example.html)
    }
  }
</script>
<style>
    @media (min-width: 768px) {
        table td {
            min-width: 200px;
            width: 33.3333%;
        }
    }
</style>