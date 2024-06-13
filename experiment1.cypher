create database experiments if not exists;
use experiments;

merge (c: `Container Preparation` {id: "129fe9b8-2176-11ef-8ccd-6f653867f070", type: "zirconia grinding jar", volume: 45, unit: "ml", target: "c1"}) return c;

merge (m: `Material Add` {id: "70350e50-2176-11ef-979d-0bccd33b989f", amount: "0.661", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "[Li+].[Li+].[S-2]"}) return m;
match (a: `Container Preparation` {id: "129fe9b8-2176-11ef-8ccd-6f653867f070"}),
      (b: `Material Add` {id: "70350e50-2176-11ef-979d-0bccd33b989f"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Add` {id: "70350e50-2176-11ef-979d-0bccd33b989f"}),
      (b: Material {smiles: "[Li+].[Li+].[S-2]"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2", amount: "0.914", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"}) return m;
match (a: `Material Add` {id: "70350e50-2176-11ef-979d-0bccd33b989f"}),
      (b: `Material Add` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Add` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2"}),
      (b: Material {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a", amount: "0.164", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "BrBr"}) return m;
match (a: `Material Add` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2"}),
      (b: `Material Add` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Add` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a"}),
      (b: Material {smiles: "BrBr"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178", amount: "0.261", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "II"}) return m;
match (a: `Material Add` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a"}),
      (b: `Material Add` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Add` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178"}),
      (b: Material {smiles: "II"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae", amount: "4", unit: "g", target: "c1"}) return m;
merge (m: Material {smiles: "c1ccccc1Cl"}) return m;
match (a: `Material Add` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178"}),
      (b: `Material Add` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Add` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae"}),
      (b: Material {smiles: "c1ccccc1Cl"})
merge (a)-[r:USES]->(b);

merge (d: Device {id: "34b0fc22-2180-11ef-8268-f76426304c26", device: "planetary ball mill", target: "c1", params: "{\"rpm\": 500, \"seconds\": 144000}"}) return d;
match (a: `Material Add` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae"}),
      (b: Device {id: "34b0fc22-2180-11ef-8268-f76426304c26"})
merge (a)-[r:NEXT]->(b);

merge (m: `Material Add` {id: "7690f824-2183-11ef-8dd4-2b42360fdc8b", amount: "20", unit: "ml", target: "c1"}) return m;
match (a: `Material Add` {id: "7690f824-2183-11ef-8dd4-2b42360fdc8b"}),
      (b: Material {smiles: "c1ccccc1Cl"})
merge (a)-[r:USES]->(b);
match (a: Device {id: "34b0fc22-2180-11ef-8268-f76426304c26"}),
      (b: `Material Add` {id: "7690f824-2183-11ef-8dd4-2b42360fdc8b"})
merge (a)-[r:NEXT]->(b);

merge (c: `Container Preparation` {id: "b1af434a-2186-11ef-8aa2-e3edafa57d27", type: "schlenk bottle", volume: 50, unit: "ml", target: "c2"}) return c;
match (a: `Material Add` {id: "7690f824-2183-11ef-8dd4-2b42360fdc8b"}),
      (b: `Container Preparation` {id: "b1af434a-2186-11ef-8aa2-e3edafa57d27"})
merge (a)-[r:NEXT]->(b);

merge (c: Collect {id: "d4eced56-2188-11ef-9f4e-b33fc0abb976", source: "c1", target: "c2"}) return c;
match (a: `Container Preparation` {id: "b1af434a-2186-11ef-8aa2-e3edafa57d27"}),
      (b: Collect {id: "d4eced56-2188-11ef-9f4e-b33fc0abb976"})
merge (a)-[r:NEXT]->(b);

merge (c: Purify {id: "14d3e92e-2189-11ef-afd8-936ec9651bf8", target: "c2", method: "precipitation", params: "{\"remove\": \"supernatant solvent\"}"}) return c;
match (a: Collect {id: "d4eced56-2188-11ef-9f4e-b33fc0abb976"}),
      (b: Purify {id: "14d3e92e-2189-11ef-afd8-936ec9651bf8"})
merge (a)-[r:NEXT]->(b);

merge (d: Dry {id: "f5f271aa-2189-11ef-8d9a-7319481d758f", method: "vacuum pump", target: "c2", params: "{\"temperature\": 100, \"unit\": \"Celsius\"}"}) return d;
match (a: Purify {id: "14d3e92e-2189-11ef-afd8-936ec9651bf8"}),
      (b: Dry {id: "f5f271aa-2189-11ef-8d9a-7319481d758f"})
merge (a)-[r:NEXT]->(b);

merge (d: Device {id: "01555998-218c-11ef-b203-dfb9eb484c1c", device: "XRD", target: "c2", params: "{\"type\":\"materials\",\"peaks\":[\"Li2S\",\"P2S5\",\"LiBr\",\"LiI\"]}"}) return d;
match (a: Dry {id: "f5f271aa-2189-11ef-8d9a-7319481d758f"}),
      (b: Device {id: "01555998-218c-11ef-b203-dfb9eb484c1c"})
merge (a)-[r:NEXT]->(b);

merge (d: Device {id: "49f61712-218e-11ef-9026-fffd9ae6242a", device: "ICP", target: "c2", params: "{\"materials\":\"Li:S:P:Br:I\", \"proportion\": \"1.390:1.590:0.400:0.109:0.101\", \"unit\": \"mol\"}"}) return d;
match (a: Device {id: "01555998-218c-11ef-b203-dfb9eb484c1c"}),
      (b: Device {id: "49f61712-218e-11ef-9026-fffd9ae6242a"})
merge (a)-[r:NEXT]->(b);

merge (c: Solidify {id: "e9648b98-22de-11ef-b116-bf33c525c8ec", method: "heat", target: "c2", params: "{\"temperature\": \"188\", \"unit\": \"Celsius\", \"seconds\": \"10800\", \"environment\": \"glove box\"}"});
match (a: Device {id: "49f61712-218e-11ef-9026-fffd9ae6242a"}),
      (b: Solidify {id: "e9648b98-22de-11ef-b116-bf33c525c8ec"})
merge (a)-[r:NEXT]->(b);

merge (d: Device {id: "84905356-22e2-11ef-90ea-3b47e8ea889b", device: "XRD", target: "c2", params: "{\"type\:\"2theta\",\"peaks\":[19.9,23.6]}"});
match (a: Solidify {id: "e9648b98-22de-11ef-b116-bf33c525c8ec"}),
      (b: Device {id: "84905356-22e2-11ef-90ea-3b47e8ea889b"})
merge (a)-[r:NEXT]->(b);

merge (e: Experiment {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0", first_step: "129fe9b8-2176-11ef-8ccd-6f653867f070", last_step: "84905356-22e2-11ef-90ea-3b47e8ea889b"});
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "129fe9b8-2176-11ef-8ccd-6f653867f070"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "70350e50-2176-11ef-979d-0bccd33b989f"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "58352e26-217a-11ef-bfbf-c32be4f1b178"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "d9237110-217e-11ef-b2f1-4392ef0994ae"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "34b0fc22-2180-11ef-8268-f76426304c26"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "7690f824-2183-11ef-8dd4-2b42360fdc8b"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "b1af434a-2186-11ef-8aa2-e3edafa57d27"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "d4eced56-2188-11ef-9f4e-b33fc0abb976"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "14d3e92e-2189-11ef-afd8-936ec9651bf8"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "f5f271aa-2189-11ef-8d9a-7319481d758f"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "01555998-218c-11ef-b203-dfb9eb484c1c"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "49f61712-218e-11ef-9026-fffd9ae6242a"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "e9648b98-22de-11ef-b116-bf33c525c8ec"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {id: "84905356-22e2-11ef-90ea-3b47e8ea889b"})
merge (a)-[r:INCLUDE_STEP]->(b);

match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {smiles: "[Li+].[Li+].[S-2]"})
merge (a)-[r:USE_PRECURSOR]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"})
merge (a)-[r:USE_PRECURSOR]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {smiles: "BrBr"})
merge (a)-[r:USE_PRECURSOR]->(b);
match (a {id: "3e7ae6ae-22e4-11ef-85c7-b373cd1c0ff0"}),
      (b {smiles: "II"})
merge (a)-[r:USE_PRECURSOR]->(b);

