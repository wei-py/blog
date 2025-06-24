import antfu from "@antfu/eslint-config";

export default antfu({
  formatters: {
    markdown: true,
  },
  vue: true,
  markdown: false,
  stylistic: {
    semi: true,
    proseWrap: "preserve",
    arrowParens: "always",
    indent: 2,
    quotes: "double",
  },
  rules: {
    "antfu/no-top-level-await": "off",
    "ts/no-empty-object-type": "off",
    "vue/require-v-for-key": "off",
    "style/no-tabs": "off",
  },
});
