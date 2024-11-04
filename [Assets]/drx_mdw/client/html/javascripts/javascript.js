Vue.use(loader)
const drx_mdw = new Vue({
    el: '#DRX_MDW',
    vuetify: new Vuetify(),
    components: { loader: loader },
    data: () => ({
        // Citizen
        ShowCitizen: false,
        // Citizen

        Open: false,
        Button: null,
        Opacity: null,
        Loaf: false,
        LoadingTimer: null,
        SelectedPage: null,
        SelectedSubPage: null,
        Pages: [],
        Charges: [],
        AvailableTags: [],
        IncidentTags: [],
        Report: {
            Tags: [],
            Categories: [],
            Search: '',
            AddTags: false,
            AddEvidence: false,
            AddOfficers: false,
            AddPersons: false,
        },
        Evidence: {
            Types: [],
            Tags: [],
            Search: '',
            AddTags: false
        },
        PoliceRoles: [],
        ShowNUI: false,
        Loading: false,
        IncidentsSearch: '',
        IncidentsResults: {},
        SelectedIncident: {
            id: null,
        },
        zIncidentAdd: 0,
        IncidentAdd: false,
        AddEvidence: false,
        AddOfficers: false,
        AddPersons: false,
        AddTags: false,
        SearchEvidence: '',
        SearchOfficers: '',
        SearchPersons: '',
        OnlineOfficers: {},
        OnlinePersons: {},
        NewIncident: [{
            title: null,
            details: null,
            evidence: [],
            officers: [],
            persons: [],
            tags: [],
        }, ],
        onlineCrims: {},
        AddCriminal: false,
        SearchCrims: '',
        SearchCrimsTags: '',
        SelectedCrimArray: [],
        selectedCriminal: false,
        AddCriminalTags: false,
        reductions: [],
        chosenReduction: '',
        chargesOverlay: false,
        chargesOverlayInfo: [],
        zchargesOverlay: 0,
        warrantArrestDateData: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
        amountMonths: 0,
        amountPoints: 0,
        fineAmount: 0,
        searchCharges: '',
        ReportsSearch: '',
        ReportsResults: {},
        zReportAdd: 2,
        ReportAdd: false,
        NewReport: [{
            category: null,
            title: null,
            details: null,
            tags: [],
            evidence: [],
            officers: [],
            persons: [],
        }],
        SelectedReport: {
            id: null,
            category: null,
            title: null,
            details: null,
            tags: [],
            evidence: [],
            officers: [],
            persons: [],
        },
        EvidenceSearch: '',
        EvidenceResults: {},
        EvidenceResultsResults: {},
        NewEvidence: [{
            type: null,
            identifier: null,
            description: null,
            image: null,
            tags: [],
        }],
        SelectedEvidence: [{
            id: null,
            type: null,
            identifier: null,
            description: null,
            image: null,
            tags: [],
        }],
        ProfilesSearch: '',
        ProfilesResults: {},
        SearchTags: '',
        SelectedProfile: {
            citizenid: null,
            id: null,
            charname: null,
            firstname: null,
            lastname: null,
            gender: null,
            phone: null,
            nationality: null,
            birthdate: null,
            note: null,
            tags: {},
            image: null,
            points: null,
            wanted: null,
            meta: {},
            jobLabel: null,
            jobGrade: null,
            history: {},
            vehicles: {},
            housing: {},
        },
        StaffSearch: '',
        StaffResults: {},
        SelectedStaff: {
            citizenid: null,
            charname: null,
            firstname: null,
            lastname: null,
            callsign: null,
            alias: null,
            phone: null,
            department: null,
            rank: null,
            image: null,
            roles: null
        },
        EditPoints: false,
        LegiAddTags: false,
        Legi: {
            AddTags: false,
            Search: '',
        },
        Legislations: [],
        LegislationTags: [],
        LegiSearch: '',
        NewLegislation: {
            title: null,
            details: null,
            tags: [],
        },
        SelectedLegislation: {
            id: null,
            title: null,
            details: null,
            tags: [],
        },
        Vehicles: [],
        VehicleTags: [],
        VehSearch: '',
        Veh: {
            Search: '',
            AddTags: false,
            AddEvidence: false,
        },
        SelectedVehicle: {
            id: null,
            fullname: null,
            citizenid: null,
            vehicle: null,
            veh_name: null,
            mods: [],
            plate: null,
            state: null,
            depotprice: null,
            note: null,
            tags: [],
            evidence: [],
        },
        RecentIncidents: {},
        RecentReports: {},
        RecentEvidence: {},

        Message: {
            Title: null,
            Text: null
        },
        ShowConfig: false,
        zShowConfig: 1,
        SelectedConfigTab: 'SETTINGS',
        ConfigTabs: ['STAFF', 'SETTINGS'],
        NewStaff: {
            citizenid: null,
            firstname: null,
            lastname: null,
            callsign: null,
            alias: null,
            phone: null,
            department: null,
            rank: null,
            image: null,
            roles: [],
        },
        Fingerprint: false,
        Officers: {},

        DashboardPage: 1,
        DashboardPages: [0, 1],

        AnoStuff: {
            SearchAnos: '',
            SearchTags: '',
            AddTags: false,
            AddImages: false,
            image: '',
        },
        Ano: {}, // Database
        Anos: {}, // Config
        NewAno: {
            Title: '',
            Text: '',
            tags: [],
            images: [],
        },
        ShowAno: false,
        SelectedAno: {
            Key: null,
            Title: '',
            Text: '',
            tags: [],
            images: [],
        },
        ChatMessages: [],
        NewMessage: '',
        You: {
            name: null,
            image: null,
        },
        EnDu: true,
        MessageRules: [
            v => !!v || 'Input required',
            v => (v && v.length <= 100) || 'Message must be less than 100 characters',
        ],

        DispatchHeaders: [],
        DispatchCalls: [],
        Units: {},
        UnitsSearch: '',
        NewUnit: {
            create: false,
            name: '',
        },
        SelectedUnit: {
            id: null,
            name: null,
            call: null,
        },
        notiSquare: true,
        notiButtonClose: true,
        notiPosition: 'top-right',
        notiColor: '#FF00FF',
        SettPositions: ['top-right', 'top-center', 'top-left', 'bottom-left', 'bottom-center', 'bottom-right'],

        StaffEmployees: [],
        StaffEmployeesData: [],
        AcademySheet: [],
        AcademySheetData: [],
        Disciplinary: [],
        DisciplinaryData: [],
        TenCodes: [],
        TenCodesData: [],
        Cmds: [],
        CMDSData: [],
        NewAcademy: {
            callsign: null,
            name: null,
        },
        NewDisciplinary: {
            citizenid: null,
            punishment: null,
            rfp: null,
        }
    }),
    //  bottom-right, top-right, top-center, top-left, bottom-left, bottom-center
    methods: {
        openNotification(title, text, icon, duration) {
            this.$vs.notification({
                square: this.notiSquare,
                buttonClose: this.notiButtonClose,
                color: this.notiColor,
                title: title,
                text: text,
                position: this.notiPosition,
                icon: icon,
                duration: duration,
            })
        },
        // Citizen
        CitizenOpenNUI() {
            this.Open = true;
            this.ShowCitizen = true;
        },
        CitizenCloseNUI() {
            this.Open = false;
            this.ShowCitizen = false;
            $.post('https://drx_mdw/citizenClose');
        },
        // Citizen
        OpenNUI(d) {
            if (this.SelectedPage == null) {
                this.SelectedPage = d.sp;
            }
            if (this.SelectedSubPage == null) {
                this.SelectedSubPage = d.ssp;
            }
            this.Pages = d.p;
            this.Charges = d.c;
            this.AvailableTags = d.at;
            this.IncidentTags = d.it;
            this.Report.Categories = d.rc;
            this.Report.Tags = d.rt;
            this.Evidence.Types = d.ety;
            this.Evidence.Tags = d.et;
            this.DispatchHeaders = d.dh;
            this.DispatchCalls = d.dp;
            this.Units = d.u;
            this.PoliceRoles = d.pr;
            this.LoadingTimer = d.lt;
            this.LegislationTags = d.lts;
            this.VehicleTags = d.vt;
            this.Fingerprint = d.fp;
            this.ChatMessages = d.cm;
            this.Message = d.m;
            this.Ano = d.cano;
            this.Anos = d.ano;
            this.RecentIncidents = d.rti;
            this.RecentReports = d.rtr;
            this.RecentEvidence = d.rte;
            this.Officers = d.o;
            this.You = d.y;
            this.EnDu = d.d;
            this.Button = d.btn;
            this.Opacity = d.opa;
            this.Loaf = d.loaf;
            for (let i = 0; i < this.PoliceRoles.length; i++) {
                let found = d.r.some(shees => shees.id === this.PoliceRoles[i].id);
                if (found) this.PoliceRoles[i].access = true;
            }
            this.Open = true;
            this.ShowNUI = true;
        },
        CloseNUI() {
            this.Open = false;
            this.ShowNUI = false;
            $.post('https://drx_mdw/close');
        },
        ChangePage(Page) {
            this.SelectedSubPage = null;
            this.SelectedPage = Page;
            $.post('https://drx_mdw/changePage', JSON.stringify({
                Page
            }))
        },
        ChangeSubPage(Page) {
            this.SelectedPage = null;
            this.SelectedSubPage = Page;
            $.post('https://drx_mdw/changeSubPage', JSON.stringify({
                Page
            }))
        },
        ChangeDuty() {
            $.post('https://drx_mdw/duty');
        },

        SaveStaffEmployee(item) {
            $.post('https://drx_mdw/saveStaffEmployee', JSON.stringify({
                item
            }))
        },
        AddToAcademySheet() {
            $.post('https://drx_mdw/addToAcademySheet', JSON.stringify({
                callsign: this.NewAcademy.callsign,
                name: this.NewAcademy.name
            }))
            this.NewAcademy = {
                callsign: null,
                name: null,
            }
        },
        DeleteFromAcademySheet(item) {
            $.post('https://drx_mdw/deleteFromAcademySheet', JSON.stringify({
                item
            }))
        },
        SaveAcademySheet(item) {
            $.post('https://drx_mdw/saveAcademySheet', JSON.stringify({
                item
            }))
        },

        AddToDisciplinary() {
            $.post('https://drx_mdw/addToDisciplinary', JSON.stringify({
                citizenid: this.NewDisciplinary.citizenid,
                punishment: this.NewDisciplinary.punishment,
                rfp: this.NewDisciplinary.rfp,
            }))
            this.NewDisciplinary = {
                citizenid: null,
                punishment: null,
                rfp: null,
            }
        },
        DeleteFromDisciplinary(item) {
            $.post('https://drx_mdw/deleteFromDisciplinary', JSON.stringify({
                item
            }))
        },
        SaveDisciplinary(item) {
            $.post('https://drx_mdw/saveDisciplinary', JSON.stringify({
                item
            }))
        },

        // DASHBOARD PAGE
        SendMessage() {
            let y = this.You
            if (this.NewMessage.length >= 1) {
                var today = new Date();
                var date = today.getDate() + '-' + (today.getMonth() + 1) + '-' + today.getFullYear();
                var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                var dateTime = date + ' ' + time;
                $.post('https://drx_mdw/saveChat', JSON.stringify({
                    y,
                    message: this.NewMessage,
                    time: dateTime
                }))
                this.NewMessage = '';
            }
        },
        // DASHBOARD PAGE

        // PROFILES PAGE
        SearchProfiles(ProfilesSearch) {
            this.Loading = true;
            $.post('https://drx_mdw/searchProfiles', JSON.stringify({
                ProfilesSearch
            }))
        },
        FetchProfile(citizenid) {
            this.Loading = true;
            $.post('https://drx_mdw/fetchProfile', JSON.stringify({
                citizenid
            }))
            if (this.SelectedPage == 0) {
                this.SelectedPage = 1;
            }
        },
        SaveProfile() {
            $.post('https://drx_mdw/saveProfile', JSON.stringify({
                citizenid: this.SelectedProfile.citizenid,
                note: this.SelectedProfile.note,
                tags: this.SelectedProfile.tags,
                image: this.SelectedProfile.image,
                points: this.SelectedProfile.points,
                wanted: this.SelectedProfile.wanted,
                meta: this.SelectedProfile.meta
            }))
        },
        UnlinkSelectedProfile() {
            this.SelectedProfile = {
                citizenid: null,
                id: null,
                charname: null,
                firstname: null,
                lastname: null,
                gender: null,
                phone: null,
                nationality: null,
                birthdate: null,
                note: null,
                tags: {},
                image: null,
                points: null,
                wanted: null,
                meta: {},
                jobLabel: null,
                jobGrade: null,
                history: {},
                vehicles: {},
                housing: {},
            }
        },
        AddTag(id, label) {
            let arr = this.SelectedProfile.tags
            const found = arr.some(tag => tag.id === id);
            if (!found) arr.push({ id: id, label: label });
        },
        RemoveTag(id) {
            const removeIndex = this.SelectedProfile.tags.findIndex(item => item.id === id);
            this.SelectedProfile.tags.splice(removeIndex, 1);
        },
        AddLicence(i) {
            if (this.SelectedProfile.citizenid) {
                this.SelectedProfile.meta.licences[i] = true;
            }
        },
        RemoveLicence(i) {
            if (this.SelectedProfile.citizenid) {
                this.SelectedProfile.meta.licences[i] = false;
            }
        },
        HousingCoords(coords) {
            $.post('https://drx_mdw/housingCoords', JSON.stringify({
                coords
            }))
        },
        ChangeWanted() {
            if (this.SelectedProfile.wanted == 1) {
                this.SelectedProfile.wanted = 0;
            } else {
                this.SelectedProfile.wanted = 1;
            }
        },
        SelectIncident(i) {
            this.FetchIncident(i)
            this.SelectedPage = 2;
        },

        // INCIDENTS PAGE   
        SearchIncidents(IncidentsSearch) {
            this.Loading = true;
            $.post('https://drx_mdw/searchIncidents', JSON.stringify({
                IncidentsSearch
            }))
        },
        FetchIncident(id) {
            this.Loading = true;
            $.post('https://drx_mdw/fetchIncident', JSON.stringify({
                id
            }))
            if (this.SelectedPage == 0) {
                this.SelectedPage = 2;
            }
        },
        SaveIncident() {
            if (this.SelectedIncident.title.length > 0 && this.SelectedIncident.details.length > 0) {
                $.post('https://drx_mdw/saveIncident', JSON.stringify({
                    id: this.SelectedIncident.id,
                    title: this.SelectedIncident.title,
                    details: this.SelectedIncident.details,
                    evidence: this.SelectedIncident.evidence,
                    officers: this.SelectedIncident.officers,
                    persons: this.SelectedIncident.persons,
                    tags: this.SelectedIncident.tags,
                    addedCrims: this.SelectedIncident.criminal,
                }))
            }
        },
        UnlinkSelectedIncident() {
            this.SelectedIncident = {
                id: null,
                title: null,
                details: null,
                evidence: {},
                officers: {},
                persons: {},
                tags: {},
                criminal: [],
            }

            this.SelectedCrimArray = [];
            this.selectedCriminal = false
        },
        convertTimestamp(time) {
            return moment(time, "DD MM YYYY hh:mm").fromNow()
        },
        CreateIncident() {
            if (this.NewIncident[0].title.length < 50) {
                let incident = this.NewIncident[0]
                let time = moment().format("DD MM YYYY hh:mm");
                if (incident.title.length > 0 && incident.details.length > 0) {
                    $.post('https://drx_mdw/createIncident', JSON.stringify({
                        id: incident.id,
                        title: incident.title,
                        details: incident.details,
                        evidence: incident.evidence,
                        officers: incident.officers,
                        persons: incident.persons,
                        tags: incident.tags,
                        addedCrims: this.SelectedCrimArray,
                        timeStamp: time,
                    }))

                    this.NewIncident = [{
                        title: null,
                        details: null,
                        evidence: [],
                        officers: [],
                        persons: [],
                        tags: [],
                    }, ]

                    this.SelectedCrimArray = [];
                    this.selectedCriminal = false
                }
            }
        },
        DeleteIncident() {
            if (this.SelectedIncident.id) {
                $.post('https://drx_mdw/deleteIncident', JSON.stringify({
                    id: this.SelectedIncident.id
                }))
                this.IncidentsResults = {};
                this.SelectedIncident = {
                    id: null,
                    title: null,
                    details: null,
                    evidence: {},
                    officers: {},
                    persons: {},
                    tags: {},
                    criminal: [],
                }

                this.SelectedCrimArray = [];
                this.selectedCriminal = false
            }
        },
        LookUpEvidence(SearchEvidence) {
            this.Loading = true;
            $.post('https://drx_mdw/searchEvidence', JSON.stringify({
                SearchEvidence
            }))
        },
        LookUpOfficers(SearchOfficers) {
            this.Loading = true;
            $.post('https://drx_mdw/searchOfficers', JSON.stringify({
                SearchOfficers
            }))
        },
        LookUpPersons(SearchPersons) {
            this.Loading = true;
            $.post('https://drx_mdw/searchPersons', JSON.stringify({
                SearchPersons
            }))
        },
        LookUpCrims(SearchCrims) {
            this.Loading = true;
            $.post('https://drx_mdw/SearchCrims', JSON.stringify({
                SearchCrims
            }))
        },
        AddEvidenceToIncident(id, identifier, description, image) {
            if (this.SelectedIncident.id) {
                let arr = this.SelectedIncident.evidence
                const found = arr.some(tag => tag.id === id);
                if (!found) arr.push({ id: id, identifier: identifier, description: description, image: image });
            } else {
                let arr = this.NewIncident[0].evidence
                const found = arr.some(tag => tag.id === id);
                if (!found) arr.push({ id: id, identifier: identifier, description: description, image: image });
            }
        },
        RemoveEvidenceFromIncident(id) {
            if (this.SelectedIncident.id) {
                const removeIndex = this.SelectedIncident.evidence.findIndex(item => item.id === id);
                this.SelectedIncident.evidence.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewIncident[0].evidence.findIndex(item => item.id === id);
                this.NewIncident[0].evidence.splice(removeIndex, 1);
            }
        },
        AddOfficerToIncident(citizenid, firstName, lastName) {
            if (this.SelectedIncident.id) {
                let arr = this.SelectedIncident.officers
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            } else {
                let arr = this.NewIncident[0].officers
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            }
        },
        RemoveOfficerFromIncident(citizenid) {
            if (this.SelectedIncident.id) {
                const removeIndex = this.SelectedIncident.officers.findIndex(item => item.citizenid === citizenid);
                this.SelectedIncident.officers.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewIncident[0].officers.findIndex(item => item.citizenid === citizenid);
                this.NewIncident[0].officers.splice(removeIndex, 1);
            }
        },
        AddPersonsToIncident(citizenid, firstName, lastName) {
            if (this.SelectedIncident.id) {
                let arr = this.SelectedIncident.persons
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            } else {
                let arr = this.NewIncident[0].persons
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            }
        },
        RemovePersonsFromIncident(citizenid) {
            if (this.SelectedIncident.id) {
                const removeIndex = this.SelectedIncident.persons.findIndex(item => item.citizenid === citizenid);
                this.SelectedIncident.persons.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewIncident[0].persons.findIndex(item => item.citizenid === citizenid);
                this.NewIncident[0].persons.splice(removeIndex, 1);
            }
        },
        AddTagToIncident(id, label) {
            if (this.SelectedIncident.id) {
                let arr = this.SelectedIncident.tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label });
            } else {
                let arr = this.NewIncident[0].tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label });
            }
        },
        RemoveTagFromIncident(id) {
            if (this.SelectedIncident.id) {
                const removeIndex = this.SelectedIncident.tags.findIndex(item => item.id === id);
                this.SelectedIncident.tags.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewIncident[0].tags.findIndex(item => item.id === id);
                this.NewIncident[0].tags.splice(removeIndex, 1);
            }
        },
        AddCriminalToIncident(citizenid, firstName, lastName) {
            if (this.SelectedIncident.id) {
                if (this.SelectedIncident.criminal.length > 0) {
                    let citizenIdArray = [];
                    for (let i = 0; i < this.SelectedIncident.criminal.length; i++) {
                        citizenIdArray.push(this.SelectedIncident.criminal[i].citizenid);
                    }

                    if (!citizenIdArray.includes(citizenid)) {
                        this.SelectedIncident.criminal.push({ citizenid: citizenid, firstname: firstName, lastname: lastName, tags: [], warrantArrestDate: '', warrantArrestMenu: false, criminalCheckbox: false, amountMonths: 0, amountPoints: 0, fineAmount: 0, pleaded: false, processed: false, showTags: false, reductions: [], chosenReduction: '' });
                    }
                } else {
                    this.SelectedIncident.criminal.push({ citizenid: citizenid, firstname: firstName, lastname: lastName, tags: [], warrantArrestDate: '', warrantArrestMenu: false, criminalCheckbox: false, amountMonths: 0, amountPoints: 0, fineAmount: 0, pleaded: false, processed: false, showTags: false, reductions: [], chosenReduction: '' });
                }
            } else {
                if (this.SelectedCrimArray.length > 0) {
                    let citizenIdArray = [];
                    for (let i = 0; i < this.SelectedCrimArray.length; i++) {
                        citizenIdArray.push(this.SelectedCrimArray[i].citizenid);
                    }

                    if (!citizenIdArray.includes(citizenid)) {
                        this.SelectedCrimArray.push({ citizenid: citizenid, firstname: firstName, lastname: lastName, tags: [], warrantArrestDate: '', warrantArrestMenu: false, criminalCheckbox: false, amountMonths: 0, amountPoints: 0, fineAmount: 0, pleaded: false, processed: false, showTags: false, reductions: [], chosenReduction: '' });
                    }
                } else {
                    this.SelectedCrimArray.push({ citizenid: citizenid, firstname: firstName, lastname: lastName, tags: [], warrantArrestDate: '', warrantArrestMenu: false, criminalCheckbox: false, amountMonths: 0, amountPoints: 0, fineAmount: 0, pleaded: false, processed: false, showTags: false, reductions: [], chosenReduction: '' });
                }
            }
        },
        DeleteCriminal(citizenid) {
            if (this.SelectedIncident.id) {
                for (var i = 0; i < this.SelectedIncident.criminal.length; i += 1) {
                    if (this.SelectedIncident.criminal[i].citizenid === citizenid) {
                        this.SelectedIncident.criminal.splice(i, 1);
                    }
                }

                if (this.SelectedIncident.criminal == "[]") {
                    this.selectedCriminal = false;
                }
            } else {
                for (var i = 0; i < this.SelectedCrimArray.length; i += 1) {
                    if (this.SelectedCrimArray[i].citizenid === citizenid) {
                        this.SelectedCrimArray.splice(i, 1);
                    }
                }

                if (this.SelectedCrimArray == "[]") {
                    this.selectedCriminal = false;
                }
            }
        },
        SaveCriminal() {
            if (this.SelectedIncident.id) {
                $.post('https://drx_mdw/saveSelectedCriminal', JSON.stringify({
                    id: this.SelectedIncident.id,
                    addedCrims: this.SelectedIncident.criminal
                }))
            } else {
                $.post('https://drx_mdw/saveSelectedCriminal', JSON.stringify({
                    id: this.SelectedIncident.id,
                    addedCrims: this.SelectedCrimArray
                }))
            }
        },

        RemoveChargeFromCriminal(id, fine, jail, points, citizenid) {
            if (this.SelectedIncident.id) {
                for (let i = 0; i < this.SelectedIncident.criminal.length; i++) {
                    if (this.SelectedIncident.criminal[i].citizenid == citizenid) {
                        const removeIndex = this.SelectedIncident.criminal[i].tags.findIndex(item => item.id === id);
                        this.SelectedIncident.criminal[i].tags.splice(removeIndex, 1);

                        this.SelectedIncident.criminal[i].fineAmount = this.SelectedIncident.criminal[i].fineAmount - fine;
                        this.SelectedIncident.criminal[i].amountMonths = this.SelectedIncident.criminal[i].amountMonths - jail;
                        this.SelectedIncident.criminal[i].amountPoints = this.SelectedIncident.criminal[i].amountPoints - points;
                    }
                }
            } else {
                for (let i = 0; i < this.SelectedCrimArray.length; i++) {
                    if (this.SelectedCrimArray[i].citizenid == citizenid) {
                        const removeIndex = this.SelectedCrimArray[i].tags.findIndex(item => item.id === id);
                        this.SelectedCrimArray[i].tags.splice(removeIndex, 1);

                        this.SelectedCrimArray[i].fineAmount = this.SelectedCrimArray[i].fineAmount - fine;
                        this.SelectedCrimArray[i].amountMonths = this.SelectedCrimArray[i].amountMonths - jail;
                        this.SelectedCrimArray[i].amountPoints = this.SelectedCrimArray[i].amountPoints - points;
                    }
                }
            }
        },
        AddChargeToCriminal(id, label, fine, jail, points, citizenid) {
            if (this.SelectedIncident.id) {
                for (let i = 0; i < this.SelectedIncident.criminal.length; i++) {
                    if (this.SelectedIncident.criminal[i].citizenid == citizenid) {
                        let arr = this.SelectedIncident.criminal[i].tags;
                        const found = arr.some(tag => tag.label === label);
                        if (!found) {
                            arr.push({ id: id, label: label, fine: fine, jail: jail, points: points, amount: 1 });
                        } else {
                            for (let j = 0; j < arr.length; j++) {
                                if (arr[j].label === label) {
                                    arr[j].amount = arr[j].amount + 1;
                                }
                            }
                        }

                        this.SelectedIncident.criminal[i].fineAmount = this.SelectedIncident.criminal[i].fineAmount + fine;
                        this.SelectedIncident.criminal[i].amountMonths = this.SelectedIncident.criminal[i].amountMonths + jail;
                        this.SelectedIncident.criminal[i].amountPoints = this.SelectedIncident.criminal[i].amountPoints + points;
                    }
                }
            } else {
                for (let i = 0; i < this.SelectedCrimArray.length; i++) {
                    if (this.SelectedCrimArray[i].citizenid == citizenid) {
                        let arr = this.SelectedCrimArray[i].tags;
                        const found = arr.some(tag => tag.label === label);
                        if (!found) {
                            arr.push({ id: id, label: label, fine: fine, jail: jail, points: points, amount: 1 });
                        } else {
                            for (let j = 0; j < arr.length; j++) {
                                if (arr[j].label === label) {
                                    arr[j].amount = arr[j].amount + 1;
                                }
                            }
                        }

                        this.SelectedCrimArray[i].fineAmount = this.SelectedCrimArray[i].fineAmount + fine;
                        this.SelectedCrimArray[i].amountMonths = this.SelectedCrimArray[i].amountMonths + jail;
                        this.SelectedCrimArray[i].amountPoints = this.SelectedCrimArray[i].amountPoints + points;
                    }
                }
            }
        },

        CalculateReduction(citizenid) {
            this.reductions = []
            this.chosenReduction = ''
            if (this.SelectedIncident.id) {
                for (let i = 0; i < this.SelectedIncident.criminal.length; i++) {
                    if (this.SelectedIncident.criminal[i].citizenid == citizenid) {
                        this.SelectedIncident.criminal[i].reductions = [];
                        this.SelectedIncident.criminal[i].chosenReduction = '';
                        let tenPer = this.SelectedIncident.criminal[i].fineAmount - ((10 / 100) * this.SelectedIncident.criminal[i].fineAmount);
                        let twentyFivePer = this.SelectedIncident.criminal[i].fineAmount - ((25 / 100) * this.SelectedIncident.criminal[i].fineAmount);
                        let fiftyPer = this.SelectedIncident.criminal[i].fineAmount - ((50 / 100) * this.SelectedIncident.criminal[i].fineAmount);
                        let SeventyFivePer = this.SelectedIncident.criminal[i].fineAmount - ((75 / 100) * this.SelectedIncident.criminal[i].fineAmount);
                        let nintyPer = this.SelectedIncident.criminal[i].fineAmount - ((90 / 100) * this.SelectedIncident.criminal[i].fineAmount);

                        let tenPerMonths = this.SelectedIncident.criminal[i].amountMonths - ((10 / 100) * this.SelectedIncident.criminal[i].amountMonths);
                        let twentyPerMonths = this.SelectedIncident.criminal[i].amountMonths - ((25 / 100) * this.SelectedIncident.criminal[i].amountMonths);
                        let fiftyPerMonths = this.SelectedIncident.criminal[i].amountMonths - ((50 / 100) * this.SelectedIncident.criminal[i].amountMonths);
                        let SeventyFivePerMonths = this.SelectedIncident.criminal[i].amountMonths - ((75 / 100) * this.SelectedIncident.criminal[i].amountMonths);
                        let nintyPerMonths = this.SelectedIncident.criminal[i].amountMonths - ((90 / 100) * this.SelectedIncident.criminal[i].amountMonths);


                        this.SelectedIncident.criminal[i].reductions.push('0% / ' + this.SelectedIncident.criminal[i].fineAmount + ' months / $' + this.SelectedIncident.criminal[i].amountMonths + ' fine', '10% / ' + tenPerMonths + ' months / $' + tenPer + ' fine', '25% / ' + twentyPerMonths + ' months / $' + twentyFivePer + ' fine', '50% / ' + fiftyPerMonths + ' months / $' + fiftyPer + ' fine', '75% / ' + SeventyFivePerMonths + ' months / $' + SeventyFivePer + ' fine', '90% / ' + nintyPerMonths + ' months / $' + nintyPer + ' fine')
                    }
                }
            } else {
                for (let i = 0; i < this.SelectedCrimArray.length; i++) {
                    if (this.SelectedCrimArray[i].citizenid == citizenid) {
                        this.SelectedCrimArray[i].reductions = [];
                        this.SelectedCrimArray[i].chosenReduction = '';
                        let tenPer = this.SelectedCrimArray[i].fineAmount - ((10 / 100) * this.SelectedCrimArray[i].fineAmount);
                        let twentyFivePer = this.SelectedCrimArray[i].fineAmount - ((25 / 100) * this.SelectedCrimArray[i].fineAmount);
                        let fiftyPer = this.SelectedCrimArray[i].fineAmount - ((50 / 100) * this.SelectedCrimArray[i].fineAmount);
                        let SeventyFivePer = this.SelectedCrimArray[i].fineAmount - ((75 / 100) * this.SelectedCrimArray[i].fineAmount);
                        let nintyPer = this.SelectedCrimArray[i].fineAmount - ((90 / 100) * this.SelectedCrimArray[i].fineAmount);

                        let tenPerMonths = this.SelectedCrimArray[i].amountMonths - ((10 / 100) * this.SelectedCrimArray[i].amountMonths);
                        let twentyPerMonths = this.SelectedCrimArray[i].amountMonths - ((25 / 100) * this.SelectedCrimArray[i].amountMonths);
                        let fiftyPerMonths = this.SelectedCrimArray[i].amountMonths - ((50 / 100) * this.SelectedCrimArray[i].amountMonths);
                        let SeventyFivePerMonths = this.SelectedCrimArray[i].amountMonths - ((75 / 100) * this.SelectedCrimArray[i].amountMonths);
                        let nintyPerMonths = this.SelectedCrimArray[i].amountMonths - ((90 / 100) * this.SelectedCrimArray[i].amountMonths);


                        this.SelectedCrimArray[i].reductions.push('0% / ' + this.SelectedCrimArray[i].amountMonths + ' months / $' + this.SelectedCrimArray[i].fineAmount + ' fine', '10% / ' + tenPerMonths + ' months / $' + tenPer + ' fine', '25% / ' + twentyPerMonths + ' months / $' + twentyFivePer + ' fine', '50% / ' + fiftyPerMonths + ' months / $' + fiftyPer + ' fine', '75% / ' + SeventyFivePerMonths + ' months / $' + SeventyFivePer + ' fine', '90% / ' + nintyPerMonths + ' months / $' + nintyPer + ' fine')
                    }
                }
            }
        },

        openChages(criminalInfo) {
            this.chargesOverlay = true;
            this.chargesOverlayInfo.push(criminalInfo);
        },

        closeCharges() {
            this.chargesOverlay = false;
            this.chargesOverlayInfo = [];
        },

        // REPORTS
        SearchReports(ReportsSearch) {
            this.Loading = true;
            $.post('https://drx_mdw/searchReports', JSON.stringify({
                ReportsSearch
            }))
        },
        FetchReport(id) {
            this.Loading = true;
            $.post('https://drx_mdw/fetchReport', JSON.stringify({
                id
            }))
            if (this.SelectedPage == 0) {
                this.SelectedPage = 3;
            }
        },
        SaveReport() {
            if (this.SelectedReport.title.length > 0 && this.SelectedReport.details.length > 0) {
                $.post('https://drx_mdw/saveReport', JSON.stringify({
                    id: this.SelectedReport.id,
                    category: this.SelectedReport.category,
                    title: this.SelectedReport.title,
                    details: this.SelectedReport.details,
                    evidence: this.SelectedReport.evidence,
                    officers: this.SelectedReport.officers,
                    persons: this.SelectedReport.persons,
                    tags: this.SelectedReport.tags
                }))
            }
        },
        UnlinkSelectedReport() {
            this.SelectedReport = {
                id: null,
                category: null,
                title: null,
                details: null,
                tags: [],
                evidence: [],
                officers: [],
                persons: [],
            }
        },
        CreateReport() {
            let report = this.NewReport[0]
            if (report.title.length > 0 && report.details.length > 0) {
                let time = moment().format("DD MM YYYY hh:mm");
                $.post('https://drx_mdw/createReport', JSON.stringify({
                    category: report.category,
                    title: report.title,
                    details: report.details,
                    tags: report.tags,
                    evidence: report.evidence,
                    officers: report.officers,
                    persons: report.persons,
                    timeStamp: time,
                }))
            }

            this.NewReport = [{
                category: null,
                title: null,
                details: null,
                tags: [],
                evidence: [],
                officers: [],
                persons: [],
            }]
        },
        DeleteReport() {
            if (this.SelectedReport.id) {
                $.post('https://drx_mdw/deleteReport', JSON.stringify({
                    id: this.SelectedReport.id
                }))
                this.ReportsResults = {};
                this.SelectedReport = {
                    id: null,
                    category: null,
                    title: null,
                    details: null,
                    tags: [],
                    evidence: [],
                    officers: [],
                    persons: [],
                }
            }
        },
        AddTagToReport(id, label, color) {
            if (this.SelectedReport.id) {
                let arr = this.SelectedReport.tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label, color: color });
            } else {
                let arr = this.NewReport[0].tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label, color: color });
            }
        },
        RemoveTagFromReport(id) {
            if (this.SelectedReport.id) {
                const removeIndex = this.SelectedReport.tags.findIndex(item => item.id === id);
                this.SelectedReport.tags.splice(removeIndex, 1)
            } else {
                const removeIndex = this.NewReport[0].tags.findIndex(item => item.id === id);
                this.NewReport[0].tags.splice(removeIndex, 1);
            }
        },
        AddEvidenceToReport(id, identifier, description, image) {
            if (this.SelectedReport.id) {
                let arr = this.SelectedReport.evidence
                const found = arr.some(tag => tag.id === id);
                if (!found) arr.push({ id: id, identifier: identifier, description: description, image: image });
            } else {
                let arr = this.NewReport[0].evidence
                const found = arr.some(tag => tag.id === id);
                if (!found) arr.push({ id: id, identifier: identifier, description: description, image: image });
            }
        },
        RemoveEvidenceFromReport(id) {
            if (this.SelectedReport.id) {
                const removeIndex = this.SelectedReport.evidence.findIndex(item => item.id === id);
                this.SelectedReport.evidence.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewReport[0].evidence.findIndex(item => item.id === id);
                this.NewReport[0].evidence.splice(removeIndex, 1);
            }
        },
        AddOfficerToReport(citizenid, firstName, lastName) {
            if (this.SelectedReport.id) {
                let arr = this.SelectedReport.officers
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            } else {
                let arr = this.NewReport[0].officers
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            }
        },
        RemoveOfficerFromReport(citizenid) {
            if (this.SelectedReport.id) {
                const removeIndex = this.SelectedReport.officers.findIndex(item => item.citizenid === citizenid);
                this.SelectedReport.officers.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewReport[0].officers.findIndex(item => item.citizenid === citizenid);
                this.NewReport[0].officers.splice(removeIndex, 1);
            }
        },
        AddPersonsToReport(citizenid, firstName, lastName) {
            if (this.SelectedReport.id) {
                let arr = this.SelectedReport.persons
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            } else {
                let arr = this.NewReport[0].persons
                const found = arr.some(tag => tag.citizenid === citizenid);
                let charName = firstName + ' ' + lastName
                if (!found) arr.push({ citizenid: citizenid, charname: charName });
            }
        },
        RemovePersonsFromReport(citizenid) {
            if (this.SelectedReport.id) {
                const removeIndex = this.SelectedReport.persons.findIndex(item => item.citizenid === citizenid);
                this.SelectedReport.persons.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewReport[0].persons.findIndex(item => item.citizenid === citizenid);
                this.NewReport[0].persons.splice(removeIndex, 1);
            }
        },


        // EVIDENCE
        SearchAllEvidence(EvidenceSearch) {
            this.Loading = true;
            $.post('https://drx_mdw/evidenceSearch', JSON.stringify({
                EvidenceSearch
            }))
        },
        FetchEvidence(id) {
            this.Loading = true;
            $.post('https://drx_mdw/fetchEvidence', JSON.stringify({
                id
            }))
            if (this.SelectedPage == 0) {
                this.SelectedPage = 4;
            }
        },
        AddTagToEvidence(id, label) {
            if (this.SelectedEvidence.id) {
                let arr = this.SelectedEvidence.tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label });
            } else {
                let arr = this.NewEvidence[0].tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label });
            }
        },
        RemoveTagFromEvidence(id) {
            if (this.SelectedEvidence.id) {
                const removeIndex = this.SelectedEvidence.tags.findIndex(item => item.id === id);
                this.SelectedEvidence.tags.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewEvidence[0].tags.findIndex(item => item.id === id);
                this.NewEvidence[0].tags.splice(removeIndex, 1);
            }
        },
        SubmitEvidence() {
            let evidence = this.NewEvidence[0]
            if (evidence.identifier.length > 0 && evidence.description.length > 0) {
                let time = moment().format("DD MM YYYY hh:mm");
                $.post('https://drx_mdw/submitEvidence', JSON.stringify({
                    type: evidence.type,
                    identifier: evidence.identifier,
                    description: evidence.description,
                    image: evidence.image,
                    tags: evidence.tags,
                    timeStamp: time,
                }))

                this.NewEvidence = [{
                    type: null,
                    identifier: null,
                    description: null,
                    image: null,
                    tags: [],
                }]
            }
        },
        DeleteEvidence() {
            if (this.SelectedEvidence.id) {
                $.post('https://drx_mdw/deleteEvidence', JSON.stringify({
                    id: this.SelectedEvidence.id
                }))
                this.EvidenceResults = {};
                this.SelectedEvidence = [{
                    id: null,
                    type: null,
                    identifier: null,
                    description: null,
                    image: null,
                    tags: [],
                }]
            }
        },
        UnlinkSelectedEvidence() {
            this.SelectedEvidence = [{
                id: null,
                type: null,
                identifier: null,
                description: null,
                image: null,
                tags: [],
            }]
        },
        SaveEvidence() {
            $.post('https://drx_mdw/saveEvidence', JSON.stringify({
                id: this.SelectedEvidence.id,
                type: this.SelectedEvidence.type,
                identifier: this.SelectedEvidence.identifier,
                description: this.SelectedEvidence.description,
                image: this.SelectedEvidence.image,
                tags: this.SelectedEvidence.tags
            }))
        },
        // EVIDENCE

        // Vehicles Page
        SearchVehicles(VehSearch) {
            this.Loading = true;
            $.post('https://drx_mdw/searchVehicles', JSON.stringify({
                VehSearch
            }))
        },
        FetchVehicle(plate) {
            this.Loading = true;
            $.post('https://drx_mdw/fetchVehicle', JSON.stringify({
                plate
            }))
            if (this.SelectedPage == 0) {
                this.SelectedPage = 5;
            }
        },
        SaveVehicle() {
            $.post('https://drx_mdw/saveVehicle', JSON.stringify({
                id: this.SelectedVehicle.id,
                note: this.SelectedVehicle.note,
                tags: this.SelectedVehicle.tags,
                evidence: this.SelectedVehicle.evidence,
            }))
        },
        UnlinkSelectedVehicle() {
            this.SelectedVehicle = {
                id: null,
                fullname: null,
                citizenid: null,
                vehicle: null,
                veh_name: null,
                mods: [],
                plate: null,
                state: null,
                depotprice: null,
                note: null,
                tags: [],
                evidence: [],
            }
        },
        AddTagToVehicle(id, label) {
            let arr = this.SelectedVehicle.tags
            const found = arr.some(tag => tag.label === label);
            if (!found) arr.push({ id: id, label: label });
        },
        RemoveTagFromVehicle(id) {
            const removeIndex = this.SelectedVehicle.tags.findIndex(item => item.id === id);
            this.SelectedVehicle.tags.splice(removeIndex, 1)
        },
        AddEvidenceToVehicle(id, identifier, description, image) {
            let arr = this.SelectedVehicle.evidence
            const found = arr.some(tag => tag.id === id);
            if (!found) arr.push({ id: id, identifier: identifier, description: description, image: image });
        },
        RemoveEvidenceFromVehicle(id) {
            const removeIndex = this.SelectedVehicle.evidence.findIndex(item => item.id === id);
            this.SelectedVehicle.evidence.splice(removeIndex, 1);
        },
        // Vehicles Page

        // DISPATCH
        LinkCall(item) {
            if (this.SelectedUnit.id != null) {
                this.Loading = true;
                $.post('https://drx_mdw/linkCall', JSON.stringify({
                    item,
                    sc: this.SelectedUnit
                }))
            }
        },
        UnlinkCall(item) {
            if (this.SelectedUnit.id != null) {
                this.Loading = true;
                $.post('https://drx_mdw/unlinkCall', JSON.stringify({
                    item,
                    sc: this.SelectedUnit
                }))
            }
        },
        LocationCall(item) {
            if (this.SelectedUnit.id != null) {
                $.post('https://drx_mdw/locationCall', JSON.stringify({
                    item
                }))
            }
        },
        DeleteCall(item) {
            if (this.SelectedUnit.id != null) {
                $.post('https://drx_mdw/deleteCall', JSON.stringify({
                    item
                }))
            }
        },
        CreateUnit() {
            if (this.NewUnit.name) {
                this.Loading = true;
                $.post('https://drx_mdw/createUnit', JSON.stringify({
                    v: this.NewUnit
                }))
                this.NewUnit = {
                    create: false,
                    name: '',
                };
            }
        },
        SelectUnit(v) {
            if (v.id) {
                this.Loading = true;
                $.post('https://drx_mdw/selectUnit', JSON.stringify({
                    v
                }))
            }
        },
        LeaveUnit(v) {
            if (v.id) {
                this.Loading = true;
                $.post('https://drx_mdw/leaveUnit', JSON.stringify({
                    v
                }))
            }
        },
        DeleteUnit(v) {
            if (v.id) {
                this.Loading = true;
                $.post('https://drx_mdw/deleteUnit', JSON.stringify({
                    v
                }))
            }
        },
        // DISPATCH

        // LEGISLATION
        LegislationSearch(LegiSearch) {
            this.Loading = true;
            $.post('https://drx_mdw/searchLegislations', JSON.stringify({
                LegiSearch
            }))
        },
        FetchLegislation(id) {
            this.Loading = true;
            $.post('https://drx_mdw/fetchLegislation', JSON.stringify({
                id
            }))
        },
        CreateLegislation() {
            if (this.NewLegislation.title.length > 0 && this.NewLegislation.details.length > 0) {
                $.post('https://drx_mdw/createLegislation', JSON.stringify({
                    title: this.NewLegislation.title,
                    details: this.NewLegislation.details,
                    tags: this.NewLegislation.tags,
                }))

                this.NewLegislation = {
                    title: null,
                    details: null,
                    tags: [],
                }
            }
        },
        DeleteLegislation() {
            if (this.SelectedLegislation.id) {
                $.post('https://drx_mdw/deleteLegislation', JSON.stringify({
                    id: this.SelectedLegislation.id
                }))
                this.Legislations = [];
                this.SelectedLegislation = [{
                    id: null,
                    title: null,
                    details: null,
                    tags: [],
                }]
            }
        },
        UnlinkSelectedLegislation() {
            this.SelectedLegislation = [{
                id: null,
                title: null,
                details: null,
                tags: [],
            }]
        },
        SaveLegislation() {
            $.post('https://drx_mdw/saveLegislation', JSON.stringify({
                id: this.SelectedLegislation.id,
                title: this.SelectedLegislation.title,
                details: this.SelectedLegislation.details,
                tags: this.SelectedLegislation.tags
            }))
        },
        AddTagToLegislation(id, label) {
            if (this.SelectedLegislation.id) {
                let arr = this.SelectedLegislation.tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label });
            } else {
                let arr = this.NewLegislation.tags
                const found = arr.some(tag => tag.label === label);
                if (!found) arr.push({ id: id, label: label });
            }
        },
        RemoveTagFromLegislation(id) {
            if (this.SelectedLegislation.id) {
                const removeIndex = this.SelectedLegislation.tags.findIndex(item => item.id === id);
                this.SelectedLegislation.tags.splice(removeIndex, 1)
            } else {
                const removeIndex = this.NewLegislation.tags.findIndex(item => item.id === id);
                this.NewLegislation.tags.splice(removeIndex, 1)
            }
        },


        // STAFF
        SearchStaffs(StaffSearch) {
            this.Loading = true;
            $.post('https://drx_mdw/staffSearch', JSON.stringify({
                StaffSearch
            }))
        },
        FetchStaff(citizenid) {
            this.Loading = true;
            $.post('https://drx_mdw/fetchStaff', JSON.stringify({
                citizenid
            }))
        },
        SaveStaff() {
            $.post('https://drx_mdw/saveStaff', JSON.stringify({
                citizenid: this.SelectedStaff.citizenid,
                callsign: this.SelectedStaff.callsign,
                alias: this.SelectedStaff.alias,
                department: this.SelectedStaff.department,
                rank: this.SelectedStaff.rank,
                image: this.SelectedStaff.image,
                roles: this.SelectedStaff.roles
            }))
        },
        UnlinkSelectedStaff() {
            this.SelectedStaff = {}
        },
        ChangeRole(role) {
            this.SelectedStaff.roles = role;
        },
        FireTheCunt() {
            if (this.SelectedStaff.citizenid) {
                $.post('https://drx_mdw/fireTheCunt', JSON.stringify({
                    citizenid: this.SelectedStaff.citizenid
                }))
            }
        },
        // STAFF

        // CONFIG
        ChangeConfigTab(Tab) {
            this.SelectedConfigTab = Tab;
        },
        NewStaffAddRole(id, role) {
            let arr = this.NewStaff.roles
            const found = arr.some(tag => tag.id === id);
            if (!found) arr.push({ id: id, access: true, role: role });
        },
        NewStaffRemoveRole(id) {
            const removeIndex = this.NewStaff.roles.findIndex(item => item.id === id);
            this.NewStaff.roles.splice(removeIndex, 1);
        },
        AddStaffRole(id, role) {
            if (this.SelectedStaff.citizenid) {
                let arr = this.SelectedStaff.roles
                const found = arr.some(tag => tag.id === id);
                if (!found) arr.push({ id: id, access: true, role: role });
            }
        },
        RemoveStaffRole(id) {
            if (this.SelectedStaff.citizenid) {
                const removeIndex = this.SelectedStaff.roles.findIndex(item => item.id === id);
                this.SelectedStaff.roles.splice(removeIndex, 1);
            }
        },
        ClearHiring() {
            this.NewStaff = {
                citizenid: null,
                firstname: null,
                lastname: null,
                callsign: null,
                alias: null,
                phone: null,
                department: null,
                rank: null,
                image: null,
                roles: [],
            }
        },
        HireTheCunt() {
            let arr = this.NewStaff
            if (arr.citizenid && arr.firstname && arr.lastname && arr.callsign && arr.alias && arr.phone && arr.department && arr.rank && arr.image) {
                $.post('https://drx_mdw/hireTheCunt', JSON.stringify({
                    citizenid: arr.citizenid,
                    firstname: arr.firstname,
                    lastname: arr.lastname,
                    callsign: arr.callsign,
                    alias: arr.alias,
                    phone: arr.phone,
                    department: arr.department,
                    rank: arr.rank,
                    image: arr.image,
                    roles: arr.roles
                }))
                this.NewStaff = {
                    citizenid: null,
                    firstname: null,
                    lastname: null,
                    callsign: null,
                    alias: null,
                    phone: null,
                    department: null,
                    rank: null,
                    image: null,
                    roles: [],
                }
            }
        },
        SaveMessage() {
            $.post('https://drx_mdw/saveMessage', JSON.stringify({
                v: this.Message
            }))
        },
        AddTagToAno(id, label) {
            if (this.SelectedAno.Title) {
                let arr = this.SelectedAno.tags
                const found = arr.some(tag => tag.id === id);
                if (!found) arr.push({ id: id, label: label });
            } else {
                let arr = this.NewAno.tags
                const found = arr.some(tag => tag.id === id);
                if (!found) arr.push({ id: id, label: label });
            }
        },
        RemoveTagFromAno(id) {
            if (this.SelectedAno.Title) {
                const removeIndex = this.SelectedAno.tags.findIndex(item => item.id === id);
                this.SelectedAno.tags.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewAno.tags.findIndex(item => item.id === id);
                this.NewAno.tags.splice(removeIndex, 1);
            }
        },
        AssignImageToAno(src) {
            if (this.SelectedAno.Title) {
                let arr = this.SelectedAno.images
                const found = arr.some(tag => tag.src === src);
                if (!found) arr.push({ src: src });
            } else {
                let arr = this.NewAno.images
                const found = arr.some(tag => tag.src === src);
                if (!found) arr.push({ src: src });
            }
        },
        RemoveImageFromAno(src) {
            if (this.SelectedAno.Title) {
                const removeIndex = this.SelectedAno.images.findIndex(item => item.src === src);
                this.SelectedAno.images.splice(removeIndex, 1);
            } else {
                const removeIndex = this.NewAno.images.findIndex(item => item.src === src);
                this.NewAno.images.splice(removeIndex, 1);
            }
        },
        PostAnnouncement() {
            if (this.NewAno.Title.length >= 1) {
                $.post('https://drx_mdw/postAnnouncement', JSON.stringify({
                    v: this.NewAno
                }))
            }
        },
        RemoveAnnouncement() {
            if (this.SelectedAno.Title) {
                $.post('https://drx_mdw/removeAnnouncement', JSON.stringify({
                    v: this.SelectedAno
                }))
            }
            this.UnlinkAnnouncement();
        },
        SaveAnnouncement() {
            if (this.SelectedAno.Title) {
                $.post('https://drx_mdw/saveAnnouncement', JSON.stringify({
                    v: this.SelectedAno
                }))
            }
            this.UnlinkAnnouncement();
        },
        SelectAnnouncement(v) {
            this.SelectedAno = {
                Key: v.Key,
                Title: v.Title,
                Text: v.Text,
                tags: v.tags,
                images: v.images,
            }
            this.ShowAno = true;
        },
        UnlinkAnnouncement() {
            this.ShowAno = false;
            this.SelectedAno = {
                Key: null,
                Title: '',
                Text: '',
                tags: [],
                images: [],
            };
        },
        // CONFIG
    },
    computed: {
        FilterTags() { return this.IncidentTags.filter((tags) => { return this.SearchTags.toLowerCase().split(' ').every(v => tags.label.toLowerCase().includes(v)) }) },
        FilterCrimTags() { return this.CrimTags.filter((crimTags) => { return this.SearchCrimsTags.toLowerCase().split(' ').every(v => crimTags.label.toLowerCase().includes(v)) }) },
        FilterCharges() { if (this.searchCharges) { return this.Charges.filter(charge => { return this.searchCharges.toLowerCase().split(" ").every(v => charge.Label.toLowerCase().includes(v)); }); } else { return this.Charges; } },
        FilterReportTags() { return this.Report.Tags.filter((tags) => { return this.Report.Search.toLowerCase().split(' ').every(v => tags.label.toLowerCase().includes(v)) }) },
        FilterEvidenceTags() { return this.Evidence.Tags.filter((tags) => { return this.Evidence.Search.toLowerCase().split(' ').every(v => tags.label.toLowerCase().includes(v)) }) },
        FilterVehicleTags() { return this.VehicleTags.filter((tags) => { return this.Veh.Search.toLowerCase().split(' ').every(v => tags.label.toLowerCase().includes(v)) }) },
        FilterLegiTags() { return this.LegislationTags.filter((tags) => { return this.Legi.Search.toLowerCase().split(' ').every(v => tags.label.toLowerCase().includes(v)) }) },
        FilterAnoTags() { return this.Ano.Tags.filter((tags) => { return this.AnoStuff.SearchTags.toLowerCase().split(' ').every(v => tags.label.toLowerCase().includes(v)) }) },
        FilterAnos() { return this.Anos.filter((t) => { return this.AnoStuff.SearchAnos.toLowerCase().split(' ').every(v => t.Title.toLowerCase().includes(v)) }) },
        FilterUnits() { return this.Units.filter((t) => { return this.UnitsSearch.toLowerCase().split(' ').every(v => t.name.toLowerCase().includes(v)) }) },
    },

    watch: {
        notiSquare(val) {
            localStorage.notiSquare = val;
        },
        notiButtonClose(val) {
            localStorage.notiButtonClose = val;
        },
        notiPosition(val) {
            localStorage.notiPosition = val;
        },
        notiColor(val) {
            localStorage.notiColor = val;
        }
    },

    mounted() {
        if (localStorage.notiSquare) this.notiSquare = localStorage.notiSquare;
        if (localStorage.notiButtonClose) this.notiButtonClose = localStorage.notiButtonClose;
        if (localStorage.notiPosition) this.notiPosition = localStorage.notiPosition;
        if (localStorage.notiColor) this.notiColor = localStorage.notiColor;

    }
})

document.onreadystatechange = () => {
    if (document.readyState == 'complete') {
        window.addEventListener('message', (event) => {
            var drx = event.data;
            // Citizen
            if (drx.CitizenOpen) { drx_mdw.CitizenOpenNUI() }
            if (drx.CitizenClose) { drx_mdw.CitizenCloseNUI() }
            // Citizen
            if (drx.Open) { drx_mdw.OpenNUI(drx.d) }
            if (drx.Close) { drx_mdw.CloseNUI() }
            if (drx.update == 'returnRecents') { drx_mdw.RecentIncidents = drx_mdw.RecentReports = drx_mdw.RecentEvidence = drx.re }
            // DASHBOARD PAGE
            if (drx.update == 'updateChat') { drx_mdw.ChatMessages = drx.result; }
            if (drx.update == 'updateAnnouncements') { drx_mdw.Anos = drx.result; }
            // DASHBOARD PAGE

            // PROFILES PAGE
            if (drx.update == 'returnProfiles') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.ProfilesResults = drx.ProfilesResults
                    }, drx_mdw.LoadingTimer);
                }
            }
            if (drx.update == 'returnProfile') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedProfile = {
                            citizenid: drx.result.citizenid,
                            id: drx.result.id,
                            charname: drx.result.firstname + ' ' + drx.result.lastname,
                            firstname: drx.result.firstname,
                            lastname: drx.result.lastname,
                            gender: drx.result.gender,
                            phone: drx.result.phone,
                            nationality: drx.result.nationality,
                            birthdate: drx.result.birthdate,
                            note: drx.result.note,
                            tags: drx.result.tags,
                            image: drx.result.image,
                            points: drx.result.points,
                            wanted: drx.result.wanted,
                            meta: drx.result.meta,
                            jobLabel: drx.result.jobLabel,
                            jobGrade: drx.result.jobGrade,
                            history: drx.result.history,
                            vehicles: drx.vehicles,
                            housing: drx.housing
                        }
                    }, drx_mdw.LoadingTimer);
                }
            }
            // PROFILES PAGE
            // INCIDENTS PAGE
            if (drx.update == 'returnIncidents') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.IncidentsResults = drx.IncidentsResults
                    }, drx_mdw.LoadingTimer);
                }
            }
            if (drx.update == 'returnIncident') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedCrimArray = []
                        drx_mdw.selectedCriminal = false
                        drx_mdw.SelectedIncident = {
                            id: drx.result.id,
                            title: drx.result.title,
                            details: drx.result.details,
                            evidence: drx.result.evidence,
                            officers: drx.result.officers,
                            persons: drx.result.persons,
                            tags: drx.result.tags,
                            criminal: drx.result.addedCrims
                        }
                    }, drx_mdw.LoadingTimer);
                }
            }
            if (drx.update == 'returnOfficers') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.OnlineOfficers = drx.onlineOfficers
                    }, drx_mdw.LoadingTimer);
                }
            }
            if (drx.update == 'returnPersons') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.OnlinePersons = drx.onlinePersons
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'returnCrims') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.onlineCrims = drx.onlineCrims
                    }, drx_mdw.LoadingTimer);
                }
            }
            // INCIDENTS PAGE

            // REPORTS PAGE
            if (drx.update == 'returnReports') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.ReportsResults = drx.ReportsResults
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'returnReport') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedReport = {
                            id: drx.result.id,
                            category: drx.result.category,
                            title: drx.result.title,
                            details: drx.result.details,
                            tags: drx.result.tags,
                            evidence: drx.result.evidence,
                            officers: drx.result.officers,
                            persons: drx.result.persons,
                        };
                    }, drx_mdw.LoadingTimer);
                }
            }
            // REPORTS PAGE

            // EVIDENCE PAGE
            if (drx.update == 'returnAllEvidence') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.EvidenceResults = drx.EvidenceResults
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'returnAllEvidenceEvidence') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.EvidenceResultsResults = drx.EvidenceResultsResults
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'returnEvidence') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedEvidence = {
                            id: drx.result.id,
                            type: drx.result.type,
                            identifier: drx.result.identifier,
                            description: drx.result.description,
                            image: drx.result.image,
                            tags: drx.result.tags,
                        }
                    }, drx_mdw.LoadingTimer);
                }
            }
            // EVIDENCE PAGE

            // VEHICLES PAGE
            if (drx.update == 'returnVehicles') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.Vehicles = drx.result
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'returnVehicle') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedVehicle = {
                            id: drx.result.id,
                            fullname: drx.result.fullname,
                            citizenid: drx.result.citizenid,
                            vehicle: drx.result.vehicle,
                            veh_name: drx.result.veh_name,
                            mods: drx.result.mods,
                            plate: drx.result.plate,
                            state: drx.result.state,
                            depotprice: drx.result.depotprice,
                            note: drx.result.note,
                            tags: drx.result.tags,
                            evidence: drx.result.evidence,
                        }
                    }, drx_mdw.LoadingTimer);
                }
            }
            // VEHICLES PAGE

            // DISPATCH PAGE
            if (drx.update == 'returnCalls') {
                drx_mdw.DispatchCalls = drx.DispatchCalls
            }
            if (drx.update == 'updateUnits') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.Units = drx.Units
                    }, drx_mdw.LoadingTimer);
                }
            }
            if (drx.update == 'updateUserUnit') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedUnit.id = drx.data.id;
                        drx_mdw.SelectedUnit.name = drx.data.name;
                        drx_mdw.SelectedUnit.call = drx.data.call;
                    }, drx_mdw.LoadingTimer);
                }
            }
            if (drx.update == 'sendDispatchCalls') {
                drx_mdw.DispatchCalls = drx.DispatchCalls
            }
            // DISPATCH PAGE

            // CHARGES PAGE
            if (drx.update == 'sendCharges') {
                drx_mdw.Charges = drx.charges
            }
            // CHARGES PAGE

            // LEGISLATION PAGE
            if (drx.update == 'returnLegislations') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.Legislations = drx.Legislations
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'returnLegislation') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedLegislation = {
                            id: drx.result.id,
                            title: drx.result.title,
                            details: drx.result.details,
                            tags: drx.result.tags,
                        }
                    }, drx_mdw.LoadingTimer);
                }
            }
            // LEGISLATION PAGE

            // STAFF
            if (drx.update == 'returnStaffs') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.StaffResults = drx.StaffResults
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'returnStaff') {
                if (drx_mdw.Loading) {
                    setTimeout(() => {
                        drx_mdw.Loading = false;
                        drx_mdw.SelectedStaff = {
                            citizenid: drx.result.citizenid,
                            charname: drx.result.firstname + ' ' + drx.result.lastname,
                            firstname: drx.result.firstname,
                            lastname: drx.result.lastname,
                            callsign: drx.result.callsign,
                            alias: drx.result.alias,
                            phone: drx.result.phone,
                            department: drx.result.department,
                            rank: drx.result.rank,
                            image: drx.result.image,
                            roles: drx.result.roles
                        }
                    }, drx_mdw.LoadingTimer);
                }
            }

            if (drx.update == 'sendStaffEmployees') {
                drx_mdw.StaffEmployeesData = drx.result;
                drx_mdw.StaffEmployees = drx.StaffEmployees;
            }

            if (drx.update == 'sendAcademySheet') {
                drx_mdw.AcademySheetData = drx.result;
                drx_mdw.AcademySheet = drx.AcademySheet;
            }

            if (drx.update == 'sendDisciplinary') {
                drx_mdw.DisciplinaryData = drx.result;
                drx_mdw.Disciplinary = drx.Disciplinary;
            }

            if (drx.update == 'sendTenCmd') {
                drx_mdw.TenCodes = drx.TenCodes;
                drx_mdw.TenCodesData = drx.TenCodesData;
                drx_mdw.Cmds = drx.Cmds;
                drx_mdw.CMDSData = drx.CMDSData;
            }
            // STAFF
            if (drx.update == 'sendNotify') {
                drx_mdw.openNotification(drx.title, drx.text, drx.icon, drx.duration)
            }

            document.onkeyup = function(data) {
                if (data.which == 27) {
                    if (drx_mdw.ShowNUI) {
                        drx_mdw.CloseNUI();
                    } else {
                        drx_mdw.CitizenCloseNUI();
                    }
                }
                if (data.which == drx_mdw.Button) {
                    if (document.getElementById('DRX_MDW').style.opacity == drx_mdw.Opacity) {
                        document.getElementById('DRX_MDW').style.opacity = 1;
                    } else {
                        document.getElementById('DRX_MDW').style.opacity = drx_mdw.Opacity;
                    }
                }
            };
        });
    };
};