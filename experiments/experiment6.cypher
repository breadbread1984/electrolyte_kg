merge (c: `Container Preparation` {id: "f3ed3322-2d5f-11ef-b156-434811f987b8", type: "zirconia grinding jar", params: "{\"volume\":100,\"unit\":\"ml\"}", target: "c1"});

merge (d: `Glove Box Operation` {id: "28e1df1a-2d60-11ef-83f1-ebfe6b109b82", type: "material add", amount: "3.81", unit: "g", target: "c1", params: "{\"atmosphere\": \"vacuum\"}"});
match (a {id: "f3ed3322-2d5f-11ef-b156-434811f987b8"}),
      (b {id: "28e1df1a-2d60-11ef-83f1-ebfe6b109b82"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Li+].[Cl-]", name: "lithium chloride"});
match (a {id: "28e1df1a-2d60-11ef-83f1-ebfe6b109b82"}),
      (b {smiles: "[Li+].[Cl-]"})
merge (a)-[:USES]->(b);

merge (d: `Glove Box Operation` {id: "e4816c68-2d60-11ef-949a-876ae2e928b4", type: "material add", amount: "4.68", unit: "g", target: "c1", params: "{\"atmosphere\": \"vaccuum\"}"});
match (a {id: "28e1df1a-2d60-11ef-83f1-ebfe6b109b82"}),
      (b {id: "e4816c68-2d60-11ef-949a-876ae2e928b4"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Cl-].[Cl-].[Cl-].[Y+3]", name: "yttrium trichloride"});
match (a {id: "e4816c68-2d60-11ef-949a-876ae2e928b4"}),
      (b {smiles: "[Cl-].[Cl-].[Cl-].[Y+3]"})
merge (a)-[:USES]->(b);

merge (d: `Glove Box Operation` {id: "6e317106-2d61-11ef-9e96-3b6735b32ca8", type: "material add", amount: "1.32", unit: "g", target: "c1", params: "{\"atmosphere\": \"vaccuum\"}"});
match (a {id: "e4816c68-2d60-11ef-949a-876ae2e928b4"}),
      (b {id: "6e317106-2d61-11ef-9e96-3b6735b32ca8"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Cl-].[Cl-].[Cl-].[In+3]", name: "indium trichloride"});
match (a {id: "6e317106-2d61-11ef-9e96-3b6735b32ca8"}),
      (b {smiles: "[Cl-].[Cl-].[Cl-].[In+3]"})
merge (a)-[:USES]->(b);

merge (a: `Glove Box Operation` {id: "54d5756c-2d62-11ef-8019-afa201d5857a", type: "sealing", target: "c1", params: "{\"atmospherer\": \"vaccuum\",\"method\":\"rubber sealing gasket\"}"});
match (a {id: "6e317106-2d61-11ef-9e96-3b6735b32ca8"}),
      (b {id: "54d5756c-2d62-11ef-8019-afa201d5857a"})
merge (a)-[:NEXT]->(b);

merge (d: Device {id: "08c1490c-2d63-11ef-96e1-67fd393d80f9", device: "planetary ball mill", target: "c1", params: "{\"rpm\": 550,\"seconds\":36000}"});
match (a {id: "54d5756c-2d62-11ef-8019-afa201d5857a"}),
      (b {id: "08c1490c-2d63-11ef-96e1-67fd393d80f9"})
merge (a)-[:NEXT]->(b);

merge (c: `Container Preparation` {id: "de20b66e-2d63-11ef-8776-3bcce782ba11", type: "quartz tube", params: "{\"volume\":600,\"unit\":\"ml\"}", target: "c2"});
match (a {id: "08c1490c-2d63-11ef-96e1-67fd393d80f9"}),
      (b {id: "de20b66e-2d63-11ef-8776-3bcce782ba11"})
merge (a)-[:NEXT]->(b);

merge (a: `Glove Box Operation` {id: "b8c1e870-2d63-11ef-830d-4b70818a5967", type: "collect", source: "c1", target: "c2", params: "{\"atmosphere\":\"vaccuum\",\"method\":\"press\",\"sheet number\":10,\"sheet weight\":2,\"sheet weight unit\":\"g\"}"});
match (a {id: "de20b66e-2d63-11ef-8776-3bcce782ba11"}),
      (b {id: "b8c1e870-2d63-11ef-830d-4b70818a5967"})
merge (a)-[:NEXT]->(b);

merge (a: `Glove Box Operation` {id: "401928ac-2dd6-11ef-b7b3-372ab7e59fb9", type: "sealing", target: "c2", params: "{\"atmosphere\":\"vaccuum\",\"method\":\"tube sealing machine\"}"});
match (a {id: "b8c1e870-2d63-11ef-830d-4b70818a5967"}),
      (b {id: "401928ac-2dd6-11ef-b7b3-372ab7e59fb9"})
merge (a)-[:NEXT]->(b);

merge (a: Purify {id: "c7aec028-2dd7-11ef-a717-4bbe685f9e83", target: "c2", method: "calcination", params: "{\"temperature\":260,\"unit\":\"C\",\"seconds\": 36000,\"warmup rate\":\"2/min\",\"cooldown rate\":\"2/min\"}"});
match (a {id: "401928ac-2dd6-11ef-b7b3-372ab7e59fb9"}),
      (b {id: "c7aec028-2dd7-11ef-a717-4bbe685f9e83"})
merge (a)-[:NEXT]->(b);

merge (a: Device {id: "dee5d3ec-2dd9-11ef-bdee-433169f49b15", device: "ICP", target: "c2", params: "{\"elements\":\"Li:Y:In:Cl\", \"proportion\":\"3:0.8:0.2:6\",\"unit\":\"mol\"}"});
match (a {id: "c7aec028-2dd7-11ef-a717-4bbe685f9e83"}),
      (b {id: "dee5d3ec-2dd9-11ef-bdee-433169f49b15"})
merge (a)-[:NEXT]->(b);

merge (e: Experiment {id: "3d476120-2ddb-11ef-ac9a-3b7741595eb9", first_step: "f3ed3322-2d5f-11ef-b156-434811f987b8", last_step: "dee5d3ec-2dd9-11ef-bdee-433169f49b15"});
match (a {id: "3d476120-2ddb-11ef-ac9a-3b7741595eb9"})
