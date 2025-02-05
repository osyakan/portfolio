// next.config.js
/** @type {import('next').NextConfig} */
const nextConfig = {
  i18n: {
    locales: ["ja", "en"],
    defaultLocale: "en",
    localeDetection: false, // これを追加
  },
  // その他の設定
};

module.exports = nextConfig;
