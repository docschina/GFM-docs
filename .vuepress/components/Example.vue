<template>
    <div>
        <p>Example {{this.index}}</p>
        <table>
            <thead>
            <tr>
                <th>Markdown</th>
                <th>HTML</th>
                <th>Demo</th>
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
                <div v-html="this.example.html"/>
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
      renderMd: (str, info) => md.render(`\`\`\`${info}\n${str}\`\`\``)
    },
    // mounted() {
    //   console.log('$site', this.$site)
    //   console.log('$page', this.$page)
    // }
  }
</script>
<style>
    @media (min-width: 768px){
        table td {
            min-width: 200px;
        }
    }
</style>