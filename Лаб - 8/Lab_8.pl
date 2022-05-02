% подбор автомобиля

rule(1, "машина", "внедорожник", [1]).
rule(2, "машина", "внедорожник", [2]).
rule(3, "машина", "легковая", [3]).
rule(4, "машина", "легковая", [4]).
rule(5, "внедорожник", "джип", [5, 6]).
rule(6, "внедорожник", "кроссовер", [7]).
rule(7, "джип", "джип с мостом", [8, 9]).
rule(8, "кроссовер", "кроссовер с 4wd", [10, 11]).
rule(9, "джип с мостом", "производитель Япония", [12]).
rule(10, "кроссовер с 4wd", "большой багажник", [13]).
rule(11, "производитель Япония", "Toyota Hi-Lux", [14]).
rule(12, "производитель Япония", "Toyota Land Cruiser", [15]).
rule(13, "большой багажник", "Toyota RAV-4", [16]).
rule(14, "большой багажник", "Nissan Qashqai", [17]).
rule(15, "Toyota Hi-Lux", "механика", [18]).
rule(15, "Toyota Hi-Lux", "автомат", [19]).
rule(16, "Toyota Land Cruiser", "anniversary edition", [20]).
rule(17, "Toyota RAV-4", "4 двери", [21]).
rule(18, "Nissan Qashqai", "с парктрониками", [22]).
rule(19, "автомат", "типтроник", [23]).
rule(20, "механика", "5 ступеней", [24]).
rule(21, "5 ступеней", "дизель", [25]).
rule(22, "5 ступеней", "бензин", [26]).

ask(1):- write("нужна крупная машина?"),!,complete(1).
ask(2):- write("нужна проходимая машина?"),!,complete(2).
ask(3):- write("нужна маленькая машина?"),!,complete(3).
ask(4):- write("нужна быстрая машина?"),!,complete(4).
ask(5):- write("будете перевозить грузы?"),!,complete(5).
ask(6):- write("нужен большой клиренс?"),!,complete(6).
ask(7):- write("нужно что-то поменьше джипа?"),!,complete(7).
ask(8):- write("нужна жесткая подвеска?"),!,complete(8).
ask(9):- write("нужен постоянный 4-wd?"),!,complete(9).
ask(10):- write("нужна повышенная проходимость?"),!,complete(10).
ask(11):- write("нужен 4-wd"),!,complete(11).
ask(12):- write("нужна надежность?"),!,complete(12).
ask(13):- write("нужен вместительный багажник?"),!,complete(13).
ask(14):- write("нужен бюджетный вариант?"),!,complete(14).
ask(15):- write("нужен вариант по дороже?"),!,complete(15).
ask(16):- write("нужен быстрый вариант?"),!,complete(16).
ask(17):- write("нужен экономный вариант?"),!,complete(17).
ask(18):- write("нужна механическая КПП?"),!,complete(18).
ask(19):- write("нужна атоматическая КПП?"),!,complete(19).
ask(20):- write("нужна богая комплектация?"),!,complete(20).
ask(21):- write("машина для семьи?"),!,complete(21).
ask(22):- write("плохо паркуетесь?"),!,complete(22).
ask(23):- write("нужен контроль над коробкой?"),!,complete(23).
ask(24):- write("нужно больше ступеней передачь для скоростной езды?"),!,complete(24).
ask(25):- write("проживаете в теплых краях?"),!,complete(25).
ask(26):- write("живете в холодном регионе?"),!,complete(26).

ask(X):- fact(X, "да"),!.
ask(X):- fact(X, "нет"),!,fail.

recognition(X):- rule(N, X, Y, Z), discover(Z), !,
write("!!!!"), write(X), write(" - "), write(Y), write(" по правилу "), write(N), nl,
recognition(Y).
recognition("машина"):- write("не удалось подобрать вам машину"),!.
recognition("легковая"):- write("вам подойдет легковая машина"),!.
recognition(_).
discover([]).
discover([X|Y]):- ask(X), discover(Y).
complete(X):- nl, read(Y), assert(fact(X, Y)), Y="да".
