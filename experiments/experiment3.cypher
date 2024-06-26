merge (c: `Container Preparation` {id: "211cf444-2951-11ef-a224-1335ae9455e7", type: "zirconia grinding jar", params:"{\"volume\":45,\"unit\":\"ml\"}", target: "c1"});

merge (m: `Material Add` {id: "313c0800-2952-11ef-9a17-ebba0962c8f6", amount: "11.9", unit: "g", target: "c1"});
merge (m: Material {smiles: "S1SSSSSSS1", name: "sulfur"});
match (a {id: "211cf444-2951-11ef-a224-1335ae9455e7"}),
      (b {id: "313c0800-2952-11ef-9a17-ebba0962c8f6"})
merge (a)-[r:NEXT]->(b);
match (a {id: "313c0800-2952-11ef-9a17-ebba0962c8f6"}),
      (b {smiles: "S1SSSSSSS1"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "d222b2be-2952-11ef-89a0-a7b867f72d78", amount: "2.3", unit: "g", target: "c1"});
merge (m: Material {smiles: "[P]", name: "phosphorus"});
match (a {id: "313c0800-2952-11ef-9a17-ebba0962c8f6"}),
      (b {id: "d222b2be-2952-11ef-89a0-a7b867f72d78"})
merge (a)-[r:NEXT]->(b);
match (a {id: "d222b2be-2952-11ef-89a0-a7b867f72d78"}),
      (b {smiles: "[P]"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "9bf9273a-2953-11ef-b752-e7f8732086cd", amount: "2.6", unit: "g", target: "c1"});
merge (m: Material {smiles: "[Li]", name: "lithium"});
match (a {id: "d222b2be-2952-11ef-89a0-a7b867f72d78"}),
      (b {id: "9bf9273a-2953-11ef-b752-e7f8732086cd"})
merge (a)-[r:NEXT]->(b);
match (a {id: "9bf9273a-2953-11ef-b752-e7f8732086cd"}),
      (b {smiles: "[Li]"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "23b701e2-2954-11ef-b9f1-a7eff596877f", amount: "3.1", unit: "g", target: "c1"});
merge (m: Material {smiles: "[Li+].[Cl-]", name: "lithium chloride"});
match (a {id: "9bf9273a-2953-11ef-b752-e7f8732086cd"}),
      (b {id: "23b701e2-2954-11ef-b9f1-a7eff596877f"})
merge (a)-[r:NEXT]->(b);
match (a {id: "23b701e2-2954-11ef-b9f1-a7eff596877f"}),
      (b {smiles: "[Li+].[Cl-]"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "0a9c0f30-2955-11ef-951a-237ebc4f9869", amount: "165", unit: "g", target: "c1"});
merge (m: Material {smiles: "Cc1ccccc1C", name: "xylene"});
match (a {id: "23b701e2-2954-11ef-b9f1-a7eff596877f"}),
      (b {id: "0a9c0f30-2955-11ef-951a-237ebc4f9869"})
merge (a)-[r:NEXT]->(b);
match (a {id: "0a9c0f30-2955-11ef-951a-237ebc4f9869"}),
      (b {smiles: "Cc1ccccc1C"})
merge (a)-[r:USES]->(b);

merge (d: Device {id: "7f5d7688-2955-11ef-ac66-0b4f272a996b", device: "planetary ball mill", target: "c1", params: "{\"rpm\": 360, \"seconds\": 200000}"});
match (a {id: "0a9c0f30-2955-11ef-951a-237ebc4f9869"}),
      (b {id: "7f5d7688-2955-11ef-ac66-0b4f272a996b"})
merge (a)-[r:NEXT]->(b);

merge (c: `Glove Box Operation` {id: "62a6c0ca-2956-11ef-bc40-eb3a741d00fd", type: "heating", target: "c1", params: "{\"atmosphere\":\"argon\",\"temperature\": 500,\"unit\":\"C\",\"warmup seconds\":\"none\",\"warmup rate\":\"none\",\"duration seconds\": 14400}"});
match (a {id: "7f5d7688-2955-11ef-ac66-0b4f272a996b"}),
      (b {id: "62a6c0ca-2956-11ef-bc40-eb3a741d00fd"})
merge (a)-[r:NEXT]->(b);

merge (d: Device {id: "0ca30986-2965-11ef-a59d-df0aa44bd4c7", device: "XRD", target: "c1", params: "{\"type\":\"2theta\",\"peaks\":[15.5,18,26,30.5,32]}"});
match (a {id: "62a6c0ca-2956-11ef-bc40-eb3a741d00fd"}),
      (b {id: "0ca30986-2965-11ef-a59d-df0aa44bd4c7"})
merge (a)-[r:NEXT]->(b);

merge (d: Device {id: "6fbb4616-2d0f-11ef-a59b-f72530256bf7", device: "ICP", target: "c1", params: "{\"elements\":\"Li:S:P:Cl\",\"proportion\":\"5.40:4.45:1.00:1.70\",\"unit\":\"mol\"}"});
match (a {id: "0ca30986-2965-11ef-a59d-df0aa44bd4c7"}),
      (b {id: "6fbb4616-2d0f-11ef-a59b-f72530256bf7"})
merge (a)-[r:NEXT]->(b);

merge (e: Experiment {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335", first_step: "211cf444-2951-11ef-a224-1335ae9455e7", last_step: "6fbb4616-2d0f-11ef-a59b-f72530256bf7"});
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "211cf444-2951-11ef-a224-1335ae9455e7"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "313c0800-2952-11ef-9a17-ebba0962c8f6"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "d222b2be-2952-11ef-89a0-a7b867f72d78"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "9bf9273a-2953-11ef-b752-e7f8732086cd"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "23b701e2-2954-11ef-b9f1-a7eff596877f"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "0a9c0f30-2955-11ef-951a-237ebc4f9869"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "7f5d7688-2955-11ef-ac66-0b4f272a996b"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "62a6c0ca-2956-11ef-bc40-eb3a741d00fd"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "0ca30986-2965-11ef-a59d-df0aa44bd4c7"})
merge (a)-[r:INCLUDE_STEP]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {id: "6fbb4616-2d0f-11ef-a59b-f72530256bf7"})
merge (a)-[r:INCLUDE_STEP]->(b);

match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {smiles: "S1SSSSSSS1"})
merge (a)-[r:USE_PRECURSOR]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {smiles: "[P]"})
merge (a)-[r:USE_PRECURSOR]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {smiles: "[Li]"})
merge (a)-[r:USE_PRECURSOR]->(b);
match (a {id: "bcd90ddc-2965-11ef-adb5-8f2d09928335"}),
      (b {smiles: "[Li+].[Cl-]"})
merge (a)-[r:USE_PRECURSOR]->(b);

