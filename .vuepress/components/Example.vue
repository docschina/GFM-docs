<template>
    <div>
        <p>Example {{this.index}}</p>
        <div class="language-md" v-html="mdCode"/>
        <div class="language-html" v-html="htmlCode"/>
        <div v-html="this.example.html"/>
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
    //   console.log('key', this.index)
    // }
  }
</script>
