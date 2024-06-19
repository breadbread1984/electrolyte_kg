merge (c: `Container Preparation` {id: "29848336-2dde-11ef-84ac-ab313c0b2491", type: "agate mortar", params: "{\"volume\":100,\"unit\":\"ml\"}", target: "c1"});

merge (d: `Material Add` {id: "0f2fb7f2-2ddf-11ef-893a-a7702fcc8fcf", amount: "9.806", unit: "g", target: "c1"});
match (a {id: "29848336-2dde-11ef-84ac-ab313c0b2491"}),
      (b {id: "0f2fb7f2-2ddf-11ef-893a-a7702fcc8fcf"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Zn+2].[Cl-].[Cl-]", name: "zinc chloride"});
match (a {id: "0f2fb7f2-2ddf-11ef-893a-a7702fcc8fcf"}),
      (b {smiles: "[Zn+2].[Cl-].[Cl-]"})
merge (a)-[:USES]->(b);

merge (d: `Material Add` {id: "a715e30c-2ddf-11ef-9b60-ff4bddd20f99", amount: "4.239", unit: "g", target: "c1"});
match (a {id: "0f2fb7f2-2ddf-11ef-893a-a7702fcc8fcf"}),
      (b {id: "a715e30c-2ddf-11ef-9b60-ff4bddd20f99"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Li+].[Cl-]", name: "lithium chloride"});
match (a {id: "a715e30c-2ddf-11ef-9b60-ff4bddd20f99"}),
      (b {smiles: "[Li+].[Cl-]"})
merge (a)-[:USES]->(b);

merge (d: Device {id: "db0077c6-2de0-11ef-ab05-dba4d80fd271", device: "agate mortar and pestle mill", target: "c1", params: "{\"rpm\":\"60\",\"seconds\":1200}"});
match (a {id: "a715e30c-2ddf-11ef-9b60-ff4bddd20f99"}),
      (b {id: "db0077c6-2de0-11ef-ab05-dba4d80fd271"})
merge (a)-[:NEXT]->(b);


