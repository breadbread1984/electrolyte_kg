merge (c: `Container Preparation` {id: "000faa8a-2a28-11ef-b39f-fbe6d6d8c705", type: "roller mill pot", volume: 500, unit: "ml", target: "c1"});

merge (m: `Material Add` {id: "2bbe83ea-2a28-11ef-9122-13e2eaafaa20", amount: "19.3145", unit: "g", target: "c1"});
merge (m: Material {smiles: "[Li+].[Li+].[S-2]", name: "lithium sulfide"});
match (a: `Container Preparation` {id: "000faa8a-2a28-11ef-b39f-fbe6d6d8c705"}),
      (b: `Material Add` {id: "2bbe83ea-2a28-11ef-9122-13e2eaafaa20"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "2bbe83ea-2a28-11ef-9122-13e2eaafaa20"}),
      (b: Material {smiles: "[Li+].[Li+].[S-2]"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "b95e8632-2a28-11ef-beea-5fa0fe30773d", amount: "0.1948", unit: "g", target: "c1"});
merge (m: Material {smiles: "[Li+].[Li+].[O-][O-]", name: "lithium peroxide"});
match (a: `Material Add` {id: "2bbe83ea-2a28-11ef-9122-13e2eaafaa20"}),
      (b: `Material Add` {id: "b95e8632-2a28-11ef-beea-5fa0fe30773d"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "b95e8632-2a28-11ef-beea-5fa0fe30773d"}),
      (b: Material {smiles: "[Li+].[Li+].[O-][O-]"})
merge (a)-[:USES]->(b);


