if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'quickrun'
endif

"$BBgJ8;z$H>.J8;z$r6hJL$9$k(B
syntax case match

"$B@55,I=8=$G0lCW(B
syntax match phpUnitOk /OK.*/
syntax match phpUnitFailures /FAILURES.*/

"group-name$B$r%O%$%i%$%H$N;XDj$H4XO"IU$1(B
highlight phpUnitOk term=reverse ctermbg=2 guibg=DarkGreen
highlight phpUnitFailures term=reverse ctermbg=4 guibg=DarkRed

"unlet b:current_syntax
let b:current_syntax = 'quickrun'

if main_syntax == 'quickrun'
  unlet main_syntax
endif
