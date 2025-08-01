import withMindMap from "@dhlx/vitepress-plugin-mindmap";
import AutoNav from "vite-plugin-vitepress-auto-nav";
// import VitePressPluginAutoNavSidebar from '@movk-repo/vitepress-plugin-auto-nav-sidebar'
import { defineConfig } from "vitepress";

import { getFolder, getPosts } from "./theme/serverUtils";

// 每页的文章数量
const pageSize = 10;

// const isCloudflare = process.env.isFlare === "true";
const isProd = true;

export default withMindMap(defineConfig({
  title: "wei",
  // base: isCloudflare ? "/" : "/blog/",
  base: "/",
  // base: '/',
  cacheDir: "./node_modules/vitepress_cache",
  description: "vitepress,blog,blog-theme",
  ignoreDeadLinks: true,
  themeConfig: {

    posts: await getPosts(pageSize),
    website: "https://github.com/airene/vitepress-blog-pure", // copyright link
    // 评论的仓库地址
    comment: {
      repo: "airene/vitepress-blog-pure",
      themes: "github-light",
      issueTerm: "pathname",
    },
    nav: [
      { text: "首页", link: "/", collapsed: true },
      { text: "分类", link: "/pages/category", collapsed: true },
      { text: "归档", link: "/pages/archives", collapsed: true },
      { text: "标签", link: "/pages/tags", collapsed: true },
      // { text: 'About', link: '/pages/about' }
      // { text: 'Airene', link: 'http://airene.net' }  -- External link test
    ],
    search: {
      provider: "local",
    },
    // outline:[2,3],
    outline: {
      label: "文章摘要",
      level: "deep",
    },
    // socialLinks: [{ icon: 'github', link: 'https://github.com/airene/vitepress-blog-pure' }]
  } as any,

  srcExclude: isProd
    ? ["**/trash/**/*.md", "**/draft/**/*.md", "**/private-notes/*.md", "README.md"]
    : ["README.md"],
  vite: {
    // build: { minify: false }
    server: { port: 5000 },
    plugins: [
      AutoNav({
        itemsSetting: {
          ...(await getFolder()),
        },
      }) as any,
      // VitePressPluginAutoNavSidebar({
      //   documentRootPath: "/posts/",
      // }) as any,
    ],
  },
  // optimizeDeps: {
  //   keepNames: true
  // }
}));
