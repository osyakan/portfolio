import { getDictionary } from "@/lib/dictionary";

export default async function Home({ params }) {
  const { lang } = params;
  const dictionary_profile = await getDictionary(lang, "profile");

  return (
    <div className="text-center">
      <h1 className="text-4xl font-bold mb-4">{dictionary_profile.name}</h1>
      <p className="text-xl">{dictionary_profile.about}</p>
      <nav className="mt-8">
        <ul className="flex gap-4 justify-center">
          <li>
            <a href="#" className="text-blue-500">
              {dictionary_profile.about}
            </a>
          </li>
          <li>
            <a href="#" className="text-blue-500">
              {dictionary_profile.about}
            </a>
          </li>
        </ul>
      </nav>
    </div>
  );
}
