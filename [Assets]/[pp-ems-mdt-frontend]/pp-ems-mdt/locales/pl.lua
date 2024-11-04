if not Locale then
    Locale = {}
end

Locale['pl'] = {
    backend = {
        patrols = {
            not_found = 'Nie znaleziono podanego patrolu.',
            already_owner = "Jesteś już właścicielem patrolu #%s",
            already_member = 'Jesteś już członkiem patrolu #%s',
            invitation = {
                received = "Otrzymałeś zaproszenie dołączenia do patrolu #%s od %s. Przejdź do zakładki \"Patrole\" w MDT, aby zaakceptować zaproszenie",
                target_expired = "Twoje zaproszenie do patrolu #%s od %s wygasło.",
                src_expired = "Zaproszenia do patrolu #%s wygasły dla: %s."
            },
            created_succesfully_1 = 'Poprawnie stworzono patrol #%s.',
            created_succesfully_2 = 'Oczekiwanie na zaakceptowanie zaproszeń przez: %s.',
            doctor_joined = 'Doktor %s dołączył do patrolu #%s',
            you_joined = 'Dołączyłeś do patrolu #%s',
            doctor_declined = 'Doktor %s odrzucił zaproszenie do patrolu #%s',
            you_declined = 'Odrzuciłeś zaproszenie do patrolu #%s',
            no_perms = 'Nie masz uprawnień do edytowania tego patrolu.',
            kicked = "Zostałeś wyrzucony z patrolu #%s przez %s.",
            updated_succesfully = "Patrol został zaktualizowany.",
            removed = "Patrol #%s został usunięty przez %s.",
            removed_succesfully = 'Patrol #%s został usunięty.',
            doctor_left = "Doktor %s opuścił patrol #%s.",
            you_left = 'Opuściłeś patrol #%s.',
            not_in_patrol = 'Nie jesteś członkiem tego patrolu.'
        },
        dispatch = {
            not_found = "Nie znaleziono zgłoszenia",
            patrol_respond = 'Twój patrol odpowiedział na zgłoszenie #%s',
            patrol_stop = "Twój patrol przestał odpowiadać na zgłoszenie #%s"
        }
    },
    global = {
        warning = 'Ostrzeżenie!',
        no = "Nie",
        yes = "Tak",
        accept = "Akceptuj",
        decline = "Odrzuć",
        ssn = "Numer ID obywatela",
        success = "Sukces",
        wanted = "POSZUKIWANY",
        attention = 'Uwaga!',
        time_in = 'za', -- na przykład: [za] 2 godziny
        cancel = 'Anuluj',
        save = 'Zapisz',
        submit = 'Wyślij',
        notifications = {
            error = "Błąd",
            success = "Sukces",
            info = "Informacja",
            warning = "Ostrzeżenie"
        },
        no_perms_title = 'Brak uprawnień',
        no_perms = 'Nie masz uprawnień do wykonania tej akcji.'
    },
    navigation = {
        homepage = "Strona główna",
        announcements = "Ogłoszenia",
        doctors = "Doktorzy",
        patrols = "Patrole",
        citizens = "Obywatele",
        dispatch = "Dispatch",
        cases = "Sprawy",
        notes = "Notatki",
        settings = "Ustawienia",
        exit = "Wyjście"
    },
    homepage = {
        title = "Strona główna",
        description = "Witaj, Doktorze!",
        chat = {
            title = "Czat",
            description = "Czat z innymi doktorami",
            send = "Wyślij wiadomość",
            no_messages = 'Brak wiadomości',
            no_perms = {
                title = 'Brak uprawnień',
                subtitle = 'Nie masz uprawnień do przeglądania wiadomości na czacie.'
            }
        },
        search = {
            title = "Wyszukiwarka",
            description = "Wyszukaj cokolwiek w MDT",
            search = "Szukaj",
            not_found = {
                title = "Nie znaleziono wyników",
                subtitle = "Spróbuj ponownie z inną frazą"
            },
            no_input = {
                title = "Rozpocznij wyszukiwanie",
                subtitle = "Szukaj po obywatelach, sprawach lub notatkach"
            },
            no_perms = {
                title = 'Brak uprawnień',
                subtitle = 'Nie masz uprawnień do korzystania z tej funkcji.'
            }
        },
        doctors = {
            title = "Doktorzy online",
            description = "Lista wszystkich doktorów na służbie",
            noresult = {
                title = "Brak doktorów",
                subtitle = "Nie znaleziono doktorów na służbie"
            }
        },
        dispatch = {
            title = "Dispatch",
            description = "Zobacz najnowsze zgłoszenia",
            noresult = {title = "Brak zgłoszeń", subtitle = "Nie znaleziono zgłoszeń"},
            more = 'Więcej...'
        }
    },
    announcements = {
        title = "Ogłoszenia",
        description = "Przeglądaj i twórz ogłoszenia",
        preview = "Przeglądaj",
        create = "Stwórz",
        form = {
            title = {
                label = "Tytuł",
                rule = "Podaj tytuł",
                placeholder = "Wpisz tytuł ogłoszenia"
            },
            content = {
                label = "Treść",
                rule = "Podaj treść ogłoszenia. Wymagana ilość znaków: {minLength}"
            },
            submit = "Stwórz ogłoszenie"
        }
    },
    announcement = {
        title = "Ogłoszenie",
        description = "Przeglądaj ogłoszenie #{id}",
        edit = {
            success = "Ogłoszenie zostało pomyślnie edytowane.",
            error = "Nie udało się edytować ogłoszenia.",
            error_log = "Błąd podczas edytowania ogłoszenia.",
            label = 'Edytuj'
        },
        remove = "Usuń",
        remove_warning_title = "Czy na pewno chcesz usunąć to ogłoszenie?",
        remove_warning_description = "Tej operacji nie można cofnąć.",
        remove_confirm = "Tak, usuń to",
        remove_cancel = "Nie, zatrzymaj",
        no_permissions = "Nie masz uprawnień do wykonania tej akcji."
    },
    patrols = {
        title = "Patrole",
        description = "Przeglądaj i twórz patrole",
        patrol = "Patrol",
        create = {
            title = "Stwórz patrol",
            error = "Wystąpił błąd podczas tworzenia patrolu",
            form = {
                doctors = {
                    title = "Doktorzy",
                    placeholder = "Wybierz doktorów do patrolu"
                },
                vehicle = {
                    title = "Pojazd",
                    placeholder = "Wybierz pojazd z listy",
                    rule = "Wybór pojazdu jest wymagany"
                },
                status = {
                    title = "Status",
                    placeholder = "Wybierz status patrolu",
                    rule = "Wybór statusu jest wymagany"
                }
            }
        },
        edit = {title = "Edytuj patrol"},
        remove = {
            title = "Ostrzeżenie",
            description = "Czy na pewno chcesz usunąć ten patrol?"
        },
        leave = {
            title = "Ostrzeżenie",
            description = "Czy na pewno chcesz opuścić ten patrol?"
        },
        no_perms = 'Nie masz uprawnień do tworzenia patrolu'
    },
    citizens = {
        title = "Obywatele",
        description = "Szukaj i przeglądaj obywateli",
        search = "Szukaj obywatela"
    },
    citizen = {
        title = "Obywatel",
        description = "Przeglądaj szczegóły o obywatelu",
        cases = {title = "Sprawy", search = "Szukaj spraw"},
        photo = {
            take = "Zrób zdjęcie",
            url = {
                button = "Wklej link",
                title = "Wklej link do zdjęcia",
                placeholder = "Wprowadź link"
            },
            remove = {
                button = "Usuń zdjęcie",
                title = "Usuń zdjęcie",
                description = "Czy na pewno chcesz usunąć zdjęcie?"
            }
        },
        info = {
            name = "Imię i nazwisko",
            dob = "Data urodzenia",
            dob_format = "{dob} - {dob_calculated} lat(-a)",
            nationality = "Narodowość",
            licenses = "Licencje",
            actions = {
                title = "Akcje",
                incident = "Stwórz sprawę",
                warrant = "Stwórz nakaz",
                note = "Stwórz notatkę"
            }
        },
        notes = "Notatki"
    },
    dispatch = {
        title = "Dispatch",
        description = "Przeglądaj zgłoszenia dispatch",
        no_result = {title = "Brak zgłoszeń", subtitle = "Nie znaleziono zgłoszeń"},
        notification = {
            report_time = "Czas zgłoszenia",
            location = "Lokalizacja",
            gender = "Płeć",
            citizen = "Obywatel",
            responds = "Reagują",
            success = 'Odpowiedziałeś na zgłoszenie',
            stoprespond = {
                success = 'Pomyślnie zakończono odpowiedź na zgłoszenie.',
                failure = 'Nie udało się zakończyć odpowiedzi na zgłoszenie.',
                button = 'Zakończ odpowiedź'
            },
            respond = {
                failure = 'Nie udało się odpowiedzieć na zgłoszenie.',
                respond = "Odpowiedz",
                label = 'Odpowiedz'
            }
        }
    },
    cases = {
        title = "Sprawy",
        description = "Twórz i przeglądaj sprawy",
        search = "Szukaj spraw",
        incident = "Incydent",
        warrant = "Nakaz",
        reset = "Resetuj",
        form = {
            title = "Tytuł",
            description = "Opis",
            citizens = "Obywatele",
            select_citizens = "Wybierz obywateli",
            doctors = "Doktorzy",
            select_doctors = "Wybierz doktorów",
            injuries = "Obrażenia",
            select_injuries = "Wybierz obrażenia",
            charge = {fine = "{fine}$"},
            total = {title = "Łącznie", fine = "Grzywna"},
            reduction = "{value}% zmniejszenie",
            body_diagram = "Diagram ciała",
            errors = {
                title = "Wprowadź tytuł",
                description = "Wprowadź opis",
                citizens = "Wybierz obywateli",
                doctors = "Wybierz doktorów",
                injuries = "Wybierz obrażenia",
                submit = "Wystąpił błąd podczas przesyłania formularza"
            },
            submit = "Wyślij"
        },
        injuries = {
            title = "Obrażenia",
            fine = "Grzywna",
            fine_format = "{fine}$",
            custom_injury = "Dodaj niestandardowe obrażenie"
        }
    },
    case = {
        title = "Sprawa #{id}",
        description = "Opis",
        details = "Szczegóły",
        created = "Utworzono",
        last_edited = "Ostatnia edycja",
        by = "Przez",
        at = "O",
        expires_at = "Wygasa o",
        incident_with_warrant = "Incydent utworzony z Nakazem #{warrant}",
        execute_warrant = "Wykonaj nakaz",
        save = "Zapisz",
        cancel = "Anuluj",
        title_label = "Tytuł",
        description_label = "Opis",
        sections = {
            citizens = "Obywatele",
            doctors = "Doktorzy",
            injuries = "Obrażenia",
            total = "Łącznie",
            add = "Dodaj {section}",
            reduction = 'Zmniejszenie'
        }
    },
    settings = {
        title = "Ustawienia",
        description = "Zarządzaj preferencjami MDT",
        colors = "Kolory",
        color1 = "Kolor tła kontenera",
        color2 = "Kolor tła zawartości",
        color3 = "Kolor główny",
        textColor = "Kolor tekstu bazowego",
        textColor2 = "Kolor głównego tekstu",
        borderColor = "Kolor głównej ramki",
        resetButton = "Zresetuj do domyślnych",
        notifications = "Powiadomienia",
        volume = "Głośność"
    },
    notes = {
        page = {title = "Notatki", description = "Lista notatek"},
        search = {placeholder = "Szukaj notatek"},
        form = {
            title = {label = "Tytuł", required = "Wprowadź tytuł"},
            description = {
                label = "Opis",
                required = "Wprowadź opis"
            },
            citizens = {
                label = "Obywatele",
                required = "Wybierz obywateli",
                placeholder = "Wybierz obywateli"
            },
            doctors = {
                label = "Doktorzy",
                required = "Wybierz doktorów",
                placeholder = "Wybierz doktorów"
            },
            cases = {
                label = "Sprawy",
                required = "Wybierz sprawy",
                placeholder = "Wybierz sprawy"
            },
            submitButton = "Wyślij",
            error = 'Wystąpił błąd podczas zapisywania notatki'
        }
    },
    note = {
        title = 'Notatka',
        description = 'Szczegóły notatki',
        details = 'Szczegóły',
        author = 'Autor',
        created_at = 'Utworzono',
        last_edited = 'Ostatnia edycja',
        by = 'Przez',
        at = 'O',
        delete_confirm = 'Czy na pewno chcesz usunąć tę notatkę?',
        sections = {
            citizens = 'Obywatele',
            doctors = 'Doktorzy',
            cases = 'Sprawy',
        }
    }
}
