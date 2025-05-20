import antfu from "@antfu/eslint-config";

export default antfu({
  // formatters: {
  //   "style/no-multiple-empty-lines": ["error", { max: 1, maxEOF: 1 }],
  // },
  formatters: true,
  vue: true,
  stylistic: {
    semi: true,
    indent: 2,
    quotes: "double",
  },
});
