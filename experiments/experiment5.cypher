merge (c: `Container Preparation` {id: "1020cf12-2d1b-11ef-8a86-97701c4108ae", type: "zirconia grinding jar", params: "{\"volume\":45,\"unit\":\"ml\"}", target: "c1"});

merge (m: `Material Add` {id: "8b84b8b2-2d1b-11ef-ac81-0f8af50af53e", amount: "0.5450", unit: "g", target: "c1"});
match (a {id: "1020cf12-2d1b-11ef-8a86-97701c4108ae"}),
      (b {id: "8b84b8b2-2d1b-11ef-ac81-0f8af50af53e"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Li+].[Li+].[S-2]", name: "lithium sulfide"});
match (a {id: "8b84b8b2-2d1b-11ef-ac81-0f8af50af53e"}),
      (b {smiles: "[Li+].[Li+].[S-2]"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "f6443b14-2d1b-11ef-8e0a-b3f1d15bebae", amount: "0.8857", unit: "g", target: "c1"});
match (a {id: "8b84b8b2-2d1b-11ef-ac81-0f8af50af53e"}),
      (b {id: "f6443b14-2d1b-11ef-8e0a-b3f1d15bebae"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3", name: "diphosphorus pentasulfide"});
match (a {id: "f6443b14-2d1b-11ef-8e0a-b3f1d15bebae"}),
      (b {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "931daea2-2d1c-11ef-8cac-4f306d0a3ddf", amount: "0.2768", unit: "g", target: "c1"});
match (a {id: "f6443b14-2d1b-11ef-8e0a-b3f1d15bebae"}),
      (b {id: "931daea2-2d1c-11ef-8cac-4f306d0a3ddf"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Li+].[Br-]", name: "lithium bromide"});
match (a {id: "931daea2-2d1c-11ef-8cac-4f306d0a3ddf"}),
      (b {smiles: "[Li+].[Br-]"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "5a107fbc-2d1d-11ef-b5c6-bf6269e55327", amount: "0.2844", unit: "g", target: "c1"});
match (a {id: "931daea2-2d1c-11ef-8cac-4f306d0a3ddf"}),
      (b {id: "5a107fbc-2d1d-11ef-b5c6-bf6269e55327"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Li+].[I-]", name: "lithium iodide"});
match (a {id: "5a107fbc-2d1d-11ef-b5c6-bf6269e55327"}),
      (b {smiles: "[Li+].[I-]"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "fa24a848-2d1d-11ef-b62b-fbcf00e9574d", amount: "0.0081", unit: "g", target: "c1"});
match (a {id: "5a107fbc-2d1d-11ef-b5c6-bf6269e55327"}),
      (b {id: "fa24a848-2d1d-11ef-b62b-fbcf00e9574d"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Mn]S", name: "manganese sulfide"});
match (a {id: "fa24a848-2d1d-11ef-b62b-fbcf00e9574d"}),
      (b {smiles: "[Mn]S"})
merge (a)-[:USES]->(b);

merge (m: `Material Add` {id: "c60d262e-2d1e-11ef-941b-d7323080b519", amount: "4.0", unit: "g", target: "c1"});
match (a {id: "fa24a848-2d1d-11ef-b62b-fbcf00e9574d"}),
      (b {id: "c60d262e-2d1e-11ef-941b-d7323080b519"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "Cc1ccccc1", name: "toluene"});
match (a {id: "c60d262e-2d1e-11ef-941b-d7323080b519"}),
      (b {smiles: "Cc1ccccc1"})
merge (a)-[:USES]->(b);


