#!/usr/bin/perl
% Общежитие, комната, студент, комендант
% represent(id, room(id-комнаты, этаж), student(фамилия, имя), comendant(фамилия, имя))
represent(1, room(1, 1), student('ФСтудент1', 'ИСтудент1'), comendant('ФКомендант1', 'ИКомендант1')).
represent(1, room(2, 1), student('ФСтудент2', 'ИСтудент2'), comendant('ФКомендант1', 'ИКомендант1')).
represent(1, room(1, 2), student('ФСтудент3', 'ИСтудент3'), comendant('ФКомендант1', 'ИКомендант1')).
represent(1, room(2, 2), student('ФСтудент4', 'ИСтудент4'), comendant('ФКомендант1', 'ИКомендант1')).
represent(2, room(1, 1), student('ФСтудент5', 'ИСтудент5'), comendant('ФКомендант2', 'ИКомендант2')).
represent(2, room(2, 1), student('ФСтудент6', 'ИСтудент6'), comendant('ФКомендант2', 'ИКомендант2')).
represent(2, room(1, 2), student('ФСтудент7', 'ИСтудент7'), comendant('ФКомендант2', 'ИКомендант2')).
represent(2, room(2, 2), student('ФСтудент8', 'ИСтудент8'), comendant('ФКомендант2', 'ИКомендант2')).
represent(3, room(1, 1), student('ФСтудент9', 'ИСтудент9'), comendant('ФКомендант3', 'ИКомендант3')).
represent(3, room(2, 1), student('ФСтудент10', 'ИСтудент10'), comendant('ФКомендант3', 'ИКомендант3')).
represent(3, room(1, 2), student('ФСтудент11', 'ИСтудент11'), comendant('ФКомендант3', 'ИКомендант3')).
represent(3, room(2, 2), student('ФСтудент12', 'ИСтудент12'), comendant('ФКомендант3', 'ИКомендант3')).
represent(4, room(1, 1), student('ФСтудент13', 'ИСтудент13'), comendant('ФКомендант4', 'ИКомендант4')).
represent(4, room(2, 1), student('ФСтудент14', 'ИСтудент14'), comendant('ФКомендант4', 'ИКомендант4')).
represent(4, room(1, 2), student('ФСтудент15', 'ИСтудент15'), comendant('ФКомендант4', 'ИКомендант4')).
represent(4, room(2, 2), student('ФСтудент16', 'ИСтудент16'), comendant('ФКомендант4', 'ИКомендант4')).
represent(5, room(1, 1), student('ФСтудент17', 'ИСтудент17'), comendant('ФКомендант5', 'ИКомендант5')).
represent(5, room(2, 1), student('ФСтудент18', 'ИСтудент18'), comendant('ФКомендант5', 'ИКомендант5')).
represent(5, room(1, 2), student('ФСтудент19', 'ИСтудент19'), comendant('ФКомендант5', 'ИКомендант5')).
represent(5, room(2, 2), student('ФСтудент20', 'ИСтудент20'), comendant('ФКомендант5', 'ИКомендант5')).

% Отношение общежитие - фамилия студента
hostel_fstudent(F,K):-represent(F,_,student(K,_),_).
% Отношение номер комнаты - фамилия студента
room_fstudent(F,D):-represent(_, room(F,_),student(D,_),_).
% Отношение общежитие - фамилия комендант
hostel_fcomendant(F,K):-represent(F,_,_,comendant(K,_)).
% Отношение этаж - комната - общежитие
floor_room(F,K,D):-represent(D,room(K,F),_,_).
% Отношение общежитие - комната - фамилия студент
hostel_room_student(F,K,D):-represent(F,room(K,_),student(D,_),_).

menu:-
  write('1 - Найти общежитие в котором живет студент с фамилией ?'), nl,
  write('2 - Найти фамилию студента, проживающего в комнате ?'), nl,
  write('3 - Найти общежитие у которого комендант с фамилией ?'), nl,
  write('4 - Найти этаж комнаты в общежитии'), nl,
  write('5 - Найти фамилию студента, проживающего в общежитии ? и в комнате ?'), nl,
  write('0 - Выход'), nl,
  read(C),
  action(C).

action(1):-!,
  write('Введите фамилию студента'), nl,
  read(K),
  hostel_fstudent(F,K),
  write('Номер общежития: '),
  write(F), nl,
  menu.
action(2):-!,
  write('Введите номер комнаты'), nl,
  read(F),
  room_fstudent(F,D),
  write('Номер комнаты: '),
  write(D), nl,
  menu.
action(3):-!,
  write('Введите фамилию коменданта'), nl,
  read(K),
  hostel_fcomendant(F,K),
  write('Общежитие номер: '),
  write(F), nl,
  menu.
action(4):-!,
  write('Введите номер общежития'),nl,
  read(D),
  write('Введмте номер комнаты'),nl,
  read(K),
  floor_room(F,K,D),
  write('Этаж: '),
  write(F), nl,
  menu.
action(5):-!,
  write('Введите номер общежития '), nl,
  read(F),
  write('Введите номер комнаты'), nl,
  read(K),
  hostel_room_student(F,K,D),
  write('Фамилия студента: '),
  write(D), nl,
  menu.
action(0):-!,
  write('Выход из программы.').

start:-write('Гелисханов Гелани лабораторная №7'),nl,menu.
