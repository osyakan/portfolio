// app/works/[id]/page.js
import { notFound } from "next/navigation";
import worksJa from "../../data/ja/works.json";
import worksEn from "../../data/en/works.json";

export default function WorkDetail({ params }) {
  const { id, locale } = params;
  // locale に合わせたデータを選択
  const worksData = locale === "en" ? worksEn : worksJa;
  const index = parseInt(id, 10);

  if (isNaN(index) || !worksData.items[index]) {
    notFound();
  }

  const item = worksData.items[index];

  return (
    <div style={{ padding: "1rem" }}>
      <h1>{item.title}</h1>
      <p>
        DOI:{" "}
        <a href={item.doi} target="_blank" rel="noopener noreferrer">
          {item.doi}
        </a>
      </p>
    </div>
  );
}
