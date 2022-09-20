import psycopg2

conn = psycopg2.connect(database="netology_db", user="postgres", password="postgres")
with conn.cursor() as cur:

    def create_tabledb(cur):
        cur.execute(""" 
        CREATE TABLE IF NOT EXISTS clients(
        clients_id SERIAL PRIMARY KEY, 
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE
        );
        """)
        cur.execute(""" 
        CREATE TABLE IF NOT EXISTS phones(
        phones_id SERIAL PRIMARY KEY, 
        phones_numder  VARCHAR(20) NULL UNIQUE,
        clients_id INTEGER NOT NULL REFERENCES clients(clients_id)
        );
        """)
    conn.commit()

    # Функция, позволяющая добавить нового клиента
    def add_clients(cur, first_name, last_name, email):
        cur.execute(""" 
        INSERT INTO clients(first_name, last_name, email) 
        VALUES (%s, %s, %s); 
        """, (first_name, last_name, email))
        conn.commit()

    # Функция, позволяющая добавить телефон для существующего клиента
    def add_phone(cur, phones_numder, clients_id):
        cur.execute(""" 
        INSERT INTO clients(phones_numder, clients_id) 
        VALUES (%s, %s);
        """, (phones_numder, clients_id))
        conn.commit()

    # Функция, позволяющая изменить данные о клиенте
    def change_info_client():
        print('Команды для смены информации: 1 - "Смена имени", 2 - "Смена фамилии", ' \
              '3 - "Смена email", 4 - "Смена номера телефона", 5 - "Выход"')
        while True:
            command = int(input("Введите команду: "))
            client_id = int(input("Введите id клиента"))
            if not command:
                break
            if command == 1:
                first_name_input = input("Введите новое имя: ").strip()
                cur.execute(""" 
                UPDATE clients SET first_name=%s
                WHERE id=%s;
                """, (first_name_input, client_id))
                print(f'Изменение имени на {first_name_input} успешно произошло!')
                break

            elif command == 2:
                last_name_input = input("Введите новую фамилию ").strip()
                cur.execute(""" 
                UPDATE clients SET last_name=%s
                WHERE id=%s;
                """, (last_name_input, client_id))
                print(f'Изменение фамилии на {last_name_input} успешно произошло!')
                break
            elif command == 3:
                email_input = input("Введите новый email ").strip()
                cur.execute(""" 
                UPDATE clients SET email=%s
                WHERE id=%s;
                """, (email_input, client_id))
                print(f'Изменение email на {email_input} успешно произошло!')
                break
            elif command == 4:
                phone_input = int(input("Введите новый номер телефона "))
                cur.execute(""" 
                UPDATE clients SET phone=%s
                WHERE id=%s;
                """, (phone_input, client_id))
                print(f'Изменение номера телефона на {phone_input} успешно произошло!')
                break
            elif command == 5:
                break
            else:
                print("Неправильная команда, введите другую.")
            conn.commit()

    # Функция, позволяющая удалить телефон для существующего клиента
    def delet_phone(cur, phone_number):
        client_id = int(input('Введите id клиента: '))
        cur.execute("""
        DELETE FROM client WHERE client_id=%s AND phone_number=%s;
        """, (phone_number, client_id))
        conn.commit()

    # Функция, позволяющая удалить существующего клиента
    def delet_info_client():
        client_id = int(input("Введите id клиента которого хотите удалить: "))
        cur.execute("""
        DELETE FROM phones WHERE client_id=%s;
        """, (client_id,))
        cur.execute("""
        DELETE FROM clients WHERE client_id=%s
        """, (client_id,))
        conn.commit()

    # Функция, позволяющая найти клиента по его данным (имени, фамилии, email-у или телефону)
    def find_client():
        print('Команды для поиска клиента: 1 - "Поиск по имени", 2 - "Поиск по фамилии",' \
              '3 - "Поиск по email", 4 - "Поиск по номеру телефона", 5 - "Выход"')
        command = int(input("Введите команду для поиска информации о клиенте: "))
        while True:
            if not command:
                break
            if command == 1:
                name_finding = input("Введите имя клиента: ")
                cur.execute("""
                SELECT client_id, first_name, last_surname, email, phone_number FROM clients c
                LEFT JOIN phones p ON c.phones_id = p.phones_id
                WHERE client_name=%s;
                """, (name_finding,))
                print(cur.fetchall())
            elif command == 2:
                name_finding = input("Введите фамилию клиента: ")
                cur.execute("""
                SELECT client_id, first_name, last_surname, email, phones
                FROM clients c
                LEFT JOIN phones p ON c.phones_id = p.phones_id
                WHERE client_name=%s;
                """, (name_finding,))
                print(cur.fetchall())
            elif command == 3:
                email_finding = input("Введите email клиента: ")
                cur.execute("""
                SELECT client_id, first_name, last_name, email, phones
                FROM clients c
                LEFT JOIN phones p ON c.phones_id = p.phones_id
                WHERE email=%s;
                """, (email_finding,))
                print(cur.fetchall())
            elif command == 4:
                phones_finding = input("Введите номер телефона клиента: ")
                cur.execute("""
                SELECT client_id, first_name, last_name, email, phones
                FROM clients c
                LEFT JOIN phones p ON c.phones_id = p.phones_id
                WHERE phones=%s;
                """, (phones_finding,))
                print(cur.fetchall())
            elif command == 5:
                break
            else:
                print("Вы ввели неправильную команду, введите другую.")


    def check_function():
        cur.execute(""" SELECT * FROM clients """)
        print(cur.fetchall())
        cur.execute(""" SELECT * FROM phones """)
        print(cur.fetchall())

    #check_function()

with conn.cursor() as cur:
    create_tabledb(cur)
    check_function()
    add_clients(cur, "Michael", "Jackson", "michael@com")
    add_clients(cur, "Stephen", "Jobs", "bro@yandex.ru")
    add_clients(cur, "Louis", "Armstrong", "moon@mail.ru")
    add_phone(cur, 12345678910, 1)
    add_phone(cur, 10987654321, 2)
    add_phone(cur, 1122334455, 3)
    change_info_client()
    delet_phone()
    delet_info_client()
    find_client()

conn.close()