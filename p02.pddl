(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (arm-free)

    ; Locating <> Corridor Connections
    (corridors-exists c1222 loc-1-2 loc-2-2) (corridors-exists c1222 loc-2-2 loc-1-2)
    (corridors-exists c2122 loc-2-1 loc-2-2) (corridors-exists c2122 loc-2-2 loc-2-1)
    (corridors-exists c2223 loc-2-2 loc-2-3) (corridors-exists c2223 loc-2-3 loc-2-2)
    (corridors-exists c2232 loc-2-2 loc-3-2) (corridors-exists c2232 loc-3-2 loc-2-2)
    (corridors-exists c3242 loc-3-2 loc-4-2) (corridors-exists c3242 loc-4-2 loc-3-2)
    
    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-1-2)
    (key-at key3 loc-2-2)
    (key-at key4 loc-2-3)

    ; Locked corridors colors
    (locked-corridor-colour c1222 yellow)
    (locked-corridor-colour c2232 yellow)
    (locked-corridor-colour c2122 purple)
    (locked-corridor-colour c2223 green)
    (locked-corridor-colour c3242 rainbow)
    
    ; Locked corridors 
    (locked-corridor c1222)
    (locked-corridor c2232)
    (locked-corridor c2122)
    (locked-corridor c2223)
    (locked-corridor c3242 )

    ; Risky corridors

    ; Key colours
    (key-colour key3 purple)
    (key-colour key4 yellow)
    (key-colour key1 green)
    (key-colour key2 rainbow)
    
    (connected-corridor loc-1-2 c1222)
    (connected-corridor loc-2-2 c2122)
    (connected-corridor loc-2-2 c2232)
    (connected-corridor loc-2-2 c1222)
    (connected-corridor loc-2-2 c2223)
    (connected-corridor loc-3-2 c2232)
    (connected-corridor loc-2-1 c2122)
    (connected-corridor loc-2-3 c2223)
    (connected-corridor loc-3-2 c3242)
    


    ; Key usage properties (one use, two use, etc)
    (one-use key1)
    (one-use key2)
    (one-use key3)
    (two-use key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-2)
    )
  )

)
