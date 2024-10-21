Сьомкін Євгеній ТТП-42
------
Лабораторна робота №2 з дисципліни "Інтелектуальні системи"
------
Для запуску використовувалося середовище SWI-Prolog.
------
Структура онтології:

equipment

└── device
    └── electronic_device
        ├── computer
        │   ├── desktop_computer
        │   ├── laptop_computer
        │   │   ├── part_of: battery
        │   │   ├── part_of: screen
        │   │   ├── part_of: keyboard
        │   │   └── part_of: touchpad
        │   ├── smartphone
        │   │   ├── part_of: screen
        │   │   ├── part_of: battery
        │   │   └── part_of: camera
        │   └── tablet
        ├── mobile_device
        │   ├── smartphone
        │   └── tablet
        └── computer_component
            ├── cpu
            │   ├── is_a: intel_cpu
            │   ├── is_a: amd_cpu
            │   └── part_of: transistor
            │       ├── connected_to: ram
            │       ├── connected_to: graphics_card
            │       └── connected_to: storage_device
            ├── motherboard
            │   ├── is_a: atx_motherboard
            │   ├── is_a: micro_atx_motherboard
            │   ├── part_of: cpu
            │   ├── part_of: ram
            │   ├── part_of: graphics_card
            │   ├── part_of: storage_device
            │   └── part_of: cpu_cooler
            ├── ram
            │   ├── is_a: ddr4_ram
            │   └── is_a: ddr5_ram
            ├── storage_device
            │   ├── hdd
            │   │   └── part_of: platters
            │   └── ssd
            │       └── part_of: nand_flash
            └── graphics_card
                ├── is_a: nvidia_gpu
                ├── is_a: amd_gpu
                └── connected_to: monitor




Виконання основних умов
1. Prolog:

- Онтологія реалізована мовою Prolog у файлі ontology.pl.

2. Набір фактів (тверджень), не менше 25 початкових:

- У файлі ontology.pl міститься більше 25 фактів:
- Факти is_a/2: 22 факти.
- Факти part_of_fact/2: 13 фактів.
- Факти connected_to/2: 4 факти.
- Загалом: 39 фактів.

3. Набір правил виведення:

- Правила для транзитивності та запобігання циклів:
- Транзитивність is_a/2.
- Транзитивність part_of/2.
- Транзитивність connected_to/2.
- Перевірка циклів для part_of/2 та connected_to/2.

4. Набір фактів містить факти, що утворюють онтологію:

- Факти is_a/2 та part_of_fact/2 визначають структуру онтології комп'ютерного обладнання.

5. Онтологія має 2 типи зв'язків:

- Родо-видові зв'язки (is_a): Відображають відношення типу "є видом".
- Зв'язки частина-ціле (part_of): Відображають відношення частина-ціле.
- Додатково: Зв'язки connected_to (третій тип зв'язків).

6.  Онтологія містить підграф з фактором галуження is_a не менше 2 і висотою не менше 3:

- Фактор галуження ≥2:
Наприклад, computer_component має підвузли cpu, motherboard, ram, storage_device, graphics_card.
Висота ≥3:
- Від equipment до ddr5_ram:
ddr5_ram → ram → computer_component → electronic_device → device → equipment.
- Висота: 5 рівнів.
