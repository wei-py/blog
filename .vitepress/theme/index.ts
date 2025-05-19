import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import Archives from './components/Archives.vue'
import Category from './components/Category.vue'
import Comment from './components/CommentGiscus.vue'
import NewLayout from './components/NewLayout.vue'
import Page from './components/Page.vue'
import Tags from './components/Tags.vue'

import './custom.css'
import './lxgw-wenkai-webfont/lxgwwenkai-regular.css'
import './lxgw-wenkai-webfont/lxgwwenkai-bold.css'

export default {
  ...DefaultTheme,
  Layout: NewLayout,
  enhanceApp({ app }) {
    // register global compoment
    app.component('Tags', Tags)
    app.component('Category', Category)
    app.component('Archives', Archives)
    app.component('Page', Page)
    app.component('Comment', Comment)
  },
} satisfies Theme
