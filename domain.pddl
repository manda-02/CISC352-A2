(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero-at ?loc - location)

        ; corridor exists
        (corridors-exists ?cor - corridor ?from ?to - location)

        ; corridor is risky
        (risky-corridor ?cor - corridor)

        ; locked corridors with locked colors
        (locked-corridor-colour ?cor - corridor ?col - colour)
        
        ; locked corridors with locked colors - remove colour
        (locked-corridor ?cor - corridor)

        ; corridor is unlocked
        ;(unlocked-corridor ?cor - corridor)

        ; room is messy   ---> (double check)
        (messy-room ?loc - location)

        ; corridor can collapse
        ;(collapsed-corridor ?cor - corridor)

        ; key at the current location
        (key-at ?k - key ?loc - location)

        ; hero is holding a key
        (holding-key ?k - key)

        ; hero is not holding anything
        (arm-free)
        
        ; Corridor is connected
        (connected-corridor ?loc - location ?cor - corridor)

        ; color of the key
        (key-colour ?k - key ?col - colour)

        ; key uses
        (one-use ?k - key)
        (two-use ?k - key)
        (multi-use ?k - key)
        (unusable ?k - key)
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor )

        :precondition (and
        (hero-at ?from)
        (not(hero-at ?to))
        (corridors-exists ?cor ?from ?to)
        (not(locked-corridor ?cor))
        )

        :effect (and
        (hero-at ?to)
        (not (hero-at ?from))
        (when 
            (risky-corridor ?cor)
            (and (messy-room ?to) (not(corridors-exists ?cor ?from ?to)) (not(corridors-exists ?cor ?to ?from)))
            )
        )
    )
    

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and
        (hero-at ?loc)
        (key-at ?k ?loc)
        (arm-free)
        (not (holding-key ?k))
        (not (messy-room ?loc))

        )

        :effect (and
        (holding-key ?k)
        (not(arm-free))
        (not(key-at ?k ?loc))
        
        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and
        (holding-key ?k)
        (not(arm-free))
        (hero-at ?loc)
        )

        :effect (and
        (not (holding-key ?k))
        (arm-free)
        (key-at ?k ?loc)
        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and
        (holding-key ?k)
        (not (unusable ?k))
        (locked-corridor ?cor)
        (key-colour ?k ?col)
        (locked-corridor-colour ?cor ?col)
        (hero-at ?loc)
        ; double check this
        (connected-corridor ?loc ?cor)
        )

        :effect (and
        (not(locked-corridor ?cor))
        (when
            (and (two-use ?k))
            (and (one-use ?k)))
            
        (when
            (and (one-use ?k))
            (and (unusable ?k)))

        ; (when
        ;     (and (multi-use ?k))
        ;     (and (multi-use ?k)))
        
        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and
        (hero-at ?loc)
        (messy-room ?loc)

        )

        :effect (and
        (not(messy-room ?loc))

        )
    )

)
