// components/Works.js
import Link from "next/link";

export default function Works({ data }) {
  return (
    <div>
      <h2>{data.title || "Works"}</h2>
      <ul>
        {data.items &&
          data.items.map((item, index) => (
            <li key={index}>
              {/* 動的ルーティング用に id や index を使ってリンクを生成 */}
              <Link href={`/works/${index}`}>{item.title}</Link>
            </li>
          ))}
      </ul>
    </div>
  );
}
