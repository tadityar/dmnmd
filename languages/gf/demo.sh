#/usr/bin/bash

winter='Row 1 (Single (TimeSeason "Season" (FNullary (VS "Winter")))) (Single (Attribute "Dish" (FNullary (VS "Kidney bean stew")))) NoComment'
spring='Row 2 (Single (TimeSeason "Season" (FNullary (VS "Spring")))) (Single (Attribute "Dish" (FNullary (VS "Smoked tofu salad")))) NoComment'
summer='Row 3 (Single (TimeSeason "Season" (FNullary (VS "Summer")))) (Single (Attribute "Dish" (FNullary (VS  "Roasted potatoes and a nice steak")))) NoComment'
autumn='Row 4 (Many (BaseFCell (TimeSeason "Season" (FNullary (VS "Autumn"))) (AmountCount "Guest" "count" (FInRangeInt 5 8)))) (Single (Attribute "Dish" (FNullary (VS "Instant noodles")))) NoComment'
other='Row 5 (Many (BaseFCell (TimeSeason "Season" FAnything) (AmountCount "Guest" "count" FAnything))) (Single (Attribute "Dish" (FNullary (VS "Pea soup")))) (CommentString "I give up")'


table="l -bind -treebank Table (ConsDTRow ($winter) (ConsDTRow ($spring) (ConsDTRow ($summer) (BaseDTRow ($autumn) ($other)))))"

echo $table | gf --run DMNEng*.gf | sed -E 's/ \\ /\\/g ; s/: /\\---\\/g ; s/DMN/\\DMN/g' | tr '\' '\n'


expiration='Row 1 (Single (Event "Event" (Disj (ConsFEELexp (FNullary (VS "Equity Financing")) (BaseFEELexp (FNullary (VS "Liquidity")) (FNullary (VS "Dissolution"))))))) (Single (Attribute "Contract" (FNullary (VS "Expired")))) NoComment'

obligations='Row 2 (Single (Event "Event" (FNullary (VS "Expiration")))) (Single (Attribute "Companys obligations" (FNullary (VS "A, B and C")))) NoComment'

consequence="l -bind -treebank Consequence (BaseDTRow ($obligations) ($expiration))"

echo $consequence | gf --run DMNEng*.gf | sed -E 's/ \\ /\\/g ; s/: /\\---\\/g ; s/DMN/\\DMN/g' | tr '\' '\n'
