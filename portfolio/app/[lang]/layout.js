import Link from "next/link";
import { i18n } from "../i18n";
import { getDictionary } from "@/lib/dictionary";

export async function generateMetadata({ params }) {
  const dictionary = await getDictionary(params.lang);

  return {
    title: dictionary.title,
    description: dictionary.description,
  };
}

export default function LocaleLayout({ children, params }) {
  const { lang } = params;

  return (
    <html lang={lang}>
      <body>
        <header className="p-4 bg-gray-100">
          <nav className="flex gap-4 justify-center">
            {i18n.locales.map((locale) => (
              <Link
                key={locale}
                href={`/${locale}`}
                className={`px-4 py-2 rounded ${
                  lang === locale ? "bg-blue-500 text-white" : "bg-white"
                }`}
              >
                {locale.toUpperCase()}
              </Link>
            ))}
          </nav>
        </header>
        <main className="max-w-4xl mx-auto p-4">{children}</main>
      </body>
    </html>
  );
}
