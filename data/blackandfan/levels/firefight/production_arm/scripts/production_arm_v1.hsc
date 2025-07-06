;This is the main script that handles the horde mode gameplay elements.

;NOTE:  Do not make my mistake by relying heavilly on continuous scripts, ESPECIALLY for things that only need to happen once after a condition is met. 
;
;       Instead, use a sleep_until function inside either a void script that gets called from "start" or another separate startup script. 
;       If you need something to keep happening until that condition is met, you can add a (begin) function as a second parameter in sleep_until, and
;       everything you put within that will be ran every time the condition returns false. (if I remember right. Double check with someone else on how to do that if I got it wrong)
;
;       This way, once the conditions get met, the script finishes and is no-longer threaded or whatever. Too many scripts threaded at once and things break.


;========================================|
;============Global Variables============|
;========================================|

(global boolean debugmode TRUE)
(global boolean count_restart FALSE)
(global long sq_default_total 0)
(global short sq_default_left 0)
(global short enemies_spawned 0)
(global long enemies_remaining 0)
(global long all_this_round 0)
(global boolean Enable_Main_Wave TRUE)
(global boolean Main_Round FALSE)
(global boolean Endless_Wave FALSE)
(global boolean Spawn_cov_grunt_heavy FALSE)
(global boolean spawn_cov_elites FALSE)
(global boolean Spawn_cov_jackal FALSE)
(global boolean Spawn_cov_brutes FALSE)
(global boolean Spawn_cov_elite_honor FALSE)
(global boolean Spawn_cov_elite_specs FALSE)
(global boolean Spawn_cov_bugger FALSE)
(global boolean Spawn_cov_hunter FALSE)
(global boolean Spawn_cov_elite_ranger FALSE)
(global boolean Spawn_cov_elite_zealot FALSE)
(global boolean Spawn_cov_jackal_sniper FALSE)
(global boolean Spawn_cov_brute_stalker FALSE)
(global boolean Spawn_cov_brute_chieftain FALSE)
(global boolean Spawn_cov_grunt_needler FALSE)
(global boolean Spawn_cov_grunt_specops FALSE)
(global boolean Spawn_fld_elite_unarmed FALSE)
(global boolean Spawn_fld_brute_unarmed FALSE)
(global boolean Spawn_fld_elite FALSE)
(global boolean Spawn_fld_elite_zealot FALSE)
(global boolean Spawn_fld_elite_honor FALSE)
(global boolean Spawn_fld_brute FALSE)
(global boolean Spawn_fld_brute_honor FALSE)
(global boolean Spawn_fld_heretic FALSE)
(global boolean Spawn_fld_heretic_shielded FALSE)
(global boolean Spawn_fld_carrier FALSE)
(global boolean Spawn_fld_infection FALSE)
(global boolean Spawn_for_agressior FALSE)
(global boolean Spawn_for_agressior_major FALSE)
(global boolean Spawn_for_agressior_cap FALSE)



;====Starting Fade In====|
(script startup start
    (game_safe_to_respawn TRUE)
    (if (game_is_cooperative)
            (begin
                (print "game is coop")
                (ai_place "2player_ally")
            )
            (begin
                (print "game is singleplayer")
                (ai_place "1player_ally")
            )
    )
    (sound_looping_start levels\solo\070_waste\music\070_music_085 NONE 1)
)

(script continuous debug
    (if 
        (and 
            (= debugmode TRUE)
            (< (ai_nonswarm_count "debugsquad") 1)
        )
        (begin
            (ai_place "debugsquad")
            (print "Respawning debugsquad.")
            (sleep 250)
        )
    )
)
;====================================================|
;============Wave Counting/Active Scripts============|
;====================================================|


(script continuous Waves_Enabling
    (if (> enemies_spawned 1)
        (begin
            (set Spawn_cov_brutes TRUE)
        )
    )

    (if (> enemies_spawned 2)
        (begin
            (set Spawn_cov_grunt_needler TRUE)
        )
    )

    (if (> enemies_spawned 3)
        (begin
            (set Spawn_cov_jackal TRUE)
        )
    )

    (if (> enemies_spawned 4)
        (begin
            (set spawn_cov_elites TRUE)
        )
    )

    (if (> enemies_spawned 5)
        (begin
            (set Spawn_cov_bugger TRUE)
        )
    )

    (if (> enemies_spawned 6)
        (begin
            (set Spawn_cov_brute_stalker TRUE)
        )
    )

    (if (> enemies_spawned 7)
        (begin
            (set Spawn_cov_elite_ranger TRUE)
        )
    )

    (if (> enemies_spawned 8)
        (begin
            (set Spawn_cov_elite_specs TRUE)
        )
    )

    (if (> enemies_spawned 9)
        (begin
            (set Spawn_cov_grunt_heavy TRUE)
        )
    )

    (if (> enemies_spawned 10)
        (begin
            (set Spawn_cov_jackal_sniper TRUE)
        )
    )

    (if (> enemies_spawned 11)
        (begin
            (set Spawn_cov_grunt_specops TRUE)
        )
    )

    (if (> enemies_spawned 12)
        (begin
            (set Spawn_cov_brute_chieftain TRUE)
        )
    )

    (if (> enemies_spawned 13)
        (begin
            (set Spawn_cov_elite_zealot TRUE)
            (sleep_forever)
        )
    )
)



(script continuous horderespawn_startwaves
    (if 
        (and 
            (= Enable_Main_Wave TRUE)
            (= enemies_remaining 0)
        )
        (begin
            (ai_place "cov_grunt")
            (set all_this_round 0)
            (set enemies_spawned (+ enemies_spawned 1))
            (sleep 1)
            (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_grunt")))
            (print "spawn cov_grunt")
            (set count_restart TRUE)
            (set sq_default_left sq_default_total)
            (sleep 30)

            (if (= spawn_cov_elites TRUE)
                (begin
                    (ai_place "cov_elites")
                    (print "spawn cov_elites")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_elites")))
                )
            )
            (sleep 1)

            (if (= Spawn_cov_grunt_heavy TRUE)
                (begin
                    (ai_place "cov_grunt_heavy")
                    (print "spawn cov_grunt_heavy")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_grunt_heavy")))
                )
            )
            (sleep 1)
            (if (= Spawn_cov_jackal TRUE)
                (begin
                    (ai_place "cov_jackal")
                    (print "spawn cov_jackal")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_jackal")))
                )
            )
            (sleep 1)

            (if (= Spawn_cov_brutes TRUE)
                (begin
                    (ai_place "cov_brutes")
                    (print "spawn cov_brutes")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_brutes")))
                )
            )
            (sleep 1)
            
            (if (= Spawn_cov_hunter TRUE)
                (begin
                    (ai_place "cov_hunter")
                    (print "spawn cov_hunter")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_hunter")))
                )
            )
            (sleep 1)

            (if (= Spawn_cov_bugger TRUE)
                (begin
                    (ai_place "cov_bugger")
                    (print "spawn cov_bugger")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_bugger")))
                )
            )
            (sleep 1)

            (if (= Spawn_cov_elite_specs TRUE)
                (begin
                    (ai_place "cov_elite_specs")
                    (print "spawn cov_elite_specs")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_elite_specs")))
                )
            )
            (sleep 1)
            
            (if (= Spawn_cov_elite_honor TRUE)
                (begin
                    (ai_place "cov_elite_honor")
                    (print "spawn cov_elite_honor")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_elite_honor")))
                )
            )
            (sleep 1)

            (if (= Spawn_cov_jackal_sniper TRUE)
                (begin
                    (ai_place "cov_jackal_sniper")
                    (print "spawn cov_jackal_sniper")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_jackal_sniper")))
                )
            )
            (sleep 1)
            
            (if (= Spawn_cov_brute_stalker TRUE)
                (begin
                    (ai_place "cov_brute_stalker")
                    (print "spawn cov_brute_stalker")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_brute_stalker")))
                )
            )
            (sleep 1)
            
            (if (= Spawn_cov_brute_chieftain TRUE)
                (begin
                    (ai_place "cov_brute_chieftain")
                    (print "spawn cov_brute_chieftain")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_brute_chieftain")))
                )
            )
            (sleep 1)
            
            (if (= Spawn_cov_grunt_needler TRUE)
                (begin
                    (ai_place "cov_grunt_needler")
                    (print "spawn cov_grunt_needler")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_grunt_needler")))
                )
            )
            (sleep 1)
            
            (if (= Spawn_cov_grunt_specops TRUE)
                (begin
                    (ai_place "cov_grunt_specops")
                    (print "spawn cov_grunt_specops")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_grunt_specops")))
                )
            )
            (sleep 1)
            
            (if (= Spawn_cov_elite_ranger TRUE)
                (begin
                    (ai_place "cov_elite_ranger")
                    (print "spawn cov_elite_ranger")
                    (sleep 1)
                    (set all_this_round (+ all_this_round (ai_nonswarm_count "cov_elite_ranger")))
                )
            )
            (sleep 30)
            (set enemies_remaining all_this_round)
            (set count_restart FALSE)
            
            (if (= Spawn_cov_elite_zealot TRUE)
                (begin
                    (ai_place "cov_elite_zealot")
                    (print "spawn cov_elite_zealot")
                    (sleep 30)
                    (set Endless_Wave TRUE)
                    (set Enable_Main_Wave FALSE)
                    (print "Main waves are over. This is where the fun begins :)")
                    (sleep_forever horderespawn_startwaves)
                )
            )
        )
    )
)

;====================================================|
;===================Counting enemies=================|
;====================================================|
(script continuous kill_counting_default
    (sleep_until (not count_restart))
    (if
        (< (ai_nonswarm_count "allsquads") sq_default_left)
        (begin
            (set enemies_remaining (- enemies_remaining (- sq_default_left (ai_nonswarm_count "allsquads"))))
            (set sq_default_left (ai_nonswarm_count "allsquads"))
            (sleep 1)
        )
    )
)

(script continuous kc_patch
    (cond
        (
            (> (ai_nonswarm_count "allsquads") sq_default_left )
            (begin
                (set sq_default_left (ai_nonswarm_count "allsquads"))
            )
        )
    )
)