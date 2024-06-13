create database experiments if not exists;
use experiments;

merge (c: `Container Preparation` {id: "211cf444-2951-11ef-a224-1335ae9455e7", type: "zirconia grinding jar", volume: 45, unit: "ml", target: "c1"});

merge (m: `Material Add` {id: "313c0800-2952-11ef-9a17-ebba0962c8f6", amount: "11.9", unit: "g", target: "c1"});
merge (m: Material {smiles: "S1SSSSSSS1"});
match (a: {id: "211cf444-2951-11ef-a224-1335ae9455e7"}),
      (b: {id: "313c0800-2952-11ef-9a17-ebba0962c8f6"})
merge (a)-[r:NEXT]->(b);
match (a: {id: "313c0800-2952-11ef-9a17-ebba0962c8f6"}),
      (b: {smiles: "S1SSSSSSS1"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "d222b2be-2952-11ef-89a0-a7b867f72d78", amount: "2.3", unit: "g", target: "c1"});
merge (m: Material {smiles: "[P]"});
match (a: {id: "313c0800-2952-11ef-9a17-ebba0962c8f6"}),
      (b: {id: "d222b2be-2952-11ef-89a0-a7b867f72d78"})
merge (a)-[r:NEXT]->(b);
match (a: {id: "d222b2be-2952-11ef-89a0-a7b867f72d78"}),
      (b: {smiles: "[P]"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "9bf9273a-2953-11ef-b752-e7f8732086cd", amount: "2.6", unit: "g", target: "c1"});
merge (m: Material {smiles: "[Li]"});
match (a: {id: "d222b2be-2952-11ef-89a0-a7b867f72d78"}),
      (b: {id: "9bf9273a-2953-11ef-b752-e7f8732086cd"})
merge (a)-[r:NEXT]->(b);
match (a: {id: "9bf9273a-2953-11ef-b752-e7f8732086cd"}),
      (b: {smiles: "[Li]"})
merge (a)-[r:USES]->(b);

merge (m: `Material Add` {id: "23b701e2-2954-11ef-b9f1-a7eff596877f", amount: "3.1", unit: "g", target: "c1"});
merge (m: Material {smiles: "[Li+].[Cl-]"});
match (a: {id: "9bf9273a-2953-11ef-b752-e7f8732086cd"}),
      (b: {id: "23b701e2-2954-11ef-b9f1-a7eff596877f"})
merge (a)-[r:NEXT]->(b);
match (a: {id: "23b701e2-2954-11ef-b9f1-a7eff596877f"}),
      (b: {smiles: "[Li+].[Cl-]"})
merge (a)-[r:USES]->(b);


