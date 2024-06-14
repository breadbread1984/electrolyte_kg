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

merge (m: `Material Add` {id: "4ea0414a-2a29-11ef-9181-1fe17f6042d8", amount: "11.6148", unit: "g", target: "c1"});
merge (m: Material {smiles: "S=[Ge]=S", name: "germanium disulfide"});
match (a: `Material Add` {id: "b95e8632-2a28-11ef-beea-5fa0fe30773d"}),
      (b: `Material Add` {id: "4ea0414a-2a29-11ef-9181-1fe17f6042d8"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "4ea0414a-2a29-11ef-9181-1fe17f6042d8"}),
      (b: Material {smiles: "S=[Ge]=S"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "cfdab2d6-2a29-11ef-9b90-6b9afefe5231", amount: "18.8759", unit: "g", target: "c1"});
merge (m: Material {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3", name: "diphosphorus pentasulfide"});
match (a: `Material Add` {id: "4ea0414a-2a29-11ef-9181-1fe17f6042d8"}),
      (b: `Material Add` {id: "cfdab2d6-2a29-11ef-9b90-6b9afefe5231"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "cfdab2d6-2a29-11ef-9b90-6b9afefe5231"}),
      (b: Material {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"})
merge (a)-[:USES]->(b);


