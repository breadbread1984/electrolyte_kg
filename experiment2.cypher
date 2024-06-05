create database experiments if not exists;
use experiments;

merge (c: `Container Preparation` {id: "f2be25f6-2300-11ef-ac2e-ef73062c8016", type: "planetary ball mill zirconia", volume: 45, unit: "ml", target: "c1"}) return c;

merge (m: `Material Add` {id: "c5402fe2-2301-11ef-957e-cf8ecbf307f1", amount: "0.464", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "[Li+].[Li+].[S-2]"}) return m;
match (a: `Container Preparation` {id: "f2be25f6-2300-11ef-ac2e-ef73062c8016"}),
      (b: `Material Add` {id: "c5402fe2-2301-11ef-957e-cf8ecbf307f1"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "c5402fe2-2301-11ef-957e-cf8ecbf307f1"}),
      (b: Material {smiles: "[Li+].[Li+].[S-2]"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "6ddae682-2303-11ef-8543-8fce4c4a6d0c", amount: "0.591", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"}) return m;
match (a: `Material Add` {id: "c5402fe2-2301-11ef-957e-cf8ecbf307f1"}),
      (b: `Material Add` {id: "6ddae682-2303-11ef-8543-8fce4c4a6d0c"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "6ddae682-2303-11ef-8543-8fce4c4a6d0c"}),
      (b: Material {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "426cb268-2304-11ef-8370-7ba134642a67", amount: "0.360", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "[Li+].[Cl-]"}) return m;
match (a: `Material Add` {id: "c5402fe2-2301-11ef-957e-cf8ecbf307f1"}),
      (b: `Material Add` {id: "426cb268-2304-11ef-8370-7ba134642a67"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "426cb268-2304-11ef-8370-7ba134642a67"}),
      (b: Material {smiles: "[Li+].[Cl-]"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "1a8925a0-2305-11ef-b5fd-0780816f3b84", amount: "0.085", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "S1SSSSSSS1"}) return m;
match (a: `Material Add` {id: "426cb268-2304-11ef-8370-7ba134642a67"}),
      (b: `Material Add` {id: "1a8925a0-2305-11ef-b5fd-0780816f3b84"})
merge (a)-[:NEXT]->(b);
match (a: `Material Add` {id: "1a8925a0-2305-11ef-b5fd-0780816f3b84"}),
      (b: Material {smiles: "S1SSSSSSS1"})
merge (a)-[:USES]->(b);

