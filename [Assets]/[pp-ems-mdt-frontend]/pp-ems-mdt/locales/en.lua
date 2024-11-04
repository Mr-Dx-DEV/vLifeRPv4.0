if not Locale then Locale = {} end

Locale['en'] = {
    backend = {
        patrols = {
            not_found = 'The specified patrol was not found.',
            already_owner = "You are already the owner of patrol #%s",
            already_member = 'You are already a member of patrol #%s',
            invitation = {
                received = "You have received an invitation to join patrol #%s from %s. Go to the 'Patrols' tab in MDT to accept the invitation",
                target_expired = "Your invitation to patrol #%s from %s has expired.",
                src_expired = "The invitations to patrol #%s have expired for: %s."
            },
            created_succesfully_1 = 'Patrol #%s successfully created.',
            created_succesfully_2 = 'Waiting for invitations to be accepted by: %s.',
            doctor_joined = 'Doctor %s has joined patrol #%s',
            you_joined = 'You have joined patrol #%s',
            doctor_declined = 'Doctor %s declined the invitation to patrol #%s',
            you_declined = 'You declined the invitation to patrol #%s',
            no_perms = 'You do not have permission to edit this patrol.',
            kicked = "You were kicked from patrol #%s by %s.",
            updated_succesfully = "Patrol has been updated.",
            removed = "Patrol #%s was removed by %s.",
            removed_succesfully = 'Patrol #%s has been removed.',
            doctor_left = "Doctor %s left patrol #%s.",
            you_left = 'You left patrol #%s.',
            not_in_patrol = 'You are not a member of this patrol.'
        },
        dispatch = {
            not_found = "Report not found",
            patrol_respond = 'Your patrol responded to report #%s',
            patrol_stop = "Your patrol has stopped responding to the report #%s"
        }
    },
    global = {
        warning = 'Warning!',
        no = "No",
        yes = "Yes",
        accept = "Accept",
        decline = "Decline",
        ssn = "Citizen ID",
        success = "Success",
        wanted = "WANTED",
        attention = 'Attention!',
        time_in = 'in', -- for example: [in] 2 hours
        cancel = 'Cancel',
        save = 'Save',
        submit = 'Submit',
        notifications = {
            error = "Error",
            success = "Success",
            info = "Information",
            warning = "Warning"
        },
        no_perms_title = 'No permission',
        no_perms = 'You don\'t have permission to perform this action.'
    },
    navigation = {
        homepage = "Homepage",
        announcements = "Announcements",
        doctors = "Doctors",
        patrols = "Patrols",
        citizens = "Citizens",
        dispatch = "Dispatch",
        cases = "Cases",
        notes = "Notes",
        settings = "Settings",
        exit = "Exit"
    },
    homepage = {
        title = "Homepage",
        description = "Hey Doctor!",
        chat = {
            title = "Chat",
            description = "Chat with other doctors",
            send = "Send message",
            no_messages = 'No messages found',
            no_perms = {
                title = 'No permission',
                subtitle = 'You dont have permission to view chat messages.'
            }
        },
        search = {
            title = "Search",
            description = "Search for anything in the MDT",
            search = "Search",
            not_found = {
                title = "No results found",
                subtitle = "Try again with a different phrase"
            },
            no_input = {
                title = "Start searching",
                subtitle = "Search by citizens, cases, or notes"
            },
            no_perms = {
                title = 'No permission',
                subtitle = 'You dont have permission to use this.'
            }
        },
        doctors = {
            title = "Doctors online",
            description = "List of all doctors on duty",
            noresult = {
                title = "No doctors",
                subtitle = "No doctors found on duty"
            }
        },
        dispatch = {
            title = "Dispatch",
            description = "View the latest dispatch reports",
            noresult = {title = "No reports", subtitle = "No reports found"},
            more = 'More...'
        }

    },
    announcements = {
        title = "Announcements",
        description = "Browse and create announcements",
        preview = "Browse",
        create = "Create",
        form = {
            title = {
                label = "Title",
                rule = "Provide a title",
                placeholder = "Enter announcement title"
            },
            content = {
                label = "Content",
                rule = "Provide announcement content. Minimum characters required: {minLength}"
            },
            submit = "Create announcement"
        }
    },
    announcement = {
        title = "Announcement",
        description = "Browse announcement #{id}",
        edit = {
            success = "Announcement edited successfully.",
            error = "Failed to edit the announcement.",
            error_log = "Error while editing the announcement.",
            label = 'Edit'
        },
        remove = "Remove",
        remove_warning_title = "Are you sure you want to remove this announcement?",
        remove_warning_description = "This action cannot be undone.",
        remove_confirm = "Yes, remove it",
        remove_cancel = "No, keep it",
        no_permissions = "You do not have permission to perform this action."
    },
    patrols = {
        title = "Patrols",
        description = "Browse and create patrols",
        patrol = "Patrol",
        create = {
            title = "Create Patrol",
            error = "There was an error creating the patrol",
            form = {
                doctors = {
                    title = "Doctors",
                    placeholder = "Select doctors for the patrol"
                },
                vehicle = {
                    title = "Vehicle",
                    placeholder = "Select a vehicle from the list",
                    rule = "Vehicle selection is required"
                },
                status = {
                    title = "Status",
                    placeholder = "Select patrol status",
                    rule = "Status selection is required"
                }
            }
        },
        edit = {title = "Edit Patrol"},
        remove = {
            title = "Warning",
            description = "Are you sure you want to delete this patrol?"
        },
        leave = {
            title = "Warning",
            description = "Are you sure you want to leave this patrol?"
        },
        no_perms = 'You dont have permission to create patrol'
    },
    citizens = {
        title = "Citizens",
        description = "Search and browse citizens",
        search = "Search citizen"

    },
    citizen = {
        title = "Citizen",
        description = "View details about the citizen",
        cases = {title = "Cases", search = "Search cases"},
        photo = {
            take = "Take photo",
            url = {
                button = "Paste link",
                title = "Paste photo link",
                placeholder = "Enter link"
            },
            remove = {
                button = "Remove photo",
                title = "Remove photo",
                description = "Are you sure you want to remove the photo?"
            }
        },
        info = {
            name = "Full Name",
            dob = "Date of Birth",
            dob_format = "{dob} - {dob_calculated} years old",
            nationality = "Nationality",
            licenses = "Licenses",
            actions = {
                title = "Actions",
                incident = "Create Case",
                warrant = "Create Warrant",
                note = "Create Note"
            }
        },
        notes = "Notes",
    },
    dispatch = {
        title = "Dispatch",
        description = "Browse dispatch reports",
        no_result = {title = "No reports", subtitle = "No reports found"},
        notification = {
            report_time = "Report time",
            location = "Location",
            gender = "Gender",
            citizen = "Citizen",
            responds = "Responding",
            success = 'You responded to the report',
            stoprespond = {
                success = 'Successfully stopped responding to the notification.',
                failure = 'Failed to stop responding to the notification.',
                button = 'Stop responding'
            },
            respond = {
                failure = 'Failed to respond to the notification.',
                respond = "Respond",
                label = 'Respond'
            }
        }
    },
    cases = {
        title = "Cases",
        description = "Create and review cases",
        search = "Search cases",
        incident = "Incident",
        warrant = "Warrant",
        reset = "Reset",
        form = {
            title = "Title",
            description = "Description",
            citizens = "Citizens",
            select_citizens = "Select citizens",
            doctors = "Doctors",
            select_doctors = "Select doctors",
            injuries = "Injuries",
            select_injuries = "Select injuries",
            charge = {fine = "{fine}"},
            total = {title = "Total", fine = "Fine"},
            reduction = "{value}% reduction",
            body_diagram = "Body Diagram",
            errors = {
                title = "Please enter a title",
                description = "Please enter a description",
                citizens = "Please select citizens",
                doctors = "Please select doctors",
                injuries = "Please select injuries",
                submit = "An error occurred while submitting the form"
            },
            submit = "Submit"
        },
        injuries = {
            title = "Injuries",
            fine = "Fine",
            fine_format = "{fine}$",
            custom_injury = "Add custom injury"
        }
    },
    case = {
        title = "Case #{id}",
        description = "Description",
        details = "Details",
        created = "Created",
        last_edited = "Last edited",
        by = "By",
        at = "At",
        expires_at = "Expires at",
        incident_with_warrant = "Incident created with Warrant #{warrant}",
        execute_warrant = "Execute warrant",
        save = "Save",
        cancel = "Cancel",
        title_label = "Title",
        description_label = "Description",
        sections = {
            citizens = "Citizens",
            doctors = "Doctors",
            injuries = "Injuries",
            total = "Total",
            add = "Add {section}",
            reduction = 'Reduction'
        }
    },
    settings = {
        title = "Settings",
        description = "Manage MDT preferences",
        colors = "Colors",
        color1 = "Container Background Color",
        color2 = "Content Background Color",
        color3 = "Primary Color",
        textColor = "Base Text Color",
        textColor2 = "Primary Text Color",
        borderColor = "Primary Border Color",
        resetButton = "Reset to Default",
        notifications = "Notifications",
        volume = "Volume"
    },
    notes = {
        page = {title = "Notes", description = "List of notes"},
        search = {placeholder = "Search notes"},
        form = {
            title = {label = "Title", required = "Please enter the title"},
            description = {
                label = "Description",
                required = "Please enter the description"
            },
            citizens = {
                label = "Citizens",
                required = "Please select citizens",
                placeholder = "Select citizens"
            },
            doctors = {
                label = "Doctors",
                required = "Please select doctors",
                placeholder = "Select doctors"
            },
            cases = {
                label = "Cases",
                required = "Please select cases",
                placeholder = "Select cases"
            },
            submitButton = "Submit",
            error = 'An error occurred while saving the note'
        }
    },
    note = {
        title = 'Note',
        description = 'Note details',
        details = 'Details',
        author = 'Author',
        created_at = 'Created At',
        last_edited = 'Last edited',
        by = 'By',
        at = 'At',
        delete_confirm = 'Are you sure you want to delete this note?',
        sections = {
            citizens = 'Citizens',
            doctors = 'Doctors',
            cases = 'Cases',
        }
    }
}
