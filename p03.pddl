(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}{j} refers to the loc-ation at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}{j} and loc-{h}{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero loc-ation and carrying status
    (hero-at loc-2-1)
    (arm-free)
   

    ; locating <> Corridor Connections
    (corridors-exists c2122 loc-2-1 loc-2-2) (corridors-exists c2122 loc-2-2 loc-2-1)
    (corridors-exists c1222 loc-1-2 loc-2-2) (corridors-exists c1222 loc-2-2 loc-1-2)
    (corridors-exists c2232 loc-2-2 loc-3-2) (corridors-exists c2232 loc-3-2 loc-2-2)
    (corridors-exists c1213 loc-1-2 loc-1-3) (corridors-exists c1213 loc-1-3 loc-1-2)
    (corridors-exists c1223 loc-1-2 loc-2-3) (corridors-exists c1223 loc-2-3 loc-1-2)
    (corridors-exists c2223 loc-2-2 loc-2-3) (corridors-exists c2223 loc-2-3 loc-2-2)
    (corridors-exists c3223 loc-3-2 loc-2-3) (corridors-exists c3223 loc-2-3 loc-3-2)
    (corridors-exists c3233 loc-3-2 loc-3-3) (corridors-exists c3233 loc-3-3 loc-3-2)
    (corridors-exists c1323 loc-1-3 loc-2-3) (corridors-exists c1323 loc-2-3 loc-1-3)
    (corridors-exists c2333 loc-2-3 loc-3-3) (corridors-exists c2333 loc-3-3 loc-2-3)
    (corridors-exists c1314 loc-1-3 loc-1-4) (corridors-exists c1314 loc-1-4 loc-1-3)
    (corridors-exists c2314 loc-2-3 loc-1-4) (corridors-exists c2314 loc-1-4 loc-2-3)
    (corridors-exists c2324 loc-2-3 loc-2-4) (corridors-exists c2324 loc-2-4 loc-2-3)
    (corridors-exists c2334 loc-2-3 loc-3-4) (corridors-exists c2334 loc-3-4 loc-2-3)
    (corridors-exists c3334 loc-3-3 loc-3-4) (corridors-exists c3334 loc-3-4 loc-3-3)
    (corridors-exists c1424 loc-1-3 loc-2-4) (corridors-exists c1424 loc-2-4 loc-1-4)
    (corridors-exists c2434 loc-2-4 loc-3-4) (corridors-exists c2434 loc-3-4 loc-2-4)
    (corridors-exists c2425 loc-2-4 loc-2-5) (corridors-exists c2425 loc-2-5 loc-2-4)
    (corridors-exists c2535 loc-2-5 loc-3-5) (corridors-exists c2535 loc-3-5 loc-2-5)
    (corridors-exists c3545 loc-3-5 loc-4-5) (corridors-exists c3545 loc-4-5 loc-3-5)
    (corridors-exists c4544 loc-4-5 loc-4-4) (corridors-exists c4544 loc-4-4 loc-4-5)
    (corridors-exists c4443 loc-4-4 loc-4-3) (corridors-exists c4443 loc-4-3 loc-4-4)

    ; Key loc-ations
    (key-at key1 loc-2-1)
    (key-at key2 loc-2-3)
    (key-at key3 loc-2-3)
    (key-at key4 loc-2-3)
    (key-at key5 loc-2-3)
    (key-at key6 loc-4-4)
    
    ;locked corridors
    (locked-corridor c1223)
    (locked-corridor c2223)
    (locked-corridor c3223)
    (locked-corridor c1323)
    (locked-corridor c2333)
    (locked-corridor c2314)
    (locked-corridor c2324)
    (locked-corridor c2334)
    (locked-corridor c2425)
    (locked-corridor c2535)
    (locked-corridor c3545)
    (locked-corridor c4443)
    (locked-corridor c4544)

    ; locked-corridor corridors colours
    (locked-corridor-colour c1223 red)
    (locked-corridor-colour c2223 red)
    (locked-corridor-colour c3223 red)
    (locked-corridor-colour c1323 red)
    (locked-corridor-colour c2333 red)
    (locked-corridor-colour c2314 red)
    (locked-corridor-colour c2324 red)
    (locked-corridor-colour c2334 red)
    (locked-corridor-colour c2425 purple)
    (locked-corridor-colour c2535 green)
    (locked-corridor-colour c3545 purple)
    (locked-corridor-colour c4443 rainbow)
    (locked-corridor-colour c4544 green)
    
    ; risky-corridor corridors
    (risky-corridor c1223)
    (risky-corridor c2223)
    (risky-corridor c3223)
    (risky-corridor c1323)
    (risky-corridor c2333)
    (risky-corridor c2314)
    (risky-corridor c2324)
    (risky-corridor c2334)
    
  
    ; Key colours
    (key-colour key1 red)
    (key-colour key2 green)
    (key-colour key3 green)
    (key-colour key4 purple)
    (key-colour key5 purple)
    (key-colour key6 rainbow)
    
    ; connected-corridor that can unlock a corridor
    (connected-corridor loc-1-2 c1223)
    (connected-corridor loc-2-2 c2223)
    (connected-corridor loc-2-3 c1223)
    (connected-corridor loc-2-3 c2223)
    (connected-corridor loc-2-3 c3223)
    (connected-corridor loc-2-3 c1323)
    (connected-corridor loc-2-3 c2333)
    (connected-corridor loc-2-3 c1323)
    (connected-corridor loc-2-3 c2324)
    (connected-corridor loc-2-3 c2334)
    (connected-corridor loc-1-3 c1223)
    (connected-corridor loc-1-4 c2314)
    (connected-corridor loc-2-4 c2324)
    (connected-corridor loc-3-4 c2334)
    (connected-corridor loc-3-3 c2333)
    (connected-corridor loc-3-2 c2334)
    (connected-corridor loc-2-4 c2425)
    (connected-corridor loc-2-5 c2425)
    (connected-corridor loc-3-5 c3545)
    (connected-corridor loc-2-5 c2535)
    (connected-corridor loc-3-5 c2535)
    (connected-corridor loc-4-5 c4544)
    (connected-corridor loc-4-5 c3545)
    (connected-corridor loc-4-4 c4544)
    (connected-corridor loc-4-4 c4443)

    ; Key usage properties (one use, two use, etc)
    ; (not (unusable key1))
    (one-use key2)
    (one-use key3)
    (one-use key4)
    (one-use key5)
    (one-use key6)

  )
  (:goal
    (and
      ; Hero's final loc-ation goes here
      (hero-at loc-4-3)
    )
  )

)