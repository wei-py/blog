<script lang="ts" setup>
import { useData } from "vitepress";
import { nextTick, onMounted, ref, watch } from "vue";

const utterancesRef = ref();
const { theme, isDark } = useData();
onMounted(() => {
  nextTick(() => {
    const { repo, issueTerm = "pathname" } = theme.value.comment;
    if (repo) {
      const utterances = document.createElement("script");
      utterances.async = true;
      utterances.setAttribute("src", "https://utteranc.es/client.js");
      utterances.setAttribute("repo", repo);
      utterances.setAttribute("issue-term", issueTerm);
      utterances.setAttribute("theme", isDark.value ? "github-dark" : "github-light");
      utterances.setAttribute("crossorigin", "anonymous");
      utterancesRef.value.appendChild(utterances);
    }
    // hack method to change utterances theme when change site theme
    watch(isDark, (newVal, oldVal) => {
      if (newVal !== oldVal)
        location.replace(location.href);
    });
  });
});
</script>

<template>
  <div ref="utterancesRef" />
</template>

<style>
/*global  style*/
.utterances {
  max-width: inherit !important;
}
</style>
