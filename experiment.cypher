drop database experiments;
create database experiments;
use experiments;

merge (c: `Container Preparation` {id: "129fe9b8-2176-11ef-8ccd-6f653867f070", type: "planetary ball mill zirconia", volume: 45, unit: "cc", target: "c1"}) return c;

merge (m: `Material Preparation` {id: "70350e50-2176-11ef-979d-0bccd33b989f", amount: "0.661", unit: "g", target: "c1"}) return m;
merge (m: Material {id: "8a65bc10-2177-11ef-b484-e7295e4bd850", smiles: "[Li+].[Li+].[S-2]"}) return m;
match (a: `Container Preparation` {id: "129fe9b8-2176-11ef-8ccd-6f653867f070"}),
      (b: `Material Preparation` {id: "70350e50-2176-11ef-979d-0bccd33b989f"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Preparation` {id: "70350e50-2176-11ef-979d-0bccd33b989f"}),
      (b: Material {id: "8a65bc10-2177-11ef-b484-e7295e4bd850"})
merge (a)-[:USES]->(b);

merge (m: `Material Preparation` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2", amount: "0.914", unit: "g", target: "c1"}) return m;
merge (m: Material {id: "d6ee8eb2-2178-11ef-9cea-bff3c07576ec", smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"}) return m;
match (a: `Material Preparation` {id: "70350e50-2176-11ef-979d-0bccd33b989f"}),
      (b: `Material Preparation` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Preparation` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2"}),
      (b: Material {id: "d6ee8eb2-2178-11ef-9cea-bff3c07576ec"})
merge (a)-[r:USES]->(b);

merge (m: `Material Preparation` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a", amount: "0.164", unit: "g", target: "c1"}) return m;
merge (m: Material {id: "d07bae2e-2179-11ef-b6dc-bb9fdd790895", smiles: "BrBr"}) return m;
match (a: `Material Preparation` {id: "0ecd2020-2177-11ef-ae10-1fc490bcaac2"}),
      (b: `Material Preparation` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Preparation` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a"}),
      (b: Material {id: "d07bae2e-2179-11ef-b6dc-bb9fdd790895"})
merge (a)-[r:USES]->(b);

merge (m: `Material Preparation` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178", amount: "0.261", unit: "g", target: "c1"}) return m;
merge (m: Material {id: "6ed45d82-217a-11ef-97ac-8b75c2fa7dfb", smiles: "II"}) return m;
match (a: `Material Preparation` {id: "b5cb59b2-2179-11ef-af0a-c7a0c34dd12a"}),
      (b: `Material Preparation` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Preparation` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178"}),
      (b: Material {id: "6ed45d82-217a-11ef-97ac-8b75c2fa7dfb"})
merge (a)-[r:USES]->(b);

merge (m: `Material Preparation` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae", amount: "4", unit: "g", target: "c1"}) return m;
merge (m: Material {id: "fdec2a96-217e-11ef-9770-9b85617e399b", smiles: "c1ccccc1Cl"}) return m;
match (a: `Material Preparation` {id: "58352e26-217a-11ef-bfbf-c32be4f1b178"}),
      (b: `Material Preparation` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae"})
merge (a)-[r:NEXT]->(b);
match (a: `Material Preparation` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae"}),
      (b: Material {id: "fdec2a96-217e-11ef-9770-9b85617e399b"})
merge (a)-[r:USES]->(b);

merge (d: `Planetary Ball Mill` {id: "34b0fc22-2180-11ef-8268-f76426304c26", target: "c1", rpm: 500, seconds: 144000}) return d;
match (a: `Material Preparation` {id: "d9237110-217e-11ef-b2f1-4392ef0994ae"}),
      (b: `Planetary Ball Mill` {id: "34b0fc22-2180-11ef-8268-f76426304c26"})
merge (a)-[r:NEXT]->(b);


