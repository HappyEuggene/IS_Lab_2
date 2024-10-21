% ��������� ��� ��������� ������� discontiguous
:- discontiguous is_a/2.
:- discontiguous part_of_fact/2.
:- discontiguous connected_to/2.

% ��������� ��������� �� ���������� ��� ���������� ������
:- table is_a/2.
:- table part_of/2.
:- table connected_to/2.

% ����-����� ��'���� (is_a)
is_a(device, equipment).
is_a(electronic_device, device).

is_a(computer, electronic_device).
is_a(desktop_computer, computer).
is_a(laptop_computer, computer).
is_a(smartphone, computer).
is_a(tablet, computer).

is_a(mobile_device, electronic_device).
is_a(smartphone, mobile_device).
is_a(tablet, mobile_device).

is_a(computer_component, electronic_device).
is_a(cpu, computer_component).
is_a(intel_cpu, cpu).
is_a(amd_cpu, cpu).

is_a(motherboard, computer_component).
is_a(atx_motherboard, motherboard).
is_a(micro_atx_motherboard, motherboard).

is_a(ram, computer_component).
is_a(ddr4_ram, ram).
is_a(ddr5_ram, ram).

is_a(storage_device, computer_component).
is_a(hdd, storage_device).
is_a(ssd, storage_device).

is_a(graphics_card, computer_component).
is_a(nvidia_gpu, graphics_card).
is_a(amd_gpu, graphics_card).

% ���� ��'���� �������-���� (part_of_fact)

% ������� laptop_computer
part_of_fact(battery, laptop_computer).
part_of_fact(screen, laptop_computer).
part_of_fact(keyboard, laptop_computer).
part_of_fact(touchpad, laptop_computer).

% ������� smartphone
part_of_fact(screen, smartphone).
part_of_fact(battery, smartphone).
part_of_fact(camera, smartphone).

% ������� cpu
part_of_fact(transistor, cpu).

% ��'���� part_of ��� motherboard
part_of_fact(cpu, motherboard).
part_of_fact(ram, motherboard).
part_of_fact(graphics_card, motherboard).
part_of_fact(storage_device, motherboard).
part_of_fact(cpu_cooler, motherboard).

% ������� storage_device
part_of_fact(platters, hdd).
part_of_fact(nand_flash, ssd).

% ��'���� "connected_to" ��� cpu
connected_to(transistor, ram).
connected_to(transistor, graphics_card).
connected_to(transistor, storage_device).

% ��'���� "connected_to" ��� graphics_card
connected_to(graphics_card, monitor).

% ������� ���������

% ������������� ����-������� ��'���� � ��������� �����
is_a(X, Z) :-
    is_a(X, Y),
    X \= Y,
    Y \= Z,
    is_a(Y, Z).

% ���� ��'���� �������-����
part_of(X, Y) :-
    part_of_fact(X, Y).

% ������������� ��'���� �������-���� � ��������� �����
part_of(X, Z) :-
    part_of_fact(X, Y),
    X \= Y,
    \+ cyclic_part_of(X, Y),
    part_of(Y, Z).

% �������� ��� �������� �����
cyclic_part_of(X, Y) :-
    part_of_fact(Y, X).

% ������������� ��'���� "connected_to" � ��������� �����
connected_to(X, Z) :-
    connected_to(X, Y),
    X \= Y,
    \+ cyclic_connected_to(X, Y),
    connected_to(Y, Z).

% �������� ��� �������� �����
cyclic_connected_to(X, Y) :-
    connected_to(Y, X).

% �������� ����������� "part_of" ����� "is_a"
% ������� ����������� part_of ����� is_a �� ���������

% �������� ����������� "connected_to" ����� "is_a"
% ������� ����������� connected_to ����� is_a �� ���������
