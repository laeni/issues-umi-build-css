import { defineConfig } from 'umi';

export default defineConfig({
  nodeModulesTransform: {
    type: 'none',
  },
  fastRefresh: {},
  // Using PostCSS
  // extraPostCSSPlugins: [
  //   require('tailwindcss')(),
  // ],
});
