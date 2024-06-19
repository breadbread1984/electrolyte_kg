merge (c: `Container Preparation` {id: "4dad3c1c-2e06-11ef-a003-eb7cd6b82925", type: "quartz tube", params: "{\"volume\": 50,\"unit\":\"ml\"}", target: "c1"});

merge (m: `Glove Box Operation` {id: "a4fbbcd6-2e07-11ef-89c9-cbb22e52997c", type: "material add", amount: "40", unit: "mol", target: "c1", params: "{\"atmosphere\":\"nitrogen\"}"});
match (a {id: "4dad3c1c-2e06-11ef-a003-eb7cd6b82925"}),
      (b {id: "a4fbbcd6-2e07-11ef-89c9-cbb22e52997c"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Li]N([Li])[Li]", name: "lithium nitride"});
match (a {id: "a4fbbcd6-2e07-11ef-89c9-cbb22e52997c"}),
      (b {smiles: "[Li]N([Li])[Li]"})
merge (a)-[:USES]->(b);

merge (m: `Glove Box Operation` {id: "24be795e-2e08-11ef-88b0-0b6d75e7d948", type: "material add", amount: "60", unit: "mol", target: "c1", params: "{\"atmosphere\":\"nitrogen\"}"});
match (a {id: "a4fbbcd6-2e07-11ef-89c9-cbb22e52997c"}),
      (b {id: "24be795e-2e08-11ef-88b0-0b6d75e7d948"})
merge (a)-[:NEXT]->(b);

merge (m: Material {smiles: "[Li+].[Cl-]", name: "lithium chloride"});
match (a {id: "24be795e-2e08-11ef-88b0-0b6d75e7d948"}),
      (b {smiles: "[Li+].[Cl-]"})
merge (a)-[:USES]->(b);

merge (c: `Container Preparation` {id: "343a369c-2e09-11ef-b3f6-b7da7d008c97", type: "molybdenum crucible", params: "{\"volume\": 1000, \"unit\":\"ml\"}", target: "c2"});
match (a {id: "24be795e-2e08-11ef-88b0-0b6d75e7d948"}),
      (b {id: "343a369c-2e09-11ef-b3f6-b7da7d008c97"})
merge (a)-[:NEXT]->(b);

merge (a: `Glove Box Operation` {id: "f902ee34-2e08-11ef-bb2b-47dc259bd3e9", type: "collect", source: "c1", target: "c2", params: "{\"atmosphere\":\"nitrogen\",\"method\":\"tableting\",\"thickness\":10,\"unit\":\"mm\",\"diameter\":5,\"pressure\":100,\"pressure unit\":\"MPa\"}"});
match (a {id: "343a369c-2e09-11ef-b3f6-b7da7d008c97"}),
      (b {id: "f902ee34-2e08-11ef-bb2b-47dc259bd3e9"})
merge (a)-[:NEXT]->(b);

