module.exports = {
  corePlugins: {
    // 禁用Tailwind的全局基本样式，因为已经使用了ant的全局基本样式了
    preflight: false,
  },
  content: [
    './src/components/**/*.{less,js,ts,jsx,tsx}',
    './src/layouts/**/*.{less,js,ts,jsx,tsx}',
    './src/pages/**/*.{ejs,less,js,ts,jsx,tsx}'
  ],
  plugins: [],
};
