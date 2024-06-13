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
match (a: `Material Add` {id: "6ddae682-2303-11ef-8543-8fce4c4a6d0c"}),
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

merge (d: Device {id: "d21ffb34-2306-11ef-9431-8720195367ce", device: "planetary ball mill", target: "c1", params: "{\"rpm\": 370, \"seconds\": 90000}"}) return d;
match (a: `Material Add` {id: "1a8925a0-2305-11ef-b5fd-0780816f3b84"}),
      (b: Device {id: "d21ffb34-2306-11ef-9431-8720195367ce"})
merge (a)-[:NEXT]->(b);

merge (d: Device {id: "7c42fe8a-2308-11ef-8b3b-afb33a91c676", device: "XRD", target: "c1", params: "{\"type\":\"2theta\",\"peaks\":[26.8,30.0,34.6]}"}) return d;
match (a: Device {id: "d21ffb34-2306-11ef-9431-8720195367ce"}),
      (b: Device {id: "7c42fe8a-2308-11ef-8b3b-afb33a91c676"})
merge (a)-[:NEXT]->(b);

merge (c: `Container Preparation` {id: "71b1a91a-292c-11ef-b282-0f194ed21d02", device: "Tammann tube", model: "PT2", target: "c2"});
match (a: Device {id: "7c42fe8a-2308-11ef-8b3b-afb33a91c676"}),
      (c: `Container Preparation` {id: "71b1a91a-292c-11ef-b282-0f194ed21d02"})
merge (a)-[:NEXT]->(c);

merge (g: `Glove Box Move` {id: "ffbc24f2-292b-11ef-b21b-e7d556892816", source: "c1", target: "c2", amount: "1.5", unit: "g", params: "{\"atmosphere\": \"argon\"}"});
match (c: `Container Preparation` {id: "71b1a91a-292c-11ef-b282-0f194ed21d02"}),
      (g: `Glove Box Move` {id: "ffbc24f2-292b-11ef-b21b-e7d556892816"})
merge (c)-[:NEXT]->(g);

merge (g: `Glove Seal` {id: "89d00144-292d-11ef-82bd-071261b563f1", target: "c2", method: "quartz wool", params: "{\"atmosphere\": \"argon\"}"});
match (a: `Glove Box Move` {id: "ffbc24f2-292b-11ef-b21b-e7d556892816"}),
      (b: `Glove Seal` {id: "89d00144-292d-11ef-82bd-071261b563f1"})
merge (a)-[:NEXT]->(b);

