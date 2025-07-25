import{_ as s,c as n,o as e,ah as l}from"./chunks/framework.ptg7Kx6M.js";const u=JSON.parse('{"title":"布局","description":"","frontmatter":{"title":"布局","date":"2025-07-03T00:00:00.000Z","category":"css","tags":["布局","css"]},"headers":[],"relativePath":"posts/css/布局.md","filePath":"posts/css/布局.md"}'),t={name:"posts/css/布局.md"};function p(i,a,c,o,r,d){return e(),n("div",null,a[0]||(a[0]=[l(`<h2 id="水平居中的选择流程图-图文逻辑" tabindex="-1">水平居中的选择流程图（图文逻辑） <a class="header-anchor" href="#水平居中的选择流程图-图文逻辑" aria-label="Permalink to &quot;水平居中的选择流程图（图文逻辑）&quot;">​</a></h2><ul><li>行内靠文本，块级靠外边，其他靠 Flex 或定位</li></ul><div class="language- vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang"></span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span>是否是块级元素？</span></span>
<span class="line"><span>├─ 是 → 是否宽度固定？</span></span>
<span class="line"><span>│     ├─ 是 → margin: 0 auto;</span></span>
<span class="line"><span>│     └─ 否 → width: fit-content; + margin: 0 auto;</span></span>
<span class="line"><span>└─ 否 → 是否是行内元素？</span></span>
<span class="line"><span>      ├─ 是 → 父容器 text-align: center;</span></span>
<span class="line"><span>      └─ 否 → display:inline-block/inline-flex + 父容器 text-align</span></span>
<span class="line"><span>      或者直接使用 flex 布局：父容器 display:flex; justify-content:center;</span></span>
<span class="line"><span>      或者绝对定位 left:50% + transform: translateX(-50%);</span></span></code></pre></div><h2 id="垂直居中的选择流程图-图文逻辑" tabindex="-1">垂直居中的选择流程图（图文逻辑） <a class="header-anchor" href="#垂直居中的选择流程图-图文逻辑" aria-label="Permalink to &quot;垂直居中的选择流程图（图文逻辑）&quot;">​</a></h2><ul><li>行高控高度，表格全能王，Flex 最常用，定位要算值</li></ul><div class="language- vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang"></span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span>是否是行内元素？</span></span>
<span class="line"><span>├─ 是 → 设置 line-height = 容器高度</span></span>
<span class="line"><span>└─ 否 → 是否需要兼容性好？</span></span>
<span class="line"><span>      ├─ 是 → 使用 display: table-cell + vertical-align: middle;</span></span>
<span class="line"><span>      └─ 否 → 使用 flex 布局：display:flex; align-items:center;</span></span>
<span class="line"><span>           或者绝对定位 top:50% + transform: translateY(-50%);</span></span></code></pre></div>`,6)]))}const _=s(t,[["render",p]]);export{u as __pageData,_ as default};
