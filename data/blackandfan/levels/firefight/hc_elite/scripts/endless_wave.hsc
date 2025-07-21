;========================================|
;============Global Variables============|
;========================================|



(script continuous covenant
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "covenant") 2)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (ai_place "covenant")
            (print "Respawning covenant.")
            (sleep 250)
            (add_recycling_volume playable 3 30)
        )
    )
)
(script continuous flood
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "flood") 2)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (ai_place "flood")
            (print "Respawning flood.")
            (sleep 400)
            (add_recycling_volume playable 3 30)
        )
    )
)
(script continuous elites
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "elites") 1)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (ai_place "elites")
            (print "Respawning elites.")
            (sleep 250)
            (add_recycling_volume playable 3 30)
        )
    )
)
(script continuous humans
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "humans") 1)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (ai_place "humans")
            (print "Respawning humans.")
            (sleep 550)
            (add_recycling_volume playable 3 30)
        )
    )
)
(script continuous covenant_special
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "covenant_special") 1)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (sleep 1850)
            (ai_place "covenant_special")
            (print "Respawning covenant_special.")
        )
    )
)
(script continuous flood_special
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "flood_special") 1)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (sleep 1850)
            (ai_place "flood_special")
            (print "Respawning flood_special.")
        )
    )
)
(script continuous elites_council
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "elites_council") 1)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (sleep 1850)
            (ai_place "elites_council")
            (print "Respawning elites_council.")
        )
    )
)