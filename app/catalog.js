export const catalog = [
  {
    "id": "visitenkarten",
    "name": "Visitenkarten",
    "group": "Geschäftsausstattung",
    "price": 9.99,
    "description": "Gestalte Visitenkarten individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "flyer",
    "name": "Flyer",
    "group": "Geschäftsausstattung",
    "price": 14.99,
    "description": "Gestalte Flyer individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "falzflyer",
    "name": "Falzflyer",
    "group": "Geschäftsausstattung",
    "price": 19.99,
    "description": "Gestalte Falzflyer individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "briefpapier",
    "name": "Briefpapier",
    "group": "Geschäftsausstattung",
    "price": 18.99,
    "description": "Gestalte Briefpapier individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "broschueren",
    "name": "Broschüren",
    "group": "Geschäftsausstattung",
    "price": 29.99,
    "description": "Gestalte Broschüren individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "aufkleber",
    "name": "Aufkleber",
    "group": "Aufkleber & Verpackung",
    "price": 8.99,
    "description": "Gestalte Aufkleber individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "etiketten",
    "name": "Etiketten",
    "group": "Aufkleber & Verpackung",
    "price": 12.99,
    "description": "Gestalte Etiketten individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "kartons",
    "name": "Versandkartons",
    "group": "Aufkleber & Verpackung",
    "price": 19.99,
    "description": "Gestalte Versandkartons individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "rollups",
    "name": "Roll-ups",
    "group": "Werbetechnik",
    "price": 39.99,
    "description": "Gestalte Roll-ups individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "banner",
    "name": "Werbebanner",
    "group": "Werbetechnik",
    "price": 24.99,
    "description": "Gestalte Werbebanner individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "plakate",
    "name": "Plakate",
    "group": "Werbetechnik",
    "price": 9.99,
    "description": "Gestalte Plakate individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "schilder",
    "name": "Schilder",
    "group": "Werbetechnik",
    "price": 19.99,
    "description": "Gestalte Schilder individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "shirts",
    "name": "T-Shirts",
    "group": "Textilien & Werbeartikel",
    "price": 16.99,
    "description": "Gestalte T-Shirts individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "hoodies",
    "name": "Hoodies",
    "group": "Textilien & Werbeartikel",
    "price": 29.99,
    "description": "Gestalte Hoodies individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "taschen",
    "name": "Stofftaschen",
    "group": "Textilien & Werbeartikel",
    "price": 12.99,
    "description": "Gestalte Stofftaschen individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "tassen",
    "name": "Tassen",
    "group": "Textilien & Werbeartikel",
    "price": 12.99,
    "description": "Gestalte Tassen individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "einladungen",
    "name": "Einladungen",
    "group": "Karten & Fotogeschenke",
    "price": 11.99,
    "description": "Gestalte Einladungen individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "grusskarten",
    "name": "Grußkarten",
    "group": "Karten & Fotogeschenke",
    "price": 9.99,
    "description": "Gestalte Grußkarten individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "fotobuecher",
    "name": "Fotobücher",
    "group": "Karten & Fotogeschenke",
    "price": 24.99,
    "description": "Gestalte Fotobücher individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "kalender",
    "name": "Fotokalender",
    "group": "Karten & Fotogeschenke",
    "price": 12.99,
    "description": "Gestalte Fotokalender individuell für deinen persönlichen oder geschäftlichen Auftritt."
  },
  {
    "id": "leinwand",
    "name": "Leinwanddrucke",
    "group": "Karten & Fotogeschenke",
    "price": 19.99,
    "description": "Gestalte Leinwanddrucke individuell für deinen persönlichen oder geschäftlichen Auftritt."
  }
];
export const groups = [...new Set(catalog.map(p=>p.group))];
export const euro = n => n.toLocaleString('de-DE',{style:'currency',currency:'EUR'});
