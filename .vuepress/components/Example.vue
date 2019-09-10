<template>
    <div>
        <div class="language-md" v-html="mdCode"/>
        <div class="language-html" v-html="htmlCode"/>
        <div v-html="html"/>
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
    },
    computed: {
      mdCode: function () {
        return this.renderMd(this.md,'md')
      },
      htmlCode: function () {
        return this.renderMd(this.html,'html')
      }
    },
    methods: {
      renderMd: (str,info) => md.render(`\`\`\`${info}\n${str}\n\`\`\``)
    }
  }
</script>
