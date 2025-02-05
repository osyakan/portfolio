// app/layout.js
import "./globals.css";
import Header from "../components/Header";

export const metadata = {
  title: "My Portfolio",
  description: "My portfolio site",
};

export default function RootLayout({ children, params }) {
  // params.locale などで言語情報を取得できるので、必要に応じて利用します
  return (
    <html lang={params?.locale || "en"}>
      <body>
        <Header />
        <main>{children}</main>
      </body>
    </html>
  );
}
