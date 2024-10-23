const { createApp } = Vue
let disabled = false;
let ui = null;

const mainUI = createApp({
  data() {
    return {
      locales: {},
      killCount: 0,
      timeLeft: "Time Left 10 Min.",
      activePlayers: 0,
      airdrops: {},
    }
  },
  mounted() {
    ui = document.getElementById("airdropUi");
    window.addEventListener("message", this.messageHandler);
  },
  beforeUnmount() {
    window.removeEventListener("message", this.messageHandler);
  },
  methods: {
    messageHandler(event) {
      const data = event.data;
      switch (data.type) {
        case "show":
          if (!disabled) {
            ui.classList.remove("disabled");
          }
          if (!this.airdrops[data.airdropId]){
            this.airdrops[data.airdropId] = {}
          }
          this.activePlayers = this.airdrops[data.airdropId].activePlayers || 0;
          this.timeLeft = this.airdrops[data.airdropId].timeLeft || "Not Updated";
          this.killCount = this.airdrops[data.airdropId].killCount || 0;
          break;
        case "hide":
          ui.classList.add("disabled");
          break;
        case "toggleMenu":
          if (ui.classList.contains("disabled")) {
            disabled = false;
            ui.classList.remove("disabled");
          } else {
            disabled = true;
            ui.classList.add("disabled");
          }
          break;
        case "setLocales":
          this.locales = data.locales;
          break;
        case "setTimeLeft":
          if (!this.airdrops[data.airdropId]){
            this.airdrops[data.airdropId] = {}
          }
          this.airdrops[data.airdropId].timeLeft = data.timeLeft;
          break;
        case "setActivePlayers":
          if (!this.airdrops[data.airdropId]){
            this.airdrops[data.airdropId] = {}
          }
          this.airdrops[data.airdropId].activePlayers = data.activePlayers;
          break;
        case "setKillCount":
          if (!this.airdrops[data.airdropId]){
            this.airdrops[data.airdropId] = {}
          }
          this.airdrops[data.airdropId].killCount = data.killCount;
          break;
        case "deleteAirdrop":
          if (this.airdrops[data.airdropId]){
            this.airdrops[data.airdropId] = null;
          }
          break;
        default:
          break;
      }
    },
  },
});

mainUI.mount("#airdropUi");