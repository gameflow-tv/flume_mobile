/**
 * @type {import('@types/eslint').Linter.BaseConfig}
 */
module.exports = {
  files: ['*.tsx', '*.ts', '*.md', '*.mdx'],
  extends: ['plugin:@docusaurus/recommended'],
  plugins: ['@docusaurus', 'mdx'],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
  },
  parser: '@babel/eslint-parser',
  settings: {
    'mdx/code-blocks': true,
  },
};
