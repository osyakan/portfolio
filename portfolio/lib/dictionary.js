const dictionaries = {
  en: {
    profile: () =>
      import("@/app/dictionaries/en/profile.json").then(
        (module) => module.default
      ),
    // works: () =>
    //   import("@/app/dictionaries/en/works.json").then(
    //     (module) => module.default
    //   ),
  },
  ja: {
    profile: () =>
      import("@/app/dictionaries/ja/profile.json").then(
        (module) => module.default
      ),
    // works: () =>
    //   import("@/app/dictionaries/ja/works.json").then(
    //     (module) => module.default
    //   ),
  },
};

export const getDictionary = async (locale, namespace = "profile") => {
  return dictionaries[locale][namespace]();
};
