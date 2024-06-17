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

merge (d: Device {id: "469f8648-2a2b-11ef-a51a-9b8194e5b03d", device: "roller mill", target: "c1", params: "{\"bead material\":\"zirconia\",\"bead weight\": 400,\"bead weight unit\":\"g\",\"bead size\":10,\"bead size unit\":\"mm\",\"rpm\":150,\"seconds\":86400}"});
match (a: `Material Add` {id: "cfdab2d6-2a29-11ef-9b90-6b9afefe5231"}),
      (b: Device {id: "469f8648-2a2b-11ef-a51a-9b8194e5b03d"})
merge (a)-[:NEXT]->(b);

merge (c: `Container Preparation` {id: "10eff6f0-2a2f-11ef-a58a-0b0b7813755e", type: "quartz tube", volume: 600, unit: "ml", target: "c2"});
match (a: Device {id: "469f8648-2a2b-11ef-a51a-9b8194e5b03d"}),
      (b: `Container Preparation` {id: "10eff6f0-2a2f-11ef-a58a-0b0b7813755e"})
merge (a)-[:NEXT]->(b);

merge (a: Collect {id: "d78ff928-2a2e-11ef-bee6-672527c4712e", source: "c1", target: "c2", method: "press", params: "{\"sheet weight\":2,\"sheet weight unit\":\"g\",\"sheet number\":10}"});
match (a: `Container Preparation` {id: "10eff6f0-2a2f-11ef-a58a-0b0b7813755e"}),
      (b: Collect {id: "d78ff928-2a2e-11ef-bee6-672527c4712e"})
merge (a)-[:NEXT]->(b);

merge (a: Seal {id: "4f8e5a80-2c48-11ef-992a-3325db096ccb", target: "c2"});
match (a: Collect {id: "d78ff928-2a2e-11ef-bee6-672527c4712e"}),
      (b: Seal {id: "4f8e5a80-2c48-11ef-992a-3325db096ccb"})
merge (a)-[:NEXT]->(b);

merge (a: Purify {id: "71549f66-2c49-11ef-afb6-7f033da321e0", target: "c2", method: "calcination", params: "{\"temperature\":680, \"unit\":\"C\", \"seconds\":1200}"});
match (a: Seal {id: "4f8e5a80-2c48-11ef-992a-3325db096ccb"}),
      (b: Purify {id: "71549f66-2c49-11ef-afb6-7f033da321e0"})
merge (a)-[:NEXT]->(b);

