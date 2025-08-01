import { resolve } from "node:path";
import fs from "fs-extra";
import { globby } from "globby";
import matter from "gray-matter";

async function getFolder() {
  const isProd = true;
  const ignorePaths = isProd ? ["posts/draft/**/*.md", "posts/private-notes/**/*.md", "posts/trash/**/*.md"] : [];

  const paths = await globby(["posts/**/**.md"], {
    ignore: ignorePaths,
  });

  return paths.reduce((acc, cur) => {
    const name = cur.replace(/.*?\/(.*?)\/.*/, "$1");

    return {
      ...acc,
      [name]: {
        collapsed: true,
      },
    };
  }, {});
}

async function getPosts(pageSize: number) {
  // const isProd = process.env.NODE_ENV === 'production'
  const isProd = true;
  const ignorePaths = isProd ? ["posts/draft/**/*.md", "posts/private-notes/**/*.md", "posts/trash/**/*.md"] : [];

  const paths = await globby(["posts/**/**.md"], {
    ignore: ignorePaths,
  });

  // 这里只是生成分页时才用到
  await generatePaginationPages(paths.length, pageSize);

  const posts = await Promise.all(
    paths.map(async (item) => {
      const content = await fs.readFile(item, "utf-8");
      const { data } = matter(content);
      data.date = _convertDate(data.date);
      return {
        frontMatter: data,
        regularPath: `/${item.replace(".md", ".html")}`,
      };
    }),
  );
  posts.sort(_compareDate as any);

  return posts;
}

async function generatePaginationPages(total: number, pageSize: number) {
  //  pagesNum
  const pagesNum = total % pageSize === 0 ? total / pageSize : Math.floor(total / pageSize) + 1;
  const paths = resolve("./");

  if (total > 0) {
    for (let i = 1; i < pagesNum + 1; i++) {
      const page = `
---
page: true
title: ${i === 1 ? "home" : `page_${i}`}
aside: false
---
<script setup>
import Page from "./.vitepress/theme/components/Page.vue";
import { useData } from "vitepress";
const { theme } = useData();
const posts = theme.value.posts.slice(${pageSize * (i - 1)},${pageSize * i})
</script>
<Page :posts="posts" :pageCurrent="${i}" :pagesNum="${pagesNum}" />
`.trim();

      const file = `${paths}/page_${i}.md`;
      await fs.writeFile(file, page);
    }
  }
  // rename page_1 to index for homepage
  await fs.move(`${paths}/page_1.md`, `${paths}/index.md`, { overwrite: true });
}

function _convertDate(date = new Date().toString()) {
  const json_date = new Date(date).toJSON();
  return json_date.split("T")[0];
}

function _compareDate(obj1: { frontMatter: { date: number } }, obj2: { frontMatter: { date: number } }) {
  return obj1.frontMatter.date < obj2.frontMatter.date ? 1 : -1;
}

export { getFolder, getPosts };
