(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-2-1 loc-2-2 loc-2-3 loc-2-4 loc-2-5 loc-3-2 loc-4-2 loc-3-3 - location
    c1121 c2122 c2223 c2324 c2425 c2232 c3242 c3233 c2333 - corridor
    key1 key2 key3 key4 key5 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-5)
    (arm-free)

    ; Locating <> Corridor Connections
    (corridors-exists c1121 loc-1-1 loc-2-1) (corridors-exists c1121 loc-2-1 loc-1-1)
    (corridors-exists c2122 loc-2-1 loc-2-2) (corridors-exists c2122 loc-2-2 loc-2-1)
    ;(corridors-exists c2223 loc-2-2 loc-2-3) (corridors-exists c2223 loc-2-3 loc-2-2)
    (corridors-exists c2324 loc-2-3 loc-2-4) (corridors-exists c2324 loc-2-4 loc-2-3)
    (corridors-exists c2425 loc-2-4 loc-2-5) (corridors-exists c2425 loc-2-5 loc-2-4)
    (corridors-exists c2232 loc-2-2 loc-3-2) (corridors-exists c2232 loc-3-2 loc-2-2)
    (corridors-exists c3242 loc-3-2 loc-4-2) (corridors-exists c3242 loc-4-2 loc-3-2)
    (corridors-exists c3233 loc-3-2 loc-3-3) (corridors-exists c3233 loc-3-3 loc-3-2)
    (corridors-exists c2333 loc-2-3 loc-3-3) (corridors-exists c2333 loc-3-3 loc-2-3)

    ; Locked corridors
    (locked-corridor c2425)
    (locked-corridor c2324)
    ;(locked-corridor c2333)
    ;(locked-corridor c3242)
    (locked-corridor c2232)
    (locked-corridor c2122)
    (locked-corridor c1121)
    
    
    ; color of locks for the corridors
    (locked-corridor-colour c2425 yellow)
    (locked-corridor-colour c2324 red)
    ;(locked-corridor-colour c2333 red)
    ;(locked-corridor-colour c3242 red)
    (locked-corridor-colour c2232 purple)
    (locked-corridor-colour c2122 green)
    (locked-corridor-colour c1121 rainbow)
    
    ; room that can unlock corridor
    (connected-corridor loc-2-5 c2425)
    
    (connected-corridor loc-2-4 c2425)
    (connected-corridor loc-2-4 c2324)
    (connected-corridor loc-2-3 c2324)
    ;(connected-corridor loc-2-3 c2333)
    ;(connected-corridor loc-3-3 c2333)
    ;(connected-corridor loc-3-3 c2333)
    ;(connected-corridor loc-3-2 c3242)
    (connected-corridor loc-3-2 c2232)
    (connected-corridor loc-2-2 c2232)
    (connected-corridor loc-2-2 c2122)
    (connected-corridor loc-2-1 c2122)
    (connected-corridor loc-2-1 c1121)
    (connected-corridor loc-1-1 c1121)
    
 

    ; Risky corridors
    ;(risky-corridor c3242)
    (risky-corridor c2324)
    ;(risky-corridor c2333)
    
    ; Key locations
    (key-at key1 loc-2-5)
    (key-at key2 loc-2-4)
    (key-at key3 loc-4-2)
    (key-at key4 loc-2-2)
    (key-at key5 loc-2-1)

    ; Key colours
    (key-colour key1 yellow)
    (key-colour key2 red)
    (key-colour key3 purple)
    (key-colour key4 green)
    (key-colour key5 rainbow)

    ; Key usage properties (one use, two use, etc)
    (two-use key1)
    (one-use key3)
    (one-use key4)
    (one-use key5)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-1-1)
    )
  )

)

