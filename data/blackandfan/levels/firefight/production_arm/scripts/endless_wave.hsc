;========================================|
;============Global Variables============|
;========================================|



(script continuous covenant
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "covenant") 2)
            (< (ai_nonswarm_count "allsquads") 8)
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
            (< (ai_nonswarm_count "allsquads") 8)
        )
        (begin
            (ai_place "flood")
            (print "Respawning flood.")
            (sleep 400)
            (add_recycling_volume playable 3 30)
        )
    )
)
(script continuous forerunner
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "forerunner") 1)
            (< (ai_nonswarm_count "allsquads") 8)
        )
        (begin
            (ai_place "forerunner")
            (print "Respawning forerunner.")
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
            (< (ai_nonswarm_count "allsquads") 8)
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
            (< (ai_nonswarm_count "allsquads") 8)
        )
        (begin
            (sleep 1850)
            (ai_place "flood_special")
            (print "Respawning flood_special.")
        )
    )
)