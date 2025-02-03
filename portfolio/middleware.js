import { NextResponse } from "next/server";
import { i18n } from "./app/i18n";

export function middleware(request) {
  const pathname = request.nextUrl.pathname;

  // ルートパスへのアクセスをデフォルト言語にリダイレクト
  if (pathname === "/") {
    return NextResponse.redirect(
      new URL(`/${i18n.defaultLocale}`, request.url)
    );
  }

  // サポートされている言語かチェック
  const pathnameIsMissingLocale = i18n.locales.every(
    (locale) => !pathname.startsWith(`/${locale}/`) && pathname !== `/${locale}`
  );

  if (pathnameIsMissingLocale) {
    return NextResponse.redirect(
      new URL(`/${i18n.defaultLocale}${pathname}`, request.url)
    );
  }
}

export const config = {
  matcher: ["/((?!api|_next/static|_next/image|favicon.ico).*)"],
};
