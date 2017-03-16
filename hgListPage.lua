                        local hh = "<br>"
                        local kg = "&nbsp;&nbsp;"
                        local dict = ngx.shared.guard_dict
                        local dict_white = ngx.shared.dict_white
                        local dict_challenge = ngx.shared.dict_challenge
                        local blackKey = dict:get_keys()
                        local whiteKey = dict_white:get_keys()
                        local challengeKey = dict_challenge:get_keys()
                        --ngx.say("Keys &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; values  flags  stale",hh)

                --打印黑名单
                        ngx.say("黑名单: <br> <hr>")
                        ngx.say("Keys &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; values  flags  stale",hh)
                        for _,v in pairs(blackKey) do
                                local val, fla, sta = dict:get_stale(v)
                                ngx.print(v,kg, val,kg ,fla,kg, sta,hh)
                        end

                        ngx.say("<br><br>")

                --打印白名单
                        ngx.say("白名单: <br> <hr>")
                        ngx.say("Keys &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; values  flags  stale",hh)
                        for _,v in pairs(whiteKey) do
                                local val, fla, sta = dict_white:get_stale(v)
                                ngx.print(v,kg, val,kg ,fla,kg, sta,hh)
                        end

                        ngx.say("<br><br>")

                --打印攻击名单
                        ngx.say("ChallengeList: <br> <hr>")
                        ngx.say("Keys &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; values  flags  stale",hh)
                        for _,v in pairs(challengeKey) do
                                local val, fla, sta = dict_challenge:get_stale(v)
                                ngx.print(v,kg, val,kg ,fla,kg, sta,hh)
                        end
