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

merge (d: Device {id: "43b74cf8-2d1f-11ef-a03b-9bd27ebe0cfa", device: "planetary ball mill", target: "c1", params: "{\"rpm\": 500, \"seconds\": 144000}"});
match (a {id: "c60d262e-2d1e-11ef-941b-d7323080b519"}),
      (b {id: "43b74cf8-2d1f-11ef-a03b-9bd27ebe0cfa"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "f8235e7a-2d1f-11ef-8b42-170abba303ca", type: "material add", amount: "8.6", unit: "g", target: "c1", params: "{\"atmosphere\":\"argon\"}"});
match (a {id: "43b74cf8-2d1f-11ef-a03b-9bd27ebe0cfa"}),
      (b {id: "f8235e7a-2d1f-11ef-8b42-170abba303ca"})
merge (a)-[:NEXT]->(b);

match (a {id: "f8235e7a-2d1f-11ef-8b42-170abba303ca"}),
      (b {smiles: "Cc1ccccc1"})
merge (a)-[:USES]->(b);

merge (c: `Container Preparation` {id: "a125bab0-2d41-11ef-aabc-5f184f9d0c2f", type: "bucket for plate heater", params: "{\"volume\": 45,\"unit\":\"ml\"}", target: "c2"});
match (a {id: "f8235e7a-2d1f-11ef-8b42-170abba303ca"}),
      (b {id: "a125bab0-2d41-11ef-aabc-5f184f9d0c2f"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "2d06fe2c-2d42-11ef-ad55-b3df7c73bb93", type: "collect", source: "c1", target: "c2", params: "{\"atmosphere\":\"argon\",\"method\":\"none\"}"});
match (a {id: "a125bab0-2d41-11ef-aabc-5f184f9d0c2f"}),
      (b {id: "2d06fe2c-2d42-11ef-ad55-b3df7c73bb93"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "1c6687fc-2d3f-11ef-8559-1fc41a24e17f", type: "purify", target: "c2", params: "{\"atmosphere\":\"argon\",\"method\":\"precipitation\",\"remove\":\"supernatant solvent\"}"});
match (a {id: "2d06fe2c-2d42-11ef-ad55-b3df7c73bb93"}),
      (b {id: "1c6687fc-2d3f-11ef-8559-1fc41a24e17f"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "769c9078-2d3e-11ef-8ad5-7be1b899f0bd", type: "heating", target: "c2", params: "{\"atmosphere\":\"argon\",\"temperature\":80,\"unit\":\"C\",\"warmup seconds\":\"none\",\"warmup rate\":\"none\",\"duration seconds\":\"10800\"}"});
match (a {id: "1c6687fc-2d3f-11ef-8559-1fc41a24e17f"}),
      (b {id: "769c9078-2d3e-11ef-8ad5-7be1b899f0bd"})
merge (a)-[:NEXT]->(b);

merge (d: Device {id: "0544e850-2d41-11ef-8e3f-231ca3cfccf3", device: "XRD", target: "c2", params: "{\"type\":\"materials\",\"peaks\":[\"Li2S\",\"P2S5\",\"LiBr\",\"LiI\"]}"});
match (a {id: "769c9078-2d3e-11ef-8ad5-7be1b899f0bd"}),
      (b {id: "0544e850-2d41-11ef-8e3f-231ca3cfccf3"})
merge (a)-[:NEXT]->(b);

merge (d: Device {id: "e397c8c8-2d43-11ef-af9f-4fb626e0d8a4", device: "ICP", target: "c2", params: "{\"elements\":\"Li:S:P:Br:I\", \"proportion\": \"1.390:1.590:0.400:0.109:0.101\", \"unit\": \"mol\"}"});
match (a {id: "0544e850-2d41-11ef-8e3f-231ca3cfccf3"}),
      (b {id: "e397c8c8-2d43-11ef-af9f-4fb626e0d8a4"})
merge (a)-[:NEXT]->(b);

merge (e: Experiment {id: "6d01b882-2d4c-11ef-a880-c347003465c5", first_step: "1020cf12-2d1b-11ef-8a86-97701c4108ae", last_step: "e397c8c8-2d43-11ef-af9f-4fb626e0d8a4"});
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "1020cf12-2d1b-11ef-8a86-97701c4108ae"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "8b84b8b2-2d1b-11ef-ac81-0f8af50af53e"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "f6443b14-2d1b-11ef-8e0a-b3f1d15bebae"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "931daea2-2d1c-11ef-8cac-4f306d0a3ddf"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "5a107fbc-2d1d-11ef-b5c6-bf6269e55327"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "fa24a848-2d1d-11ef-b62b-fbcf00e9574d"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "c60d262e-2d1e-11ef-941b-d7323080b519"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "43b74cf8-2d1f-11ef-a03b-9bd27ebe0cfa"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "f8235e7a-2d1f-11ef-8b42-170abba303ca"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "a125bab0-2d41-11ef-aabc-5f184f9d0c2f"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "2d06fe2c-2d42-11ef-ad55-b3df7c73bb93"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "1c6687fc-2d3f-11ef-8559-1fc41a24e17f"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "769c9078-2d3e-11ef-8ad5-7be1b899f0bd"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "0544e850-2d41-11ef-8e3f-231ca3cfccf3"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {id: "e397c8c8-2d43-11ef-af9f-4fb626e0d8a4"})
merge (a)-[:INCLUDE_STEP]->(b);

match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {smiles: "[Li+].[Li+].[S-2]"})
merge (a)-[:USE_PRECURSOR]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {smiles: "P12(=S)SP3(=S)SP(=S)(S1)SP(=S)(S2)S3"})
merge (a)-[:USE_PRECURSOR]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {smiles: "[Li+].[Br-]"})
merge (a)-[:USE_PRECURSOR]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {smiles: "[Li+].[I-]"})
merge (a)-[:USE_PRECURSOR]->(b);
match (a {id: "6d01b882-2d4c-11ef-a880-c347003465c5"}),
      (b {smiles: "[Mn]S"})
merge (a)-[:USE_PRECURSOR]->(b);
