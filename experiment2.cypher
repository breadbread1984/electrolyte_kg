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

merge (a: `Glove Box Operation` {id: "ffbc24f2-292b-11ef-b21b-e7d556892816", type: "moving", source: "c1", target: "c2", params: "{\"atmosphere\":\"argon\",\"amount\":\"1.5\",\"unit\":\"g\"}"});
match (a: `Container Preparation` {id: "71b1a91a-292c-11ef-b282-0f194ed21d02"}),
      (b: `Glove Box Operation` {id: "ffbc24f2-292b-11ef-b21b-e7d556892816"})
merge (a)-[:NEXT]->(b);

merge (a: `Glove Box Operation` {id: "89d00144-292d-11ef-82bd-071261b563f1", type: "sealing", target: "c2", params: "{\"atmosphere\":\"argon\",\"method\":\"quartz wool\"}"});
match (a: `Glove Box Operation` {id: "ffbc24f2-292b-11ef-b21b-e7d556892816"}),
      (b: `Glove Box Operation` {id: "89d00144-292d-11ef-82bd-071261b563f1"})
merge (a)-[:NEXT]->(b);

merge (a: `Glove Box Operation` {id: "393f0142-292f-11ef-9f40-cfa7fb5238f9", type: "sealing", target: "c2", params: "{\"atmosphere\":\"argon\",\"method\":\"SUS sealed container\"}"});
match (a: `Glove Box Operation` {id: "89d00144-292d-11ef-82bd-071261b563f1"}),
      (b: `Glove Box Operation` {id: "393f0142-292f-11ef-9f40-cfa7fb5238f9"})
merge (a)-[:NEXT]->(b);

merge (a: `Glove Box Operation` {id: "d2b6c486-292f-11ef-a72b-1ba46a14eb9f", type: "heating", target: "c2", params: "{\"atmosphere\":\"argon\",\"temperature\":\"520\",\"unit\":\"Celsius\",\"warmup seconds\":\"10800\",\"warmup rate\":\"2.5/min\",\"duration seconds\":\"28800\"}"});
match (a: `Glove Box Operation` {id: "393f0142-292f-11ef-9f40-cfa7fb5238f9"}),
      (b: `Glove Box Operation` {id: "d2b6c486-292f-11ef-a72b-1ba46a14eb9f"})
merge (a)-[:NEXT]->(b);

merge (a: `Glove Box Operation` {id: "1d7fb9a4-2931-11ef-bfbf-f7e32afddca1", type: "cooling", target: "c2", params: "{\"atmosphere\":\"argon\"}"});
match (a: `Glove Box Operation` {id: "d2b6c486-292f-11ef-a72b-1ba46a14eb9f"}),
      (b: `Glove Box Operation` {id: "1d7fb9a4-2931-11ef-bfbf-f7e32afddca1"})
merge (a)-[:NEXT]->(b);

merge (a: Device {id: "1ae144e0-2933-11ef-8f45-0730b77a35a3", device: "XRD", target: "c2", params: "{\"type\":\"2theta\",\"peaks\":[15.6,18.0,25.6,30.1,31.5,45.2]}"});
match (a: `Glove Box Operation` {id: "1d7fb9a4-2931-11ef-bfbf-f7e32afddca1"}),
      (b: Device {id: "1ae144e0-2933-11ef-8f45-0730b77a35a3"})
merge (a)-[:NEXT]->(b);

merge (a: Device {id: "9640b026-2933-11ef-8013-d73c7dc7aa6a", device: "ICP", target: "c2", params: "{\"materials\":\"Li:S:P:Cl\",\"5.40:4.45:1.00:1.70\",\"unit\":\"mol\"}"});
match (a: Device {id: "1ae144e0-2933-11ef-8f45-0730b77a35a3"}),
      (b: Device {id: "9640b026-2933-11ef-8013-d73c7dc7aa6a"})
merge (a)-[:NEXT]->(b);

merge (e: Experiment {id: "b47f0708-2948-11ef-8403-33a84d922f2c", first_step: "f2be25f6-2300-11ef-ac2e-ef73062c8016", last_step: "9640b026-2933-11ef-8013-d73c7dc7aa6a"});
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "f2be25f6-2300-11ef-ac2e-ef73062c8016"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "c5402fe2-2301-11ef-957e-cf8ecbf307f1"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "6ddae682-2303-11ef-8543-8fce4c4a6d0c"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "426cb268-2304-11ef-8370-7ba134642a67"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "1a8925a0-2305-11ef-b5fd-0780816f3b84"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "d21ffb34-2306-11ef-9431-8720195367ce"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "7c42fe8a-2308-11ef-8b3b-afb33a91c676"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "71b1a91a-292c-11ef-b282-0f194ed21d02"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "ffbc24f2-292b-11ef-b21b-e7d556892816"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "89d00144-292d-11ef-82bd-071261b563f1"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "393f0142-292f-11ef-9f40-cfa7fb5238f9"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "d2b6c486-292f-11ef-a72b-1ba46a14eb9f"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "1d7fb9a4-2931-11ef-bfbf-f7e32afddca1"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "1ae144e0-2933-11ef-8f45-0730b77a35a3"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "b47f0708-2948-11ef-8403-33a84d922f2c"}),
      (b {id: "9640b026-2933-11ef-8013-d73c7dc7aa6a"})
merge (a)-[r:INCLUDE_STEP]->(b);
