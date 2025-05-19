<script lang="ts" setup>
import { useData, withBase } from 'vitepress'
import { computed, ref } from 'vue'
import { initTags } from '../functions'

const url = location.href.split('?')[1]
const params = new URLSearchParams(url)
const { theme } = useData()
const data = computed(() => initTags(theme.value.posts))
const selectTag = ref(params.get('tag') ? params.get('tag') : '')
function toggleTag(tag: string) {
  selectTag.value = tag
}
// choose the first key
const defaultDisplayTag = Object.keys(data.value)[0]
if (defaultDisplayTag) {
  toggleTag(defaultDisplayTag)
}
</script>

<template>
  <div class="tags">
    <span v-for="(_, key) in data" class="tag" @click="toggleTag(String(key))">
      {{ key }}
      <sup>{{ data[key].length }}</sup>
    </span>
  </div>
  <div class="tag-header">
    {{ selectTag }}
  </div>
  <a v-for="(article, index) in selectTag ? data[selectTag] : []" :key="index" :href="withBase(article.regularPath)" class="posts">
    <div class="post-container">
      <div class="post-dot" />
      {{ article.frontMatter.title }}
    </div>
    <div class="date">{{ article.frontMatter.date }}</div>
  </a>
</template>

<style scoped>
.tags {
  margin-top: 14px;
  display: flex;
  flex-wrap: wrap;
}

.tag {
  display: inline-block;
  padding: 0 16px 4px 16px;
  margin: 6px 8px;
  font-size: 0.875rem;
  line-height: 25px;
  background-color: var(--vp-c-bg-alt);
  transition: 0.4s;
  border-radius: 2px;
  color: var(--vp-c-text-1);
  cursor: pointer;
}

.tag sup {
  color: var(--vp-c-brand);
  font-weight: bold;
}

.tag-header {
  padding: 28px 0 10px 0;
  font-size: 1.375rem;
  font-weight: 600;
  color: var(--bt-theme-title);
  font-family: var(--date-font-family);
}

@media screen and (max-width: 768px) {
  .date {
    font-size: 0.75rem;
  }
}
</style>
