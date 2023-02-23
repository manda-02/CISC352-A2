(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
     (hero-at loc-1-2)
     (arm-free)
     (not (holding-key key1))
     (not (holding-key key2))
     (not (holding-key key3))
     (not (holding-key key4))

    ; Locationg <> Corridor Connections
    (corridors-connected c1222 loc-1-2 loc-2-2) (corridors-connected c1222 loc-2-2 loc-1-2)
    (corridors-connected c3132 loc-3-1 loc-3-2) (corridors-connected c3132 loc-3-2 loc-3-1)
    (corridors-connected c2232 loc-2-2 loc-3-2) (corridors-connected c2232 loc-3-2 loc-2-2)
    (corridors-connected c2223 loc-2-2 loc-2-3) (corridors-connected c2223 loc-2-3 loc-2-2)
    (corridors-connected c3242 loc-3-2 loc-4-2) (corridors-connected c3242 loc-4-2 loc-3-2)
    (corridors-connected c3233 loc-3-2 loc-3-3) (corridors-connected c3233 loc-3-3 loc-3-2)
    (corridors-connected c2333 loc-2-3 loc-3-3) (corridors-connected c2333 loc-3-3 loc-2-3)
    (corridors-connected c2324 loc-2-3 loc-2-4) (corridors-connected c2324 loc-2-4 loc-2-3)
    (corridors-connected c3334 loc-3-3 loc-3-4) (corridors-connected c3334 loc-3-4 loc-3-3)
    (corridors-connected c2434 loc-2-4 loc-3-4) (corridors-connected c2434 loc-3-4 loc-2-4)
    (corridors-connected c3444 loc-3-4 loc-4-4) (corridors-connected c3444 loc-4-4 loc-3-4)

    ; Key locations
    (key-at key1 loc-2-2)
    (key-at key2 loc-2-4)
    (key-at key3 loc-4-2)
    (key-at key4 loc-4-4)

    ; Locked corridors
    (locked-corridor c2324 red)
    (locked-corridor c2434 red)
    (locked-corridor c3242 purple)
    (locked-corridor c3444 yellow)
    (locked-corridor c3132 rainbow)

    ; Risky corridors
    (risky-corridor c2324)
    (risky-corridor c2434)

    ; Key colours
    (key-colour key1 red)
    (key-colour key2 yellow)
    (key-colour key3 rainbow)
    (key-colour key4 purple)

    ; Key usage properties (one use, two use, etc)
    (multi-use key1)
    (two-use key2)
    (one-use key3)
    (one-use key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)
