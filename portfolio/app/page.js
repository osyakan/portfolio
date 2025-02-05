// app/page.js
import About from "../components/About";
import Works from "../components/Works";
import Publication from "../components/Publication";

// それぞれの言語ごとの JSON データをインポート
import aboutJa from "../data/ja/about.json";
import aboutEn from "../data/en/about.json";
import worksJa from "../data/ja/works.json";
import worksEn from "../data/en/works.json";
import publicationJa from "../data/ja/publication.json";
import publicationEn from "../data/en/publication.json";

export default function Home({ params }) {
  // Next.js の i18n 機能で渡される locale (なければ defaultLocale を利用)
  const locale = params.locale || "ja";

  // locale に応じて適切な JSON を選択
  const aboutData = locale === "en" ? aboutEn : aboutJa;
  const worksData = locale === "en" ? worksEn : worksJa;
  const publicationData = locale === "en" ? publicationEn : publicationJa;

  return (
    <div>
      <section id="about">
        <About data={aboutData} />
      </section>
      <section id="works">
        <Works data={worksData} locale={locale} />
      </section>
      <section id="publication">
        <Publication data={publicationData} />
      </section>
    </div>
  );
}
