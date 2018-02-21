-- NOT SUPPORTED

DROP MATERIALIZED VIEW IF EXISTS patientCodeStatus
CREATE MATERIALIZED VIEW patientCodeStatus AS

SELECT "patientunitstayid", "cplitemoffset", string_agg("cplitemvalue", ', ') AS "cplitemvalue"
FROM (SELECT *
FROM (SELECT "patientunitstayid" AS "patientunitstayid", "cplitemoffset" AS "cplitemoffset", "cplgroup" AS "cplgroup", "cplitemvalue" AS "cplitemvalue"
FROM (SELECT *
FROM "careplangeneral"
WHERE ("cplitemvalue" IN ('Full therapy', 'Do not resuscitate', 'No CPR', 'No intubation', 'Comfort measures only', 'No cardioversion', 'No vasopressors/inotropes', 'No augmentation of care', 'End of life', 'No blood products', 'No blood draws', 'Advance directives'))) "ivtmaaxwzk") "oytldaespk"
ORDER BY "patientunitstayid", "cplitemoffset", "cplitemvalue") "vrxthajevr"
GROUP BY "patientunitstayid", "cplitemoffset"