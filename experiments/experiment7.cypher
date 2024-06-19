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

merge (d: `Glove Box Operation` {id: "cab2f244-2de1-11ef-b03d-e38b574f9c4d", type: "heating", target: "c1", params: "{\"atmosphere\":\"vaccuum\",\"temperature\":100,\"unit\":\"C\",\"warmup seconds\":\"none\",\"warmup rate\":\"none\",\"duration seconds\":21600}"});
match (a {id: "db0077c6-2de0-11ef-ab05-dba4d80fd271"}),
      (b {id: "cab2f244-2de1-11ef-b03d-e38b574f9c4d"})
merge (a)-[:NEXT]->(b);

merge (c: `Container Preparation` {id: "4f1c645e-2de5-11ef-b2f4-8f0becbe363a", type: "boron nitride crucible with lid", params: "{\"volume\":100,\"unit\":\"ml\"}", target: "c2"});
match (a {id: "cab2f244-2de1-11ef-b03d-e38b574f9c4d"}),
      (b {id: "4f1c645e-2de5-11ef-b2f4-8f0becbe363a"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "c9e7b670-2de5-11ef-9262-b3854147656f", type: "collect", source: "c1", target: "c2", params: "{\"atmosphere\":\"argon\",\"method\":\"none\"}"});
match (a {id: "4f1c645e-2de5-11ef-b2f4-8f0becbe363a"}),
      (b {id: "c9e7b670-2de5-11ef-9262-b3854147656f"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "2be38494-2de6-11ef-ab02-d36d4e5ae197", type: "heating", target: "c2", params: "{\"atmosphere\":\"argon\",\"temperature\":320,\"unit\":\"C\",\"warmup seconds\":\"none\",\"warmup rate\":\"none\",\"duration seconds\":1800}"});
match (a {id: "c9e7b670-2de5-11ef-9262-b3854147656f"}),
      (b {id: "2be38494-2de6-11ef-ab02-d36d4e5ae197"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "5130b554-2de7-11ef-b5a0-b355c9a2c46a", type: "quenching", target: "c2", params: "{\"atmosphere\":\"argon\",\"method\":\"pressed by two liquid nitrogen colled graphite plates\"}"});
match (a {id: "2be38494-2de6-11ef-ab02-d36d4e5ae197"}),
      (b {id: "5130b554-2de7-11ef-b5a0-b355c9a2c46a"})
merge (a)-[:NEXT]->(b);

merge (d: `Glove Box Operation` {id: "b036be22-2e00-11ef-ba49-77ff779dce0e", type: "annealing", target: "c2", params: "{\"atmosphere\":\"argon\",\"temperature\":550,\"unit\":\"C\",\"insulation seconds\":36000,\"cooldown rate\":\"5/hr\"}"});
match (a {id: "5130b554-2de7-11ef-b5a0-b355c9a2c46a"}),
      (b {id: "b036be22-2e00-11ef-ba49-77ff779dce0e"})
merge (a)-[:NEXT]->(b);

merge (d: Device {id: "ca5f85a2-2e02-11ef-beae-0b922d744aee", device: "ICP", target: "c2", params: "{\"elements\":\"Zn:Li:Cl\", \"proportion\":\"3:2:8\",\"unit\":\"mol\"}"});
match (a {id: "b036be22-2e00-11ef-ba49-77ff779dce0e"}),
      (b {id: "ca5f85a2-2e02-11ef-beae-0b922d744aee"})
merge (a)-[:NEXT]->(b);

merge (e: Experiment {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d", first_step: "29848336-2dde-11ef-84ac-ab313c0b2491", last_step: "ca5f85a2-2e02-11ef-beae-0b922d744aee"});
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "29848336-2dde-11ef-84ac-ab313c0b2491"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "0f2fb7f2-2ddf-11ef-893a-a7702fcc8fcf"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "a715e30c-2ddf-11ef-9b60-ff4bddd20f99"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "db0077c6-2de0-11ef-ab05-dba4d80fd271"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "cab2f244-2de1-11ef-b03d-e38b574f9c4d"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "4f1c645e-2de5-11ef-b2f4-8f0becbe363a"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "c9e7b670-2de5-11ef-9262-b3854147656f"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "2be38494-2de6-11ef-ab02-d36d4e5ae197"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "5130b554-2de7-11ef-b5a0-b355c9a2c46a"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "b036be22-2e00-11ef-ba49-77ff779dce0e"})
merge (a)-[:INCLUDE_STEP]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {id: "ca5f85a2-2e02-11ef-beae-0b922d744aee"})
merge (a)-[:INCLUDE_STEP]->(b);

match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {smiles: "[Zn+2].[Cl-].[Cl-]"})
merge (a)-[:USE_PRECURSOR]->(b);
match (a {id: "47f3f6f6-2e03-11ef-ac68-97fa77c6c66d"}),
      (b {smiles: "[Li+].[Cl-]"})
merge (a)-[:USE_PRECURSOR]->(b);

