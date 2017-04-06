"/*----------------------------------------------------------*/
"くるくるレジストリ
"
"使い方はインサートモード中　CTRL+R a
"/*----------------------------------------------------------*/
fun! Aasfdasf()
let var_list_1 = [ "reg_list" ]
call add(var_list_1, { 'word' : substitute(@0,'.$','','g'), 'abbr' : printf('%3d: %s', 0, substitute(@0,'.$','','g')), 'menu' : '0' })
call add(var_list_1, { 'word' : substitute(@1,'.$','','g'), 'abbr' : printf('%3d: %s', 1, substitute(@1,'.$','','g')), 'menu' : '1' })
call add(var_list_1, { 'word' : substitute(@2,'.$','','g'), 'abbr' : printf('%3d: %s', 2, substitute(@2,'.$','','g')), 'menu' : '2' })
call add(var_list_1, { 'word' : substitute(@3,'.$','','g'), 'abbr' : printf('%3d: %s', 3, substitute(@3,'.$','','g')), 'menu' : '3' })
call add(var_list_1, { 'word' : substitute(@4,'.$','','g'), 'abbr' : printf('%3d: %s', 4, substitute(@4,'.$','','g')), 'menu' : '4' })
call add(var_list_1, { 'word' : substitute(@5,'.$','','g'), 'abbr' : printf('%3d: %s', 5, substitute(@5,'.$','','g')), 'menu' : '5' })
call add(var_list_1, { 'word' : substitute(@6,'.$','','g'), 'abbr' : printf('%3d: %s', 6, substitute(@6,'.$','','g')), 'menu' : '6' })
call add(var_list_1, { 'word' : substitute(@7,'.$','','g'), 'abbr' : printf('%3d: %s', 7, substitute(@7,'.$','','g')), 'menu' : '7' })
call add(var_list_1, { 'word' : substitute(@8,'.$','','g'), 'abbr' : printf('%3d: %s', 8, substitute(@8,'.$','','g')), 'menu' : '8' })
call add(var_list_1, { 'word' : substitute(@9,'.$','','g'), 'abbr' : printf('%3d: %s', 9, substitute(@9,'.$','','g')), 'menu' : '9' })
call add(var_list_1, { 'word' : @*, 'abbr' : printf('%3s: %s', '*', @*), 'menu' : '*' })
call add(var_list_1, { 'word' : @:, 'abbr' : printf('%3s: %s', ':', @:), 'menu' : ':' })
call add(var_list_1, { 'word' : @%, 'abbr' : printf('%3s: %s', '%', @%), 'menu' : '%' })
call add(var_list_1, { 'word' : @#, 'abbr' : printf('%3s: %s', '#', @#), 'menu' : '#' })
call add(var_list_1, { 'word' : @/, 'abbr' : printf('%3s: %s', '/', @/), 'menu' : '/' })
call add(var_list_1, { 'word' : @=, 'abbr' : printf('%3s: %s', '=', @=), 'menu' : '=' })
call complete(col('.'),
\var_list_1)
return ''
endf
ino <silent> <c-r>a <c-r>=Aasfdasf()<cr>