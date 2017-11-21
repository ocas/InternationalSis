SELECT Year FROM ApplicationCycles ORDER BY Year;
SELECT DISTINCT Code FROM Terms;
SELECT C2.Code AS Iso3166_1_alpha2, C2.Iso31661Alpha3 AS Iso3166_1_alpha3, C3.Content AS CountryName, C1.Code AS Iso3166_2_subdivision, C4.Content AS ProvinceName
  FROM Provinces C1
  INNER JOIN I18NProvinces C4 ON C1.Id = C4.Id AND C4.LanguageCultureName = 'en-CA'
  INNER JOIN Countries C2 ON C1.CountryId = C2.Id
  INNER JOIN I18NCountries C3 ON C2.Id = C3.Id AND C3.LanguageCultureName = 'en-CA'
  ORDER BY Iso3166_1_alpha2, Iso3166_2_subdivision;
SELECT C1.Code AS Iso6392_1, C1.Iso6392Code AS Iso6392_2, C2.Content AS Language
  FROM Languages C1
  INNER JOIN I18NLanguages C2 ON C1.Id = C2.Id AND C2.LanguageCultureName = 'en-CA'
  ORDER BY DisplayOrder, Content;
