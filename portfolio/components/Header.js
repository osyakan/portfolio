// components/Header.js
"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

export default function Header() {
  const pathname = usePathname();
  // 簡易的に "/" から始まる URL の場合の言語切替リンクを作成
  return (
    <header style={{ padding: "1rem", borderBottom: "1px solid #ccc" }}>
      <nav>
        <Link href="/ja" style={{ marginRight: "1rem" }}>
          日本語
        </Link>
        <Link href="/en">English</Link>
      </nav>
    </header>
  );
}
