import withMindMap from "@dhlx/vitepress-plugin-mindmap";
import { defineConfig } from "vitepress";

import { getPosts, getSidebar } from "./theme/serverUtils";

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
      { text: "首页", link: "/", activeMatch: "^/$" },
      { text: "前端", link: "/posts/frontend/html/semantic-tags", activeMatch: "^/posts/frontend/" },
      { text: "后端", link: "/posts/backend/database/mysql", activeMatch: "^/posts/backend/" },
      { text: "算法", link: "/posts/algorithm/", activeMatch: "^/posts/algorithm/" },
      { text: "归档", link: "/pages/archives" },
      { text: "关于", link: "/pages/about" },
    ],
    sidebar: await getSidebar(),
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
    plugins: [],
  },
  // optimizeDeps: {
  //   keepNames: true
  // }
}));
