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
(script continuous human
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "human") 2)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (ai_place "human")
            (print "Respawning human.")
            (sleep 400)
            (add_recycling_volume playable 3 30)
        )
    )
)
(script continuous flood
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "fld_support") 1)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (ai_place "fld_support")
            (ai_place "fld_infector")
            (print "Respawning fld_support.")
            (sleep 250)
            (add_recycling_volume playable 3 30)
        )
    )
)
(script continuous aawraith
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "fld_wraith_support") 1)
            (< (ai_nonswarm_count "allsquads") 15)
        )
        (begin
            (ai_place "fld_wraith_support")
            (print "Respawning fld_wraith_support.")
        )
    )
)
(script continuous forerunner
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "forerunner") 1)
            (< (ai_nonswarm_count "allsquads") 10)
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
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (sleep 1850)
            (ai_place "covenant_special")
            (print "Respawning covenant_special.")
        )
    )
)
(script continuous human_special
    (sleep_until Endless_Wave)
    (if 
        (and 
            (< (ai_nonswarm_count "human_special") 1)
            (< (ai_nonswarm_count "allsquads") 10)
        )
        (begin
            (sleep 1850)
            (ai_place "human_special")
            (print "Respawning human_special.")
        )
    )
)