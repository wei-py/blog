import antfu from "@antfu/eslint-config";

export default antfu({
  formatters: true,
  vue: true,
  stylistic: {
    semi: true,
    indent: 2,
    quotes: "double",
  },
  markdown: false,
});
